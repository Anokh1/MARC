import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MySmallTile extends StatefulWidget {
  final Function()? onTap;
  final color;
  final String image;

  const MySmallTile(
      {super.key,
      required this.onTap,
      required this.color,
      required this.image});

  @override
  State<MySmallTile> createState() => _MySmallTileState();
}

class _MySmallTileState extends State<MySmallTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          height: 76,
          width: 76,
          
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(widget.image)
          ]),
          
        ),
    );
  }
}
