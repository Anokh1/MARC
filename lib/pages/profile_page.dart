import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/pages/number_plate_page.dart';
import 'package:marc/pages/update_number_plate_page.dart';
import '../components/my_big_button.dart';
import '../components/my_huge_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // user
  // get current user authentication information (email and password?)
  final currentUser = FirebaseAuth.instance.currentUser!;

  // all users
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  void profileDialog(title, information, color) {
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

  // edit field
  Future<void> editField(String field) async {
    String newValue = "";
    String editFieldName = "";
    String editFieldDescription = "";

    if (field == "username") {
      editFieldName = "username";
      editFieldDescription = "username";
    } else if (field == "numberPlate") {
      editFieldName = "number plate \nExample: PMV2734";
      editFieldDescription = "number plate";
    } else if (field == "pin") {
      editFieldName = "6-digit PIN \nExample: 990303";
      editFieldDescription = "6-digit PIN";
    }

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text(
          "Edit " + editFieldName,
        ),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Enter a new " + editFieldDescription,
          ),
          // I missed this line and the data cannot be updated
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          // cancel button
          TextButton(
            child: Text(
              "Cancel",
            ),
            onPressed: () => Navigator.pop(context),
          ),

          // save button
          TextButton(
            child: Text(
              "Save",
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          )
        ],
      ),
    );

    // update in Firestore
    // only update if the textfield is not empty
    if (newValue.trim().length > 0) {
      if (editFieldName == "PIN") {
        List<String> newValueList = newValue.split("");
        List<String> uploadPin = [];
        List<String> pinList = [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9",
          "0",
        ];
        for (var p in newValueList) {
          if (!pinList.contains(p) ||
              newValue.trim().length != 6 ||
              newValue.trim().length > 6) {
            profileDialog("Invalid PIN",
                "Please only enter 6 digits. Thank you", 0xFFFF0303);
            break;
          } else {
            for (int i = 0; i < newValueList.length; i++) {
              debugPrint("Q = " + newValueList[i]);
              if (newValueList[i] == "1" ||
                  newValueList[i] == "2" ||
                  newValueList[i] == "3" ||
                  newValueList[i] == "4" ||
                  newValueList[i] == "5" ||
                  newValueList[i] == "6" ||
                  newValueList[i] == "7" ||
                  newValueList[i] == "8" ||
                  newValueList[i] == "9" ||
                  newValueList[i] == "0") {
                uploadPin.add(newValueList[i]);
              } else {
                break;
              }
            }

            if (uploadPin.length == 6) {
              await usersCollection
                  .doc(currentUser.email)
                  .update({field: newValue});
              debugPrint(newValueList.toString());
              profileDialog("Success", "Your PIN have been updated successfully! Thank you",
                  0xFF17BC86);
            }
          }
        }
      } else if (editFieldName == "username") {
        await usersCollection.doc(currentUser.email).update({field: newValue});
      } else if (editFieldName == "number plate") {
        String niceNumberPlate = newValue.toUpperCase();
        if (niceNumberPlate.length <= 7) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  UpdateNumberPlatePage(newNumberPlate: niceNumberPlate),
            ),
          );
        } else {
          profileDialog(
              "Invalid Number Plate",
              "There seems to be an issue with the number plate provided. Thank you",
              0xFFFF0303);
        }
      }
    } else {
      profileDialog("Error", "Please don't do this. Thank you", 0xFFFF0303);
    }
  }

  void deleteAccount() {}

  void numberPlatePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NumberPlatePage(),
      ),
    );
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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          // get
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            var numberPlateData = "SET NUMBER PLATE";

            if (userData['numberPlate'] != "") {
              numberPlateData = userData['numberPlate'];
            }

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Column(
                      children: [
                        HugeCard(
                            color: Theme.of(context).colorScheme.background,
                            image: 'lib/images/MARC_Icon_Small.png'),
                        MyBigButton(
                            onTap: () => editField('username'),
                            text: userData['username'],
                            color: Theme.of(context).colorScheme.secondary),
                        const SizedBox(
                          height: 10,
                        ),

                        // press button to edit the details
                        MyBigButton(
                            onTap: () {},
                            text: currentUser.email!,
                            color: Theme.of(context).colorScheme.secondary),
                        const SizedBox(
                          height: 10,
                        ),

                        // press button to edit the details
                        MyBigButton(
                            onTap: () => editField('numberPlate'),
                            // text: userData['numberPlate'],
                            text: numberPlateData,
                            color: Theme.of(context).colorScheme.secondary),
                        const SizedBox(
                          height: 10,
                        ),
                        MyBigButton(
                            onTap: () => editField('pin'),
                            text: "PIN",
                            color: Theme.of(context).colorScheme.secondary),
                        const SizedBox(
                          height: 10,
                        ),
                        MyBigButton(
                            onTap: () => numberPlatePage(),
                            text: "MY NUMBER PLATE",
                            color: Theme.of(context).colorScheme.secondary),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
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
        },
      ),
    );
  }
}
