import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/number_plate_card.dart';

class NumberPlatePage extends StatefulWidget {
  const NumberPlatePage({super.key});

  @override
  State<NumberPlatePage> createState() => _NumberPlatePageState();
}

class _NumberPlatePageState extends State<NumberPlatePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  // var numberPlateCounter = 0;

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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 300,
                height: 35,
                child: Center(
                  child: Text("My Number Plate",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("Motorcycle").snapshots(),
            builder: (context, snapshot) {
              // show loading circle if there is no data
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                height: 550.0,
                child: ListView(
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((doc) {
                    final receipt = doc.data() as Map<String, dynamic>;

                    if (receipt["ownerEmail"] == currentUser.email.toString()) {
                      // numberPlateCounter += 1;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NumberPlateCard(
                          ownerEmail: receipt["ownerEmail"],
                          numberPlate: receipt["numberPlate"],
                          // numberPlateCounter: numberPlateCounter,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }).toList(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
