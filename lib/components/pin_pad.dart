import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/pin_tile.dart';
import 'package:marc/helper/helper_methods.dart';
import 'package:marc/pages/home_page.dart';

class PinPad extends StatefulWidget {
  const PinPad(
      {super.key,
      required this.parkingFee,
      required this.credit,
      required this.pin,
      required this.plateNumber,
      required this.name,
      required this.parkingName,
      required this.parkingNameCollection});

  final String parkingFee;
  final String credit;
  final String pin;
  final String plateNumber;
  final String name;
  final String parkingName;
  final String parkingNameCollection;

  @override
  State<PinPad> createState() => _PinPadState();
}

class _PinPadState extends State<PinPad> {
  // user
  // get current user authentication information (email and password?)
  final currentUser = FirebaseAuth.instance.currentUser!;

  // all users
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  // to store the PIN entered by user
  String userPin = "";

  double firstPinWidth = 2;
  double secondPinWidth = 2;
  double thirdPinWidth = 2;
  double fourthPinWidth = 2;
  double fifthPinWidth = 2;
  double sixthPinWidth = 2;

  void checkPin() {
    // need to confirm that the PIN matches
    // before deducting the user's credit

    // need to store information in the correct
    // motorcycle parking collection
    // need the motorcycle parking collection name

    // data to be stored in
    // motorcycle parking collection
    // entered, numberPlate, username

    // date time to be added later
    // because of complexity
    // 9/9/2023

    // add alert dialog
    // tomorrow (10/9/2023)

    // need to confirm that the PIN matches
    // before deducting the user's credit
    if (userPin == widget.pin) {
      var newCredit =
          double.parse(widget.credit) - double.parse(widget.parkingFee);
      var stringNewCredit = newCredit.toStringAsFixed(2);
      // there could be error here
      // if i am storing a String with .00
      // will the toStringPrefix(2) works? no it doesn't work 12/09/2023

      // update the user's credit
      usersCollection
          .doc(currentUser.email)
          .update({'credit': stringNewCredit});

      // for the app to identify whether the user have purchased which card
      // no duplicate cards allow
      var currentParkingName = widget.parkingNameCollection.toString();
      var currentParkingDate = widget.parkingNameCollection.toString() + "Date";

      usersCollection.doc(currentUser.email).update({currentParkingName: true});

      usersCollection
          .doc(currentUser.email)
          .update({currentParkingDate: formatDate(Timestamp.now())});

      var newParkingName = widget.parkingNameCollection + "Motorcycle";

      // create receipt document
      usersCollection.doc(currentUser.email).collection("receipt").add({
        "date": Timestamp.now(), // this data is complicated
        "numberPlate": widget.plateNumber,
        "paymentAmount": widget.parkingFee,
        "paymentName": widget.parkingName,
        "paymentStatus": "success",
        "paymentType": "parking",
        "paymentId": "",
      }).then((DocumentSnapshot) => usersCollection
          .doc(currentUser.email)
          .collection("receipt")
          .doc(DocumentSnapshot.id)
          .update({"paymentId": DocumentSnapshot.id}));

      // need to store information in the correct
      // motorcycle parking collection

      var parkingIdDate = formatParkingIdDate(Timestamp.now());

      FirebaseFirestore.instance
          .collection(newParkingName)
          .doc(widget.plateNumber + parkingIdDate)
          .set({
        'entered':
            false, // this need to be set to Boolean or will set automatically? // set automatically 11/09/2023
        'numberPlate': widget.plateNumber,
        'username': widget.name,
        'date': formatDate(Timestamp.now()),
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  // for the animation when user is entering their PIN
  void indicatePin() {
    if (userPin.length == 1) {
      firstPinWidth = 10;
      secondPinWidth = 2;
      thirdPinWidth = 2;
      fourthPinWidth = 2;
      fifthPinWidth = 2;
      sixthPinWidth = 2;
    } else if (userPin.length == 2) {
      firstPinWidth = 10;
      secondPinWidth = 10;
      thirdPinWidth = 2;
      fourthPinWidth = 2;
      fifthPinWidth = 2;
      sixthPinWidth = 2;
    } else if (userPin.length == 3) {
      firstPinWidth = 10;
      secondPinWidth = 10;
      thirdPinWidth = 10;
      fourthPinWidth = 2;
      fifthPinWidth = 2;
      sixthPinWidth = 2;
    } else if (userPin.length == 4) {
      firstPinWidth = 10;
      secondPinWidth = 10;
      thirdPinWidth = 10;
      fourthPinWidth = 10;
      fifthPinWidth = 2;
      sixthPinWidth = 2;
    } else if (userPin.length == 5) {
      firstPinWidth = 10;
      secondPinWidth = 10;
      thirdPinWidth = 10;
      fourthPinWidth = 10;
      fifthPinWidth = 10;
      sixthPinWidth = 2;
    } else if (userPin.length == 6) {
      firstPinWidth = 10;
      secondPinWidth = 10;
      thirdPinWidth = 10;
      fourthPinWidth = 10;
      fifthPinWidth = 10;
      sixthPinWidth = 10;

      checkPin();
    } else {
      firstPinWidth = 2;
      secondPinWidth = 2;
      thirdPinWidth = 2;
      fourthPinWidth = 2;
      fifthPinWidth = 2;
      sixthPinWidth = 2;
    }
  }

  // user tap the button to enter their PIN
  void enterPin(String button) {
    setState(() {
      if (button == "X") {
        if (userPin.isNotEmpty) {
          userPin = userPin.substring(0, userPin.length - 1);
        }
      } else if (userPin.length < 6) {
        if (button == "1") {
          userPin = userPin + "1";
        } else if (button == "2") {
          userPin = userPin + "2";
        } else if (button == "3") {
          userPin = userPin + "3";
        } else if (button == "4") {
          userPin = userPin + "4";
        } else if (button == "5") {
          userPin = userPin + "5";
        } else if (button == "6") {
          userPin = userPin + "6";
        } else if (button == "7") {
          userPin = userPin + "7";
        } else if (button == "8") {
          userPin = userPin + "8";
        } else if (button == "9") {
          userPin = userPin + "9";
        } else if (button == "0") {
          userPin = userPin + "0";
        }
      }
    });
    indicatePin();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 345,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(children: [
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: firstPinWidth, color: Color(0xFFCF0A0A)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: secondPinWidth, color: Color(0xFFCF0A0A)),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: thirdPinWidth, color: Color(0xFFCF0A0A)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: fourthPinWidth, color: Color(0xFFCF0A0A)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: fifthPinWidth, color: Color(0xFFCF0A0A)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: sixthPinWidth, color: Color(0xFFCF0A0A)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(userPin), // to show the current PIN entered
        Text(
          "Enter PIN to purchase a " + widget.parkingName + " card",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(
          height: 28,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinTile(onTap: () => enterPin("1"), text: "1"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () => enterPin("2"), text: "2"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () => enterPin("3"), text: "3"),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinTile(onTap: () => enterPin("4"), text: "4"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () => enterPin("5"), text: "5"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () => enterPin("6"), text: "6"),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinTile(onTap: () => enterPin("7"), text: "7"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () => enterPin("8"), text: "8"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () => enterPin("9"), text: "9"),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinTile(onTap: () {}, text: ""),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () => enterPin("0"), text: "0"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () => enterPin("X"), text: "X"),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
