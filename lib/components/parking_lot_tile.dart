import 'package:flutter/material.dart';

class ParkingLotTile extends StatefulWidget {
  final Function()? onTap;
  final color;
  final String image;

  const ParkingLotTile(
      {super.key,
      required this.onTap,
      required this.color,
      required this.image});

  @override
  State<ParkingLotTile> createState() => _ParkingLotTileState();
}

class _ParkingLotTileState extends State<ParkingLotTile> {
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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.asset(widget.image),
        ]),
      ),
    );
  }
}
