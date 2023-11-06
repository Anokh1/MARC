import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/general_information_tile.dart';
import 'package:marc/components/my_big_button.dart';
import 'package:marc/pages/home_page.dart';
import 'package:marc/pages/remove_number_plate_page.dart';

class NumberPlateTermsPage extends StatefulWidget {
  const NumberPlateTermsPage({super.key, required this.newNumberPlate});

  final String newNumberPlate;

  @override
  State<NumberPlateTermsPage> createState() => _NumberPlateTermsPageState();
}

class _NumberPlateTermsPageState extends State<NumberPlateTermsPage> {
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

      // to prevent from coming back to here
      Navigator.pop(context);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
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
      body: Center(
          // the number plate does not belong to another user
          // this number plate can be used
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.newNumberPlate,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF86F03))),
              Text(
                " belongs to you now.",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Please read the terms and conditions below.",
            style: TextStyle(fontSize: 14),
          ),

          const SizedBox(
            height: 6,
          ),
          GeneralInformationTile(
              number: "1", text: "You are the owner of this number plate."),
          GeneralInformationTile(
              number: "2", text: "This number plate cannot be shared."),
          GeneralInformationTile(
              number: "3", text: "This number plate can be removed."),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Learn more: "),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RemoveNumberPlatePage();
                      },
                    ),
                  );
                },
                child: Text(
                  "How to remove number plate?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(
            height: 30,
          ),
          MyBigButton(
              // onTap: updateMotorcycle,
              onTap: updateMotorcycle,
              text: "O K",
              color: Color(0xFFCF0A0A))

          // after this button is pressed
          // there is a bug
          // where another screen will appear very fast
          // but it does not affect the performance

          // this bug has been fixed
          // with the addition of this page :D
        ],
      )),
    );
  }
}
