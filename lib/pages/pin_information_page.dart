import 'package:flutter/material.dart';

class PinInformationPage extends StatefulWidget {
  const PinInformationPage({super.key});

  @override
  State<PinInformationPage> createState() => _PinInformationPageState();
}

class _PinInformationPageState extends State<PinInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "M A R C",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("PIN",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "PIN is a 6-digit secret linked to your e-wallet.",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "Refer to the steps below to set a new PIN.",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "From Home, navigate to Profile",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 14,
        ),
        Image.asset(width: 360, 'lib/images/pin1Info.png'),
        const SizedBox(
          height: 14,
        ),
        Image.asset(width: 360, 'lib/images/pin2Info.png'),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "In Profile, tap on PIN",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 14,
        ),
        Image.asset(width: 360, 'lib/images/pin3Info.png'),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "Enter your new PIN, the PIN needs to be 6-digit only",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 14,
        ),
        Image.asset(width: 360, 'lib/images/pin4Info.png'),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "Tap Save once completed. A success dialog should appear",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 14,
        ),
        Image.asset(width: 360, 'lib/images/pin5Info.png'),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "Your PIN have been reset! Remember to never share your PIN. Thank you",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 50,
        ),
      ])),
    );
  }
}
