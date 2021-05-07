import 'package:flutter/material.dart';

const kTextFieldDecoration=InputDecoration(
    labelText: "Password [Min. 8 characters]",
    labelStyle: TextStyle(
        color: Colors.white,
            fontSize: 11
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white70),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
);

const KTextColor= TextStyle(
    color: Colors.white,
  fontSize: 11,
  fontFamily: 'Grotesquepro',
);

const kTextFieldDecorationBlack=InputDecoration(
  labelText: "Password [Min. 8 characters]",
  labelStyle: TextStyle(
      color: Colors.black,
      fontSize: 13
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFBA3AF9)),
  ),
);

