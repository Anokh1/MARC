import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HugeCard extends StatefulWidget {
  final color;
  final String image;

  const HugeCard({super.key, required this.color, required this.image});

  @override
  State<HugeCard> createState() => _HugeCardState();
}

class _HugeCardState extends State<HugeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 345,
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