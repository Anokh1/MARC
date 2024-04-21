import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/my_giant_card.dart';
import 'package:marc/components/parking_lot_tile.dart';
import 'package:marc/pages/parking_lot_information_page.dart';

class ParkingLotPage extends StatefulWidget {
  const ParkingLotPage({
    super.key,
  });

  @override
  State<ParkingLotPage> createState() => _ParkingLotPageState();
}

class _ParkingLotPageState extends State<ParkingLotPage> {
  // user
  // get current user authentication information (email and password?)
  final currentUser = FirebaseAuth.instance.currentUser!;

  // all users
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  void parkingLotDialog(title, information, color) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            title: Text(
              title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Color(color)),
            ),
            content: Text(information),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'O K',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        });
  }

  String rainInformation = "";

  // void getRainInformation() async {
  //   DatabaseReference rainRef = FirebaseDatabase.instance.ref().child('gurneyParagonCamera/rain');
  //   final snapshot = await rainRef.get();
  //   if (snapshot.exists) {
  //     rainInformation = snapshot.value.toString();
  //   } else {
  //     debugPrint("No rain status");
  //   }
  // }

  void checkParkingStatus(userParkingLotStatus, parkingLotName) {
    // getRainInformation();
    if (userParkingLotStatus == true) {
      parkingLotDialog(
          "Card obtained",
          "You have purchased this card for today. No duplicate cards are allowed. Thank you.",
          0xFFFF0303);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ParkingLotInformationPage(
            currentParking: parkingLotName,
            currentRain: rainInformation,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            "M A R C",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        // put back button here
        // it was there already :D

        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(currentUser.email)
              .snapshots(),
          builder: ((context, snapshot) {
            // get
            if (snapshot.hasData) {
              // this is just for fun
              // could be deleted in the future
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              var queensbayMallStatus = userData['queensbayMall'];
              var gurneyPlazaStatus = userData['gurneyPlaza'];
              var gurneyParagonStatus = userData['gurneyParagon'];
              var pranginMallStatus = userData['pranginMall'];

              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 215.0),
                        // I don't thunk this is necessary
                        // to display the wallet balance
                        // child: MyTopUpButton(),
                      ),
                      const SizedBox(
                        height: 14,
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      // go to parking lot page

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ParkingLotTile(
                              onTap: () => checkParkingStatus(
                                  // widget.gurneyParagonStatus, "gurneyParagon"),
                                  gurneyParagonStatus,
                                  "gurneyParagon"),
                              color: Colors.white,
                              // now the image is stored locally
                              // need to retrieve from Cloud Firestore
                              // maybe not doing... too much work
                              image: 'lib/images/gurney_paragon_logo.png'),
                          const SizedBox(
                            width: 15,
                          ),
                          ParkingLotTile(
                              onTap: () => checkParkingStatus(
                                  gurneyPlazaStatus, "gurneyPlaza"),
                              color: Colors.white,
                              image: 'lib/images/gurney_plaza_logo.png'),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ParkingLotTile(
                              onTap: () => checkParkingStatus(
                                  pranginMallStatus, "pranginMall"),
                              color: Colors.white,
                              image: 'lib/images/prangin_mall_logo.png'),
                          const SizedBox(
                            width: 15,
                          ),
                          ParkingLotTile(
                              onTap: () => checkParkingStatus(
                                  queensbayMallStatus, "queensbayMall"),
                              color: Colors.white,
                              image: 'lib/images/queensbay_mall_logo.png'),
                        ],
                      ),
                      const SizedBox(
                        height: 80,
                      ),

                      // GiantCard(
                      //     color: Colors.white,
                      //     image: 'lib/images/queensbay_mall_logo.png')
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ));
  }
}
