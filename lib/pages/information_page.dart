import 'package:flutter/material.dart';
import 'package:marc/components/my_small_button.dart';
import 'package:marc/components/my_tiny_button.dart';
import 'package:marc/pages/remove_number_plate_page.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
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
        child: Center(
          child: Column(
            children: [
              Container(
                height: 220,
                width: 345,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // iPhone Information
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('lib/images/iphoneMARC.png'),
                        Container(
                          width: 140,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Apple",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(
                                "Be the first 100 users to register for the launch of payment using Apple Pay to earn discount vouchers!",
                                style: TextStyle(fontSize: 12),
                                // textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // Android Information
              Container(
                height: 220,
                width: 345,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Android",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    // textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Now supports Android! Download the app from Google Play today!",
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                        Image.asset('lib/images/androidMARC.png'),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // ESP32 Information
              Container(
                height: 220,
                width: 345,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('lib/images/infoESP32.png'),
                        Container(
                          width: 140,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Camera",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    // textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "A functioning camera system powered by ESP32 microcontroller",
                                style: TextStyle(fontSize: 12),
                                // textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // Website Information
              Container(
                height: 220,
                width: 345,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Website",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    // textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Visit our website to learn more about us!",
                                style: TextStyle(fontSize: 12),
                                // textAlign: TextAlign.justify,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Learn more",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Image.asset('lib/images/iphoneMARC.png'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // Remove Registered Number Plate Information
              Container(
                height: 220,
                width: 345,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('lib/images/iphoneMARC.png'),
                        Container(
                          width: 140,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Number Plate",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Removing registered motorcycle number plate made easier.",
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return RemoveNumberPlatePage();
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Learn more",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
