import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WalletCard extends StatefulWidget {
  final String text;
  final String image;
  final String logo;
  final String people;

  const WalletCard(
      {super.key,
      required this.text,
      required this.image,
      required this.logo,
      required this.people});

  @override
  State<WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 330,
      decoration: BoxDecoration(
        color: Color(0xFFD9D5D5),
        borderRadius: BorderRadius.circular(14),
      ),
      child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "MOTORCYCLE NUMBER PLATE",
                    style: TextStyle(
                        color: Color(0xFFB42B3F), fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 53.0),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Image.asset(widget.image),
                const SizedBox(
                  height: 10,
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 35,
        ),
        Row(
          children: [
            const SizedBox(
              width: 18,
            ),
            Column(
              children: [
                Image.asset(widget.logo),
              ],
            ),
            const SizedBox(
              width: 99,
            ),
            Image.asset(
              widget.people,
            )
          ],
        )
      ]),
    );
  }
}
