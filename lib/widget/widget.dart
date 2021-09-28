import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Text('미니톡', style: TextStyle(fontFamily: "NanumSqureRound", fontSize: 20, fontWeight: FontWeight.bold)),
    // title:
    // // Text('ktalk'),
    // Image.asset(
    //   "assets/images/logo.png",
    //   height: 40,
    // ),

    elevation: 0.0,
    centerTitle: false,
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle explanationTextStyle() {
  return TextStyle(color: Colors.white70, fontSize: 14);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}

Color primaryColor() {
  return Color(0xff007EF4);
}

Color primaryColor2() {
  return Color(0xff2A75BC);
}


