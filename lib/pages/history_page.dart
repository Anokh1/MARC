import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/history_payment_card.dart';
import 'package:marc/helper/helper_methods.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  var userEmail;

  void getReceiptCollection() {
    userEmail = "Users/" + currentUser.email.toString() + "/receipt";
    return userEmail;
  }

  @override
  Widget build(BuildContext context) {
    getReceiptCollection();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "M A R C",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 300,
                  height: 35,
                  child: Center(
                    child: Text("Transaction History",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),

            // following the displaying comments method from The Wall
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(currentUser.email)
                  .collection("receipt")
                  .snapshots(),
              builder: (context, snapshot) {
                // show loading circle if there is no data
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Container(
                  // I thibk this is fixed
                  // with SingleChildScrollView
                  height: 680.0, // best for iOS
                  // height: 550.0,
                  child: ListView(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    children: snapshot.data!.docs.map((doc) {
                      final receipt = doc.data() as Map<String, dynamic>;

                      // return the receipt
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HistoryPaymentCard(
                          paymentName: receipt["paymentName"],
                          paymentAmount: receipt["paymentAmount"],
                          paymentStatus: receipt["paymentStatus"],
                          // the date need to be formatted
                          // date: receipt["date"],
                          date: formatDate(receipt["date"]),
                          numberPlate: receipt["numberPlate"],
                          time: formatTime(receipt["date"]),
                          paymentType: receipt["paymentType"],
                          paymentId: receipt["paymentId"],
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
