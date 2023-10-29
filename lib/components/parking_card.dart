import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/parking_card_tile.dart';
import 'package:marc/helper/helper_methods.dart';

class ParkingCard extends StatefulWidget {
  const ParkingCard({
    super.key,
  });

  @override
  State<ParkingCard> createState() => _ParkingCardState();
}

class _ParkingCardState extends State<ParkingCard> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(currentUser.email)
              .collection("receipt")
              .snapshots(),
          builder: ((context, snapshot) {
            // show loading circle if there is no data
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              height: 150,
              width: 350,
              child: ListView(
                children: snapshot.data!.docs.map((doc) {
                  final receipt = doc.data() as Map<String, dynamic>;

                  if (receipt["paymentType"] == "parking" &&
                      formatDate(receipt["date"]) ==
                          formatDate(Timestamp.now())) {
                    return ParkingCardTile(parkingName: receipt["paymentName"]);
                  } else {
                    return Container();
                    // return ParkingCardTile(parkingName: "Swipe to check your card");
                  }
                }).toList(),
              ),
            );
          }),
        )
      ],
    );
  }
}
