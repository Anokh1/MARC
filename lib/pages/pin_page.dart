import 'package:flutter/material.dart';
import 'package:marc/components/pin_pad.dart';
import 'package:marc/pages/pin_info.dart';
import 'package:marc/pages/pin_information_page.dart';

class PinPage extends StatefulWidget {
  const PinPage(
      {super.key,
      required this.parkingFee,
      required this.credit,
      required this.pin,
      required this.plateNumber,
      required this.name,
      required this.parkingName,
      required this.parkingNameCollection
      });

  final String parkingFee;
  final String credit;
  final String pin;
  final String plateNumber;
  final String name; 
  final String parkingName; 
  final String parkingNameCollection;

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  void showPinInfo() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PinInformationPage()));
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Retrieve Card",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const SizedBox(
                height: 5,
              ),
              PinPad(
                parkingFee: widget.parkingFee,
                credit: widget.credit,
                pin: widget.pin,
                plateNumber: widget.plateNumber,
                name: widget.name,
                parkingName: widget.parkingName,
                parkingNameCollection: widget.parkingNameCollection,
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: showPinInfo,
                  child: Text(
                    "WHAT'S MY PIN?",
                    // need to add another page here 
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
