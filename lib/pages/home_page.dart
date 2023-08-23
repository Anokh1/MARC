import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/components/my_big_button.dart';
import 'package:marc/components/my_drawer.dart';
import 'package:marc/components/my_huge_card.dart';
import 'package:marc/components/my_small_tile.dart';
import 'package:marc/components/my_topup_button.dart';
import 'package:marc/pages/history_page.dart';
import 'package:marc/pages/parking_lot_page.dart';
import 'package:marc/pages/profile_page.dart';
import 'package:marc/pages/receipt_page.dart';

import '../components/my_carousel.dart';
import '../components/my_giant_card.dart';
import '../components/my_large_tile.dart';
import '../components/my_rectangular_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showParkingLot() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ParkingLotPage(),
      ),
    );
  }

  void showHistoryPage() {
    // pop menu drawer
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HistoryPage(),
      ),
    );
  }

  void showProfilePage() {
    // pop menu drawer
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  // logout user
  void logOut() {
    FirebaseAuth.instance.signOut();
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
      drawer: MyDrawer(
        onHistoryTap: showHistoryPage,
        onLogoutTap: logOut,
        onProfileTap: showProfilePage,
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   backgroundColor: Theme.of(context).colorScheme.secondary,
      //   label: const Text('RM 10.00', style: TextStyle(color: Colors.white),),
      //   icon: const Icon(Icons.add, color: Colors.white,),
      // ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 215.0),
              child: MyTopUpButton(),
            ),
            const SizedBox(
              height: 14,
            ),
            HugeCard(
                color: Theme.of(context).colorScheme.tertiary,
                image: 'lib/images/world.png'),
            const SizedBox(
              height: 14,
            ),

            // go to parking lot page
            MyBigButton(
                onTap: showParkingLot,
                text: "P U R C H A S E   A   C A R D",
                color: Color(0xFFCF0A0A)),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyLargeTile(
                    onTap: () {},
                    text: "Weather Information",
                    color: Color(0xFFE7EFF3),
                    image: 'lib/images/weather_information.png'),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    MyRectangularTile(
                      onTap: () {},
                      text: "We prefer",
                      color: Color(0xFFD9D5D5),
                      image: 'lib/images/apple_pay.png',
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        MySmallTile(
                            onTap: () {},
                            color: Color(0xFFF2F2F2),
                            image: 'lib/images/red_helmet.png'),
                        const SizedBox(
                          width: 15,
                        ),
                        MySmallTile(
                            onTap: () {},
                            color: Color(0xFFFF597B),
                            image: 'lib/images/teleport.png'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
