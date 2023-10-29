import 'package:flutter/material.dart';
import 'package:marc/components/my_large_tile.dart';

class PinInfoPage extends StatefulWidget {
  const PinInfoPage({super.key});

  @override
  State<PinInfoPage> createState() => _PinInfoPageState();
}

class _PinInfoPageState extends State<PinInfoPage> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("PIN",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
                width: 330,
                child: Text(
                  "PIN is a 6-digit secret linked to your e-wallet.",
                  textAlign: TextAlign.center,
                )),
            const SizedBox(
              height: 14,
            ),
            Container(
                width: 330,
                child: Text(
                  "Refer to the steps below to set a new PIN.",
                  textAlign: TextAlign.center,
                )),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/images/pinProfile.png"),
                          fit: BoxFit.fill),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    )),
                const SizedBox(
                  width: 15,
                ),
                Container(
                    width: 150, child: Text("From Home, \nnavigate to Profile"))
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/images/pinPIN.png"),
                          fit: BoxFit.fill),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    )),
                const SizedBox(
                  width: 15,
                ),
                Container(width: 150, child: Text("In Profile, \ntap on PIN"))
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/images/pinBox.png"),
                          fit: BoxFit.fill),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    )),                const SizedBox(
                  width: 15,
                ),
                Container(
                    width: 150,
                    child: Text(
                        "Enter your new PIN, \nthe PIN needs to be \n6-digit only"))
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/images/pinSet.png"),
                          fit: BoxFit.fill),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    )),                const SizedBox(
                  width: 15,
                ),
                Container(width: 150, child: Text("Tap Save once completed"))
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/images/pinSuccess.png"),
                          fit: BoxFit.fill),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    )),                const SizedBox(
                  width: 15,
                ),
                Container(
                    width: 150, child: Text("A success dialog \nshould appear"))
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/images/pinDone.png"),
                          fit: BoxFit.fill),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    )),                const SizedBox(
                  width: 15,
                ),
                Container(
                    width: 150,
                    child: Text(
                        "Your PIN have been reset!\nRemember to never share your PIN. Thank you")),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ]),
        ),
      ),
    );
  }
}
