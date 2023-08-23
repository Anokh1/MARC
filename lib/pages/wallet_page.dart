import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/components/amount_tile.dart';
import 'package:marc/components/my_wallet_card.dart';

import '../components/my_giant_card.dart';
import '../components/my_topup_button.dart';
import '../components/parking_lot_tile.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
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

      body: SingleChildScrollView( // wrapped the Center with SingleChildScrollView to solve the renderflex issue on Pixel XL 
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
      
              WalletCard(
                  text: "PMV2734",
                  image: "lib/images/music_wave.png",
                  logo: "lib/images/MARC_Icon_Wallet.png",
                  people: "lib/images/happy_couple.png",
              ),
      
              const SizedBox(
                height: 14,
              ),
      
              // wallet top up options 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AmountTile(
                      onTap: () {},
                      text: "RM 5.00",
                      color: Color(0xFF7FDA89),
                      image: 'lib/images/motorcycle_green.png'),
                  const SizedBox(
                    width: 15,
                  ),
                  AmountTile(
                      onTap: () {},
                      text: "RM 10.00",
                      color: Color(0xFFFF6D60),
                      image: 'lib/images/motorcycle_red.png'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AmountTile(
                      onTap: () {},
                      text: 'RM 20.00',
                      color: Color(0xFFFFC057),
                      image: 'lib/images/motorcycle_orange.png'),
                  const SizedBox(
                    width: 15,
                  ),
                  AmountTile(
                      onTap: () {},
                      text: 'RM 50.00',
                      color: Color(0xFFA1CCD1),
                      image: 'lib/images/motorcycle_blue.png'),
                ],
              ),
      
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
