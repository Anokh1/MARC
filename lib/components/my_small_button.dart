import 'package:flutter/material.dart';

class MySmallButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final color;

  const MySmallButton({super.key, required this.onTap, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 33,
        width: 133,
        // padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        )),
      ),
    );
  }
}