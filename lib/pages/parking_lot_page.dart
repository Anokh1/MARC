import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/components/my_giant_card.dart';
import 'package:marc/components/parking_lot_tile.dart';
import 'package:marc/pages/parking_lot_information_page.dart';

import '../components/my_large_tile.dart';
import '../components/my_topup_button.dart';

class ParkingLotPage extends StatefulWidget {
  const ParkingLotPage({super.key});

  @override
  State<ParkingLotPage> createState() => _ParkingLotPageState();
}

class _ParkingLotPageState extends State<ParkingLotPage> {

  void showParkingLotInformation() {
    Navigator.push(context, MaterialPageRoute( builder: (context) => const ParkingLotInformationPage(),),); 
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
      // put back button here
      // it was there already :D

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 215.0),
                child: MyTopUpButton(),
              ),
              const SizedBox(
                height: 14,
              ),
      
              const SizedBox(
                height: 5,
              ),
      
              // go to parking lot page
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ParkingLotTile(
                      onTap: showParkingLotInformation,
                      color: Colors.white,
                      // now the image is stored locally
                      // need to retrieve from Cloud Firestore
                      image: 'lib/images/gurney_paragon_logo.png'),
                  const SizedBox(
                    width: 15,
                  ),
                  ParkingLotTile(
                      onTap: () {},
                      color: Colors.white,
                      image: 'lib/images/gurney_plaza_logo.png'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ParkingLotTile(
                      onTap: () {},
                      color: Colors.white,
                      image: 'lib/images/prangin_mall_logo.png'),
                  const SizedBox(
                    width: 15,
                  ),
                  ParkingLotTile(
                      onTap: () {},
                      color: Colors.white,
                      image: 'lib/images/queensbay_mall_logo.png'),
                ],
              ),
      
              const SizedBox(
                height: 80,
              ),
      
              GiantCard(
                  color: Colors.white,
                  image: 'lib/images/queensbay_mall_logo.png')
            ],
          ),
        ),
      ),
    );
  }
}
