import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/components/pin_tile.dart';

class PinPad extends StatefulWidget {
  const PinPad({super.key});

  @override
  State<PinPad> createState() => _PinPadState();
}

class _PinPadState extends State<PinPad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 345,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(children: [
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFFCF0A0A)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFFCF0A0A)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFFCF0A0A)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFFCF0A0A)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFFCF0A0A)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFFCF0A0A)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Enter PIN to purchase a Gurney Paragon card",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(
          height: 28,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinTile(onTap: () {}, text: "1"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () {}, text: "2"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () {}, text: "3"),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinTile(onTap: () {}, text: "4"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () {}, text: "5"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () {}, text: "6"),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinTile(onTap: () {}, text: "7"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () {}, text: "2"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () {}, text: "3"),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinTile(onTap: () {}, text: ""),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () {}, text: "0"),
                  const SizedBox(
                    width: 15,
                  ),
                  PinTile(onTap: () {}, text: "X"),
                ],
              ),
              
            ],
          ),
        )
      ]),
    );
  }
}
