import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/components/general_information.dart';
import 'package:marc/pages/pin_page.dart';

import '../components/my_big_button.dart';
import '../components/my_topup_button.dart';

class GeneralInformationPage extends StatefulWidget {
  const GeneralInformationPage({super.key});

  @override
  State<GeneralInformationPage> createState() => _GeneralInformationPageState();
}

class _GeneralInformationPageState extends State<GeneralInformationPage> {
  void showPinPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PinPage(),
      ),
    );
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // without the container, the top up button will move when the text changes because of the number of characters
                  Container(
                    width: 200,
                    child: Text("Gurney Paragon",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  ),
                  MyTopUpButton(),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const SizedBox(
                height: 5,
              ),
      
              GeneralInformation(),
      
              const SizedBox(
                height: 24,
              ),
              
              MyBigButton(
                  onTap: showPinPage, text: "CONTINUE", color: Color(0xFFCF0A0A)),
      
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Please do not continue if you do not understand", style: TextStyle(
                  color: Colors.grey,
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
