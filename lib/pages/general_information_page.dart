import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/general_information.dart';
import 'package:marc/pages/pin_page.dart';
import 'package:marc/pages/profile_page.dart';
import 'package:marc/pages/wallet_page.dart';
import '../components/my_big_button.dart';

class GeneralInformationPage extends StatefulWidget {
  const GeneralInformationPage(
      {super.key,
      required this.parkingFee,
      required this.parkingName,
      required this.parkingNameCollection});

  final String parkingFee;
  final String parkingName;
  final String parkingNameCollection;

  @override
  State<GeneralInformationPage> createState() => _GeneralInformationPageState();
}

class _GeneralInformationPageState extends State<GeneralInformationPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  void paymentDialog(title, information, color, page) {
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => page));
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
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              var credit = userData['credit'];

              var pin = userData['pin'];

              var plateNumber = userData['numberPlate'];

              var name = userData['username'];

              void checkPin(userPin) {
                if (userPin == "") {
                  paymentDialog(
                      "PIN unavailable",
                      "It appears that you have not set a PIN for your account. Please set your PIN in the Profile Screen. Thank you.",
                      0xFFFF0303,
                      ProfilePage());
                }
              }

              void checkNumberPlate(userNumberPlate) {
                if (userNumberPlate == "") {
                  paymentDialog(
                      "Number Plate unavailable",
                      "It appears that you have not provided your Motorcycle Number Plate. Please provide the information in the Profile Screen. Thank you.",
                      0xFFFF0303,
                      ProfilePage());
                }
              }

              void showPinPage1() {
                var convertCredit = double.parse(credit);
                var convertFee = double.parse(widget.parkingFee);

                if (pin == "") {
                  paymentDialog(
                      "PIN unavailable",
                      "It appears that you have not set a PIN for your account. Please set your PIN in the Profile Screen. Thank you.",
                      0xFFFF0303,
                      ProfilePage());
                } else if (plateNumber == "") {
                  paymentDialog(
                      "Number Plate unavailable",
                      "It appears that you have not provided your Motorcycle Number Plate. Please provide the information in the Profile Screen. Thank you.",
                      0xFFFF0303,
                      ProfilePage());
                }

                // checkNumberPlate(plateNumber);
                // if user have sufficient credit
                // display PIN pad
                // else
                // display alert box (to be created)
                //
                // PIN pad
                // user enter PIN
                // compare PIN
                //
                // if correct PIN
                // deduct amount
                // return to home screen
                // else
                // display alert box
                // return to home screen

                // credit is from Users collection
                // widget.parkingFee is from Parking collection
                // var convertCredit = double.parse(credit);
                // var convertFee = double.parse(widget.parkingFee);
                // if (credit >= widget.parkingFee) {
                else if (convertCredit >= convertFee) {
                  // to prevent from coming back to here
                  Navigator.pop(context);

                  // only proceed have sufficient credit
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PinPage(
                        parkingFee: widget.parkingFee,
                        credit: credit,
                        pin: pin,
                        plateNumber: plateNumber,
                        name: name,
                        parkingName: widget.parkingName,
                        parkingNameCollection: widget.parkingNameCollection,
                      ),
                    ),
                  );
                } else {
                  paymentDialog(
                      "Insufficient funds",
                      "It appears that there is insufficient funds in your e-wallet. Please top up your e-wallet to purchase this card. Thank you.",
                      0xFFFF0303,
                      WalletPage());
                }
              }

              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.parkingName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
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
                          onTap: showPinPage1,
                          text: "CONTINUE",
                          color: Color(0xFFCF0A0A)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Please do not continue if you do not understand",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
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
          },
        ));
  }
}
