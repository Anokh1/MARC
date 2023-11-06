import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marc/pages/login_page.dart';
import '../components/my_big_button.dart';
import '../components/my_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailTextController = TextEditingController();

  void showLoginPage() {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(onTap: null,),
      ),
    );

    Navigator.pop(context); 
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTextController.text.trim());
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         content: Text('Password reset link sent! Check your email.'),
      //       );
      //     });
      forgetPasswordDialog(
          "Reset password", "Password reset link sent! Check your email.");
    } on FirebaseAuthException catch (e) {
      // print(e);
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         content: Text(e.message.toString()),
      //       );
      //     });
      forgetPasswordDialog(
          "Reset Password Error", "Please enter a valid email.");
    }
  }

  void forgetPasswordDialog(title, information) {
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
      // backgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor: Color(0xFF222831),
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'To receive a link to reset your password!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),

              // email textfield
              MyTextField(
                  controller: emailTextController,
                  hintText: "E M A I L",
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),

              // login button
              MyBigButton(
                onTap: passwordReset,
                text: "S U B M I T",
                color: Color(0xFFCF0A0A),
              ),
              const SizedBox(
                height: 15,
              ),
              // to login page
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Remember your password? Login ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: showLoginPage,
                          child: Text(
                            "here",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
