import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/my_big_button.dart';
import 'package:marc/components/my_drawer.dart';
import 'package:marc/components/my_huge_card.dart';
import 'package:marc/components/my_small_tile.dart';
import 'package:marc/components/my_topup_button.dart';
import 'package:marc/components/navigation_map.dart';
import 'package:marc/components/parking_card.dart';
import 'package:marc/helper/helper_methods.dart';
import 'package:marc/pages/history_page.dart';
import 'package:marc/pages/information_page.dart';
import 'package:marc/pages/parking_lot_page.dart';
import 'package:marc/pages/profile_page.dart';
import 'package:marc/pages/weather_information_page.dart';
import '../components/my_large_tile.dart';
import '../components/my_rectangular_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  void showHistoryPage() {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HistoryPage(),
      ),
    );
  }

  void showProfilePage() {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  void showInformationPage() {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InformationPage(),
      ),
    );
  }

  void showWeatherPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WeatherInformationPage(),
      ),
    );
  }

  // logout user
  void logOut() {
    FirebaseAuth.instance.signOut();
    // sometimes the logout does not bring back the login screen
    // bugsss
    Navigator.pop(context);


    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const LoginPage(onTap: null),
    //   ),
    // );
    // bugsss
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
          onInformationTap: showInformationPage,
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(currentUser.email)
                .snapshots(),
            builder: ((context, snapshot) {
              // get
              if (snapshot.hasData) {
                final userData = snapshot.data!.data() as Map<String, dynamic>;
                var credit = userData['credit'];

                var gurneyParagonDate = userData['gurneyParagonDate'];
                var gurneyPlazaDate = userData['gurneyPlazaDate'];
                var pranginMallDate = userData['pranginMallDate'];
                var queensbayMallDate = userData['queensbayMallDate'];

                void checkGurneyParagonStatus() {
                  if (gurneyParagonDate != formatDate(Timestamp.now())) {
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(currentUser.email)
                        .update({"gurneyParagon": false});
                  }
                }

                void checkGurneyPlazaStatus() {
                  if (gurneyPlazaDate != formatDate(Timestamp.now())) {
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(currentUser.email)
                        .update({"gurneyPlaza": false});
                  }
                }

                void checkPranginMallStatus() {
                  if (pranginMallDate != formatDate(Timestamp.now())) {
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(currentUser.email)
                        .update({"pranginMall": false});
                  }
                }

                void checkQueensbayMallStatus() {
                  if (queensbayMallDate != formatDate(Timestamp.now())) {
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(currentUser.email)
                        .update({"queensbayMall": false});
                  }
                }

                void showParkingLot() {
                  checkGurneyParagonStatus();
                  checkGurneyPlazaStatus();
                  checkPranginMallStatus();
                  checkQueensbayMallStatus();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // ParkingLotPage(gurneyPlazaStatus: gurneyPlazaStatus, gurneyParagonStatus: gurneyParagonStatus, pranginMallStatus: pranginMallStatus, quensbayMallStatus: queensbayMallStatus,),
                            ParkingLotPage()),
                  );
                }

                // SingleChildScrollView is able to solve the overflowing issues
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 215.0),
                          child: MyTopUpButton(
                            userCredit: credit,
                          ),
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
                                onTap: showWeatherPage,
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
                                        onTap: () {
                                          NavigationMap.shopeeHelmet();
                                        },
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
                        const SizedBox(
                          height: 18,
                        ),
                        ParkingCard()
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error${snapshot.error}'),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            })));
  }
}
