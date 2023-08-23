import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marc/auth/auth.dart';
import 'package:marc/auth/login_or_register.dart';
import 'package:marc/pages/home_page.dart';
import 'package:marc/pages/login_page.dart';
import 'package:marc/theme/dark_theme.dart';
import 'package:marc/theme/light_theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      // home: HomePage(),
      // home: LoginPage(onTap: () {}),
      // home: LoginOrRegister(),
      home: AuthPage(),
    );
  }
}
