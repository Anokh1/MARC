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

  // register function
  void register() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // check that password match
    if (passwordTextController.text != confirmPasswordTextController.text) {
      // pop loafing circle
      Navigator.pop(context);
      // show error message
      displayMessage("Password don't match");
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
        'pin': "", // user PIN
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
      displayMessage(e.code);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
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
                      'lib/images/MARC_Icon.png',
                      height: 126,
                    ),

                    const SizedBox(
                      height: 35,
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
