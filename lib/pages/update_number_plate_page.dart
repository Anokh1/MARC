import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/my_big_button.dart';
import 'package:marc/pages/home_page.dart';
import 'package:marc/pages/number_plate_terms_page.dart';

class UpdateNumberPlatePage extends StatefulWidget {
  const UpdateNumberPlatePage({super.key, required this.newNumberPlate});

  final String newNumberPlate;

  @override
  State<UpdateNumberPlatePage> createState() => _UpdateNumberPlatePageState();
}

class _UpdateNumberPlatePageState extends State<UpdateNumberPlatePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  // all users
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context) {
    Future<void> updateMotorcycle() async {
      await usersCollection
          .doc(currentUser.email)
          .update({'numberPlate': widget.newNumberPlate});
      await FirebaseFirestore.instance
          .collection("Motorcycle")
          .doc(widget.newNumberPlate)
          .set({
        "numberPlate": widget.newNumberPlate,
        "ownerEmail": currentUser.email,
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
          // builder: (context) => NumberPlatePage(),
        ),
      );
    }

    void showTerms() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NumberPlateTermsPage(newNumberPlate: widget.newNumberPlate)),
      );
    }

    Future<void> updateExistingNumberPlate() async {
      // update the user's number plate
      await usersCollection
          .doc(currentUser.email)
          .update({'numberPlate': widget.newNumberPlate});

      // to prevent from coming back to here
      Navigator.pop(context);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }

    void showHomePage() {
      // to prevent from coming back to here
      Navigator.pop(context);
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            "M A R C",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Motorcycle")
              .doc(widget.newNumberPlate)
              .snapshots(),
          builder: (((context, snapshot) {
            if (snapshot.hasData && snapshot.data!.data() == null) {
              return Center(
                  // the number plate does not belong to another user
                  // this number plate can be used
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.newNumberPlate,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF86F03)),
                      ),
                      Text(
                        " belongs to you now.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Image.asset('lib/images/motorcycle.png'),
                  const SizedBox(
                    height: 6,
                  ),
                  MyBigButton(
                      // onTap: updateMotorcycle,
                      onTap: showTerms,
                      text: "O K",
                      color: Color(0xFFCF0A0A))

                  // after this button is pressed
                  // there is a bug
                  // where another screen will appear very fast
                  // but it does not affect the performance
                ],
              ));
            } else {
              // } else if (snapshot.hasData && snapshot.data!.data() != null) {

              if (snapshot.hasData && snapshot.data!.data() != null) {
                final numberPlateData =
                    snapshot.data!.data() as Map<String, dynamic>;

                // the number plate belongs to you
                if (currentUser.email == numberPlateData["ownerEmail"] &&
                    widget.newNumberPlate == numberPlateData["numberPlate"]) {
                  return Center(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            numberPlateData["numberPlate"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF17BC86),
                                fontSize: 16),
                          ),
                          Text(
                            " belongs to you.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Column(
                        children: [
                          Text(
                            numberPlateData["ownerEmail"],
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            " is the owner of the number plate.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Image.asset('lib/images/good.png'),
                      const SizedBox(
                        height: 26,
                      ),
                      MyBigButton(
                          onTap: updateExistingNumberPlate,
                          text: "O K",
                          color: Color(0xFFCF0A0A))
                    ],
                  ));
                } else if (currentUser.email != numberPlateData["ownerEmail"]) {
                  return Center(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            numberPlateData["numberPlate"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFCF0A0A),
                                fontSize: 16),
                          ),
                          Text(
                            " is unavailable.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text("You are not the owner of the number plate."),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset('lib/images/cross.png'),
                      const SizedBox(
                        height: 20,
                      ),
                      MyBigButton(
                          onTap: showHomePage,
                          text: "O K",
                          color: Color(0xFFCF0A0A))
                    ],
                  ));
                }
              }
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
        ));
  }
}
