import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyLargeTile extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final color;
  final String image;

  const MyLargeTile(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color,
      required this.image});

  @override
  State<MyLargeTile> createState() => _MyLargeTileState();
}

class _MyLargeTileState extends State<MyLargeTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 140,
        width: 160,
        // decoration: BoxDecoration(
        //     color: widget.color,
        //     borderRadius: BorderRadius.circular(14),
        //     image: DecorationImage(image: AssetImage(widget.image))),
        // child: Center(
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 120.0),
        //     child: Text(
        //       widget.text,
        //       style: const TextStyle(color: Colors.black, fontSize: 12),
        //     ),
        //   ),
        // )

        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(14),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.asset(widget.image),
          Text(widget.text,
              style: const TextStyle(color: Colors.black, fontSize: 12))
        ]),
      ),
    );
  }
}
