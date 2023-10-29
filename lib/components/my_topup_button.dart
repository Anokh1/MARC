import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/pages/wallet_page.dart';

class MyTopUpButton extends StatefulWidget {
  const MyTopUpButton({super.key, required this.userCredit});

  final String userCredit; 

  @override
  State<MyTopUpButton> createState() => _MyTopUpButtonState();
}

class _MyTopUpButtonState extends State<MyTopUpButton> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  

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
    return Container(
      width: 133,
      height: 60,
      child: FittedBox(
        child: FloatingActionButton.extended(
          onPressed: displayWallet,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          label: Text(
            "RM " + widget.userCredit,
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
