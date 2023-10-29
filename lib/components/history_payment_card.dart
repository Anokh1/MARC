import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/receipt_page.dart';
import 'my_tiny_button.dart';

class HistoryPaymentCard extends StatefulWidget {
  const HistoryPaymentCard({
    super.key,
    required this.paymentName,
    required this.numberPlate,
    required this.date,
    required this.time,
    required this.paymentStatus,
    required this.paymentAmount,
    required this.paymentType,
    required this.paymentId,
  });

  final String paymentName;
  final String numberPlate;
  final String date;
  final String time;
  final String paymentStatus;
  final String paymentAmount;
  final String paymentType;
  final String paymentId;

  @override
  State<HistoryPaymentCard> createState() => _HistoryPaymentCardState();
}

class _HistoryPaymentCardState extends State<HistoryPaymentCard> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  void deleteTransaction() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              title: const Text(
                "Delete Transaction",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                  "Deleted transactions cannot be recovered. Delete this transaction?"),
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
                        .collection("Users")
                        .doc(currentUser.email)
                        .collection("receipt")
                        .doc(widget.paymentId)
                        .delete()
                        .catchError((error) =>
                            print("Delete transaction failed: $error"));

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
    // default color for status box
    int statusBoxColor = 0xFFFF597B;
    String statusText = "F";

    if (widget.paymentStatus == "success") {
      statusBoxColor = 0xFFFFA2FF86;
      statusText = "O";
    } else if (widget.paymentStatus == "fail") {
      statusBoxColor = 0xFFFF597B;
      statusText = "X";
    } else {
      statusBoxColor = 0xFFFF5837D0;
      statusText = "M";
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReceiptPage(
              paymentName: widget.paymentName,
              paymentAmount: widget.paymentAmount,
              date: widget.date,
              time: widget.time,
            ),
          ),
        );
      },
      child: Container(
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
                  widget.paymentName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "RM " + widget.paymentAmount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
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
                  widget.date +
                      " | " +
                      widget.time +
                      " | " +
                      widget.numberPlate,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    MyTinyButton(
                        onTap: deleteTransaction,
                        text: "X",
                        color: Color(0xFFFFD80032)),
                    const SizedBox(
                      width: 10,
                    ),
                    MyTinyButton(
                        onTap: () {},
                        text: statusText,
                        color: Color(statusBoxColor))
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
