import 'package:flutter/material.dart';
import 'package:hagglex/ui/CompleteSetUpScreen.dart';
import 'package:hagglex/ui/HomePage.dart';
import 'package:hagglex/ui/LoginScreen.dart';
import 'package:hagglex/ui/SignUpScreen.dart';
import 'package:hagglex/ui/SplashScreen.dart';
import 'package:hagglex/ui/VerificationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,

      initialRoute: SplashScreen.id,
      routes: {
       SplashScreen.id: (context)=>SplashScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        SignUpScreen.id:(context)=>SignUpScreen(),
        VerificationScreen.id:(context)=>VerificationScreen(),
        CompleteSetUpScreen.id:(context)=>CompleteSetUpScreen(),
        HomePage.id:(context)=>HomePage(),
      },

    );
  }
}

