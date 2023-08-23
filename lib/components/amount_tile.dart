import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AmountTile extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final color;
  final String image;

  const AmountTile(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color,
      required this.image});

  @override
  State<AmountTile> createState() => _AmountTileState();
}

class _AmountTileState extends State<AmountTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 140,
        width: 160,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(children: [
          const SizedBox(
            height: 8,
          ),
          Image.asset(widget.image),
          Text(widget.text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}
