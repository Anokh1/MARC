import 'package:flutter/material.dart';

class PinTile extends StatefulWidget {
  final Function()? onTap;
  final String text;

  const PinTile({super.key, required this.onTap, required this.text});

  @override
  State<PinTile> createState() => _PinTileState();
}

class _PinTileState extends State<PinTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 76,
        width: 76,
        decoration: BoxDecoration(
          // color: Color(0xFFD9D5D5),
          // color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            widget.text,
            style: TextStyle(
                // color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
