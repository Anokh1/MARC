import 'package:flutter/material.dart';
import 'package:marc/components/general_information_tile.dart';

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({super.key});

  @override
  State<GeneralInformation> createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
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
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text("Card General Information",
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Text(
          "Please read and understand the information \n below before purchasing a card",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(
          height: 6,
        ),
        GeneralInformationTile(
            number: "1", text: "Please only purchase card(s) for yourself."),
        GeneralInformationTile(
            number: "2", text: "Please adhere to the rules at the parking."),
        GeneralInformationTile(number: "3", text: "Park at your own risk."),
        GeneralInformationTile(
            number: "4", text: "Card(s) are non-transferable."),
        GeneralInformationTile(
            number: "5", text: "Card(s) are non-refundable."),
        GeneralInformationTile(
            number: "6",
            text: "Card(s) are only valid until the end of today."),
      ]),
    );
  }
}
