import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagglex/ui/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  static String id="splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller=AnimationController(
      duration: Duration(seconds: 1,),
      vsync: this,
    );

    animation=ColorTween(begin: Color(0xFF7362A1), end: Color(0xFF2E1963)).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

  }


  @override
  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Color(0xFF2E1963),
          statusBarIconBrightness: Brightness.light
        ));

    //stop device from rotating
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Timer(Duration(seconds: 5), ()=>    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen())));

    return Scaffold(
      backgroundColor: animation.value,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/logo_small.png'),
              SizedBox(height: 20,),
              Text('HaggleX',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                letterSpacing: 0,
                wordSpacing: 0,
                fontFamily: 'Grotesquepro',
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        )
    );
  }
}
