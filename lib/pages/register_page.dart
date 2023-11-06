import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_big_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final userNameTextController = TextEditingController();
  final pinTextController = TextEditingController();

  // register function
  void register() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // check that username field is not empty
    if (userNameTextController.text == "") {
      // pop loading circle
      Navigator.pop(context);
      // show error message
      // displayMessage("Password don't match");
      registerDialog("Register Error", "Please enter your username");
      return;
    }

    // check that password match
    if (passwordTextController.text != confirmPasswordTextController.text) {
      // pop loading circle
      Navigator.pop(context);
      // show error message
      // displayMessage("Password don't match");
      registerDialog("Register Error", "Password don't match!");
      return;
    }

    // check if the PIN is valid
    if (pinTextController.text.trim().length > 0) {
      List<String> newPinList = pinTextController.text.split("");
      List<String> newPin = [];
      List<String> pinList = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "0",
      ];
      for (var p in newPinList) {
        if (!pinList.contains(p) ||
            pinTextController.text.trim().length != 6 ||
            pinTextController.text.trim().length > 6) {
          // pop loading circle
          Navigator.pop(context);
          // show error message
          // displayMessage("Password don't match");
          registerDialog("Register Error", "Please enter a 6-digit PIN");
          return;
        } else {
          for (int i = 0; i < newPinList.length; i++) {
            if (newPinList[i] == "1" ||
                newPinList[i] == "2" ||
                newPinList[i] == "3" ||
                newPinList[i] == "4" ||
                newPinList[i] == "5" ||
                newPinList[i] == "6" ||
                newPinList[i] == "7" ||
                newPinList[i] == "8" ||
                newPinList[i] == "9" ||
                newPinList[i] == "0") {
              newPin.add(newPinList[i]);
            } else {
              break;
            }
          }
        }
      }
    } else {
      // pop loading circle
      Navigator.pop(context);
      // show error message
      // displayMessage("Password don't match");
      registerDialog("Register Error", "Please enter a 6-digit PIN.");
      return;
    }

    // try registering the user
    try {
      // create the user
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text);

      // after creating the user, create a new document in Cloud Firestore called Users
      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'username': userNameTextController.text, // initial username
        'numberPlate': "", // motorcycle number plate
        // 'pin': "", // user PIN
        'pin': pinTextController.text, // user PIN
        'credit': "0.00", // initial e-wallet credit
        "gurneyParagon": false,
        "gurneyPlaza": false,
        "queensbayMall": false,
        "pranginMall": false
      });
      // pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop loading circle
      Navigator.pop(context);
      // show error message
      debugPrint(e.code); 
      // displayMessage(e.code);
      registerDialog("Register Error", "Please try again!");
    }
  }

  // display a dialog message
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  void registerDialog(title, information) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Color(0xFF222831),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // logo
                    Image.asset(
                      'lib/images/MARC_Icon_Small.png',
                      height: 126,
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    // email textfield
                    MyTextField(
                        controller: emailTextController,
                        hintText: "E M A I L",
                        obscureText: false),
                    const SizedBox(
                      height: 10,
                    ),

                    // username textfield
                    MyTextField(
                        controller: userNameTextController,
                        hintText: "U S E R N A M E",
                        obscureText: false),
                    const SizedBox(
                      height: 10,
                    ),

                    // PIN textfield
                    MyTextField(
                        controller: pinTextController,
                        hintText: "P I N",
                        obscureText: true),
                    const SizedBox(
                      height: 10,
                    ),

                    // password textfield
                    MyTextField(
                        controller: passwordTextController,
                        hintText: "P A S S W O R D",
                        obscureText: true),
                    const SizedBox(
                      height: 10,
                    ),

                    // confirm password textfield
                    MyTextField(
                        controller: confirmPasswordTextController,
                        hintText: "C O N F I R M   P A S S W O R D",
                        obscureText: true),
                    const SizedBox(
                      height: 10,
                    ),

                    // register button
                    MyBigButton(
                      onTap: register,
                      text: "R E G I S T E R",
                      color: Color(0xFF17BC86),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // to login page
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "L o g i n   ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "h e r e",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
