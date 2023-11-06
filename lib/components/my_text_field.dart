import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color(0xFFFFFFFF)),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
              // BorderSide(color: Theme.of(context).colorScheme.secondary),
              BorderSide(color: Color(0xFF222831)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFCF0A0A)),
        ),
        // fillColor: Theme.of(context).colorScheme.primary,
        fillColor: Colors.grey[900],
        filled: true,
        hintText: hintText, hintStyle: TextStyle(color: Color(0xFFFFFFFF)),
      ),
    );
  }
}
