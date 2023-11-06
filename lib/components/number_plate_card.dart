import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'my_tiny_button.dart';

class NumberPlateCard extends StatefulWidget {
  const NumberPlateCard({
    super.key,
    required this.ownerEmail,
    required this.numberPlate,
  });

  final String ownerEmail;
  final String numberPlate;

  @override
  State<NumberPlateCard> createState() => _NumberPlateCardState();
}

class _NumberPlateCardState extends State<NumberPlateCard> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  // all users
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  void deleteNumberPlate() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              title: const Text(
                "Delete Number Plate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                  "Deleted number plate cannot be recovered. Delete this number plate?"),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'N O',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF0303)),
                  ),
                ),
                MaterialButton(
                  onPressed: () async {
                    FirebaseFirestore.instance
                        .collection("Motorcycle")
                        .doc(widget.numberPlate.toString())
                        .delete()
                        .catchError((error) =>
                            print("Delete number plate failed: $error"));

                    await usersCollection
                        .doc(currentUser.email)
                        .update({'numberPlate': ""});

                    Navigator.pop(context);
                  },
                  child: Text(
                    'Y E S',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17BC86)),
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 345,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(14),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.numberPlate,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.ownerEmail,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MyTinyButton(
                  onTap: deleteNumberPlate,
                  text: "X",
                  color: Color(0xFFFFD80032))
            ],
          ),
        )
      ]),
    );
  }
}
