import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color colorText;
  final Color colorCradient1;
  final Color colorCradient2;
  final Function onPressed;
  MyButton({this.title, this.colorText, this.colorCradient1, this.colorCradient2, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [colorCradient1, colorCradient2],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(5.0)
      ),
      child: MaterialButton(
        elevation: 5,
        onPressed:onPressed,
        minWidth: double.infinity,
        height: 42.0,
        child: Text(title,
          style: TextStyle(
              color: colorText,
              fontFamily: 'Grotesquepro',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}