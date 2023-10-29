import 'package:flutter/material.dart';

class RemoveNumberPlatePage extends StatefulWidget {
  const RemoveNumberPlatePage({super.key});

  @override
  State<RemoveNumberPlatePage> createState() => _RemoveNumberPlatePageState();
}

class _RemoveNumberPlatePageState extends State<RemoveNumberPlatePage> {
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
              child: Text("Removing Number Plate",
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
              "Users are encouraged to not remove their registered motorcycle number plate frequently.",
              textAlign: TextAlign.start,
            )),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "Refer to the steps below to remove registered motorcycle number plate.",
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
        Image.asset(width: 360, 'lib/images/remove1.png'),
        const SizedBox(
          height: 14,
        ),
        Image.asset(width: 360, 'lib/images/remove2.png'),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "In Profile, tap on NUMBER PLATE",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 14,
        ),
        Image.asset(width: 360, 'lib/images/remove3.png'),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "Your list of registered motorcycle number plate will be displayed",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 14,
        ),
        Image.asset(width: 360, 'lib/images/remove4.png'),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "Tap on the red X button to remove the registered motorcycle number plate\n \nA confirmation dialog should appear for confirmation",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 14,
        ),
        Image.asset(width: 360, 'lib/images/remove5.png'),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "Tap on YES to remove the selected number plate. Thank you",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 14,
        ),
        Image.asset(width: 360, 'lib/images/remove6.png'),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "M A R C does not encourage users to remove motorcycle number plate. When unsure, please us for assistance. Please be responsible for your actions. Mistakes done, can't be undone",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 50,
        ),
      ])),
    );
  }
}
