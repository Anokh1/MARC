import 'package:flutter/material.dart';
import 'package:marc/components/my_receipt.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({
    super.key,
    required this.paymentName,
    required this.date,
    required this.time,
    required this.paymentAmount,
  });

  final String paymentName;
  final String date;
  final String time;
  final String paymentAmount;

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
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
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 14,
            ),
            const SizedBox(
              height: 5,
            ),
            MyReceipt(
              paymentName: widget.paymentName,
              paymentAmount: widget.paymentAmount,
              date: widget.date,
              time: widget.time,
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
