import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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

  // edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(color: Colors.grey),
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
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),

          // save button
          TextButton(
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          )
        ],
      ),
    );

    // update in Firestore
    if (newValue.trim().length > 0) {
      // only update if the textfield is not empty
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  // logout user
  // this does not work, idk why
  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  void deleteAccount() {}

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

            return Center(
              child: Column(
                children: [
                  Column(
                    children: [
                      // const SizedBox(
                      //   height: 14,
                      // ),
                      HugeCard(
                          color: Theme.of(context).colorScheme.background,
                          image: 'lib/images/MARC_Icon_Small.png'),
                      // const SizedBox(
                      //   height: 14,
                      // ),

                      // direct method to load data from Firebase
                      // Text(
                      //   currentUser.email!,
                      //   // textAlign: TextAlign.start,
                      // ),

                      // press button to edit the details
                      MyBigButton(
                          onTap: () => editField('username'),
                          // text: "A D R I A N O O I 2 4 1 0",
                          text: userData['username'],
                          color: Theme.of(context).colorScheme.secondary),
                      const SizedBox(
                        height: 10,
                      ),

                      // press button to edit the details
                      MyBigButton(
                          onTap: () => editField('email'),
                          text: currentUser.email!,
                          color: Theme.of(context).colorScheme.secondary),
                      const SizedBox(
                        height: 10,
                      ),
                      // press button to edit the details
                      MyBigButton(
                          onTap: () => editField('numberPlate'),
                          // text: "P M V 2 7 3 4",
                          text: userData['numberPlate'],
                          color: Theme.of(context).colorScheme.secondary),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 240.0),
                    child: MyBigButton(
                        onTap: logOut,
                        text: "D E L E T E   A C C O U N T",
                        color: Colors.grey[900]!),
                  ),
                ],
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
