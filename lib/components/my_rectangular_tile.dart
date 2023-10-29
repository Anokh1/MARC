import 'package:flutter/material.dart';

class MyRectangularTile extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final color;
  final String image;

  const MyRectangularTile(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color,
      required this.image});

  @override
  State<MyRectangularTile> createState() => _MyRectangularTileState();
}

class _MyRectangularTileState extends State<MyRectangularTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          height: 45,
          width: 170,
          
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(widget.text, style: const TextStyle(color: Colors.black, fontSize: 16)),
            SizedBox(width: 8,),
            Image.asset(widget.image)
          ]),
          
        ),
    );
  }
}
