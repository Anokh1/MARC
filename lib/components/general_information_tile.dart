import 'package:flutter/material.dart';

class GeneralInformationTile extends StatefulWidget {
  final String number;
  final String text;

  const GeneralInformationTile(
      {super.key, required this.number, required this.text});

  @override
  State<GeneralInformationTile> createState() => _GeneralInformationTileState();
}

class _GeneralInformationTileState extends State<GeneralInformationTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 20,
        width: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: Color(0xFFFF597B),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                  child: Text(
                widget.number,
                style: TextStyle(color: Colors.white),
              )),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              widget.text,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
