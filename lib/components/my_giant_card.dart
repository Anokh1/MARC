import 'package:flutter/material.dart';

class GiantCard extends StatefulWidget {
  final color;
  final String image;

  const GiantCard({super.key, required this.color, required this.image});

  @override
  State<GiantCard> createState() => _GiantCardState();
}

class _GiantCardState extends State<GiantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 330,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(14),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.asset(widget.image),
      ]),
    );
  }
}
