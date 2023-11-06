import 'package:flutter/material.dart';

class ParkingCardTile extends StatefulWidget {
  const ParkingCardTile({super.key, required this.parkingName});

  final String parkingName;

  @override
  State<ParkingCardTile> createState() => _ParkingCardTileState();
}

class _ParkingCardTileState extends State<ParkingCardTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        width: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 9,
            ),
            Text(widget.parkingName.toUpperCase(),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            Column(
              children: [
                Image.asset("lib/images/music_wave.png"),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "This card is only valid today",
                  style: TextStyle(color: Colors.grey, fontSize: 8, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "View the Receipt in your Transaction History",
                  style: TextStyle(color: Color(0xFFF4CE14), fontSize: 10),
                ),
                const SizedBox(
                  height: 9,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
