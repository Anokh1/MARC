import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/components/pin_pad.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // without the container, the top up button will move when the text changes because of the number of characters
                  Container(
                    child: Text("Retrieve Card",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const SizedBox(
                height: 5,
              ),
              PinPad(),
      
              const SizedBox(
                height: 24,
              ),
              
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("WHAT'S MY PIN?", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}