import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/amount_tile.dart';
import 'package:marc/components/my_wallet_card.dart';
import 'package:marc/pages/home_page.dart';
import '../components/my_topup_button.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  void walletDialog(title, information, color) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            title: Text(
              title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Color(color)),
            ),
            content: Text(information),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'O K',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        });
  }

  void showHomePage() {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
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
                var numberPlate = userData['numberPlate'];

                double maximumCredit = 200.00;

                void topUp(amount) {
                  var newCredit = double.parse(credit) + double.parse(amount);
                  if (newCredit <= maximumCredit) {
                    String niceCredit = newCredit.toStringAsFixed(2);
                    // update the new wallet balance
                    usersCollection
                        .doc(currentUser.email)
                        .update({'credit': niceCredit});

                    // create receipt document
                    usersCollection
                        .doc(currentUser.email)
                        .collection("receipt")
                        .add({
                      "date": Timestamp.now(), // this data is complicated
                      "numberPlate": numberPlate,
                      "paymentAmount": amount,
                      "paymentName": "E-wallet Top-up",
                      "paymentStatus": "e-wallet",
                      "paymentType": "e-wallet",
                      "paymentId": "",
                    }).then((DocumentSnapshot) => usersCollection
                            .doc(currentUser.email)
                            .collection("receipt")
                            .doc(DocumentSnapshot.id)
                            .update({"paymentId": DocumentSnapshot.id}));

                    showHomePage(); 
                    
                  } else {
                    walletDialog(
                        "Maximum limit reached",
                        "Unfortunately, there is a limit for the amount of credit. The e-wallet can only store credits worth not more than the value of RM 200.00. Thank you.",
                        0xFFFF0303);
                  }
                }

                return SingleChildScrollView(
                  // wrapped the Center with SingleChildScrollView to solve the renderflex issue on Pixel XL
                  child: Center(
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 215.0),
                        //   child: MyTopUpButton(
                        //     userCredit: credit,
                        //   ),
                        // ),
                        const SizedBox(
                          height: 14,
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        WalletCard(
                          text: userData['numberPlate'],
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
                                onTap: () => topUp("5.00"),
                                text: "5.00",
                                color: Color(0xFF7FDA89),
                                image: 'lib/images/motorcycle_green.png'),
                            const SizedBox(
                              width: 15,
                            ),
                            AmountTile(
                                onTap: () => topUp("10.00"),
                                text: "10.00",
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
                                onTap: () => topUp("20.00"),
                                text: '20.00',
                                color: Color(0xFFFFC057),
                                image: 'lib/images/motorcycle_orange.png'),
                            const SizedBox(
                              width: 15,
                            ),
                            AmountTile(
                                onTap: () => topUp("50.00"),
                                text: '50.00',
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
