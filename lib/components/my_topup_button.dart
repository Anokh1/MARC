import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/pages/wallet_page.dart';

class MyTopUpButton extends StatefulWidget {
  const MyTopUpButton({super.key});

  @override
  State<MyTopUpButton> createState() => _MyTopUpButtonState();
}

class _MyTopUpButtonState extends State<MyTopUpButton> {
  void displayWallet() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WalletPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: displayWallet,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      label: const Text(
        'RM 10.00',
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
