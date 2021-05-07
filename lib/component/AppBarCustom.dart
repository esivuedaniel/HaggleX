import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {

  final Function onTap;
  AppBarCustom({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: 40,
        height: 30,
        margin: EdgeInsets.only(left: 6, top: 10),
        //margin: EdgeInsets.only(left: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Color(0xCCE8E8E8),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Icon(Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,),
        ),
      ),
    );
  }
}