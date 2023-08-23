import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/components/history_payment_card.dart';
import 'package:marc/components/history_reload_card.dart';
import 'package:marc/pages/receipt_page.dart';

import '../components/my_topup_button.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  void showReceiptPage() {
     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ReceiptPage(),
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
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // without the container, the top up button will move when the text changes because of the number of characters
                Container(
                  width: 200,
                  child: Text(" History",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                MyTopUpButton(),
              ],
            ),
            const SizedBox(
              height: 18,
            ),

            Column(
              children: [
                HistoryPaymentCard(),
                const SizedBox(
                  height: 14,
                ),
                HistoryReloadCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
