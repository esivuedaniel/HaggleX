import 'package:flutter/material.dart';
import 'package:hagglex/component/MyButton.dart';

class CompleteSetUpScreen extends StatelessWidget {
  static String id="complete_setup_screen";

  @override
  Widget build(BuildContext context) {
    final icon=Image.asset('images/coloredicon.png');
    final completeText = Text(
      'Setup Complete',
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'Grotesquepro',
          fontWeight: FontWeight.bold,
          fontSize: 16
      ),
    );
    final thankText = Text(
      'Thank you for setting up your HaggleX account',
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'Grotesquepro',
          fontWeight: FontWeight.w300,
          fontSize: 9
      ),
    );
    final emptyText = Text('',
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'Grotesquepro',
          fontWeight: FontWeight.w300,
          fontSize: 9
      ),
    );
    final startExploringButton = MyButton(title: 'START EXPLORING',colorText: Color(0xFF3E0606),
      colorCradient1: Color(0xFFFFC175),
      colorCradient2: Color(0xFFFFC175),
      onPressed: (){

      },);


    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF2E1963),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children: [

                emptyText,
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      icon,
                      SizedBox(height: 18,),
                      completeText,
                      SizedBox(height: 16,),
                      thankText
                    ],
                  ),
                ),

                startExploringButton,
               SizedBox(height: 10,),
              ],
            ),
          )),
    );
  }
}
