import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/components/parking_lot_tile.dart';
import 'package:marc/pages/general_information_page.dart';

import '../components/my_big_button.dart';
import '../components/my_carousel.dart';
import '../components/my_large_tile.dart';
import '../components/my_topup_button.dart';

class ParkingLotInformationPage extends StatefulWidget {
  const ParkingLotInformationPage({super.key});

  @override
  State<ParkingLotInformationPage> createState() =>
      _ParkingLotInformationPageState();
}

class _ParkingLotInformationPageState extends State<ParkingLotInformationPage> {
  void showGeneralInformation() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GeneralInformationPage(),
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
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // children: [
                //   Text("Gurney Paragon",
                //       style:
                //           TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                //   Padding(
                //     padding: const EdgeInsets.only(left: 40.0),
                //     child: MyTopUpButton(),
                //   ),
                // ],
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
              MyCarousel(),
              const SizedBox(
                height: 5,
              ),
      
              // go to parking lot page
              MyBigButton(
                  // onTap: () {}, text: "MAINTENANCE", color: Color(0xFFF86F03)),
                  onTap: () {}, text: "AVAILABLE", color: Color(0xFF17BC86)),
                  // onTap: () {}, text: "FULL", color: Color(0xFFFF0303)),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyLargeTile(
                      onTap: () {},
                      text: "Definitely Raining",
                      color: Color(0xFFBFDCE5),
                      image: 'lib/images/definitely_raining.png'),
                  const SizedBox(
                    width: 15,
                  ),
                  ParkingLotTile(
                      onTap: () {},
                      color: Color(0xFFFFFFFF),
                      image: 'lib/images/apple_tv.png'),
                ],
              ),
              const SizedBox(
                height: 85,
              ),
              MyBigButton(
                  onTap: showGeneralInformation, text: "PURCHASE A KEY", color: Color(0xFFCF0A0A)),
            ],
          ),
        ),
      ),
    );
  }
}
