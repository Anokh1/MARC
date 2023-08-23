import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/components/my_receipt.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     // without the container, the top up button will move when the text changes because of the number of characters
            //     Container(
            //       width: 200,
            //       child: Text("Gurney Paragon",
            //           style:
            //               TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 14,
            ),
            const SizedBox(
              height: 5,
            ),

            MyReceipt(),
            const SizedBox(
              height: 24,
            ),
            
            
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text("Please do not continue if you do not understand", style: TextStyle(
            //     color: Colors.grey,
            //   ),),
            // )
          ],
        ),
      ),
    );
  }
}