import 'package:flutter/material.dart';

class WeatherInformationPage extends StatefulWidget {
  const WeatherInformationPage({super.key});

  @override
  State<WeatherInformationPage> createState() => _WeatherInformationPageState();
}

class _WeatherInformationPageState extends State<WeatherInformationPage> {
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
              child: Text("Rain Information",
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
              "Riding motorcycle in the rain is dangerous. Before heading to your desired shopping mall motorcycle parking lot, you can easily view the rain condition of the shopping mall motorcycle parking lot. Prepare yourself before arriving at your destination as we care about your safety.",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 14,
        ),
        Image.asset(width: 360, 'lib/images/rain.png'),
        const SizedBox(
          height: 14,
        ),
        Container(
            width: 330,
            child: Text(
              "M A R C does not encourage motorcyclists to ride in the rain as it is dangerous. If needed, please use a raincoat to protect yourself from the rain. Beware of your surrounding and stop riding if the rain is too heavy. Seek for shelter and protect yourself. Be late as long safe. ",
              textAlign: TextAlign.justify,
            )),
        const SizedBox(
          height: 50,
        ),
      ])),
    );
  }
}
