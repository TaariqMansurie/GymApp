import 'package:flutter/material.dart';

const textInputDecoration1 = InputDecoration(
  hintText : 'Enter Email Id',
  fillColor: Colors.white,
  filled: true ,
  enabledBorder : OutlineInputBorder(
      borderSide : BorderSide(
          color: Colors.white,
          width : 2.0
      )
  ),
  focusedBorder : OutlineInputBorder(
      borderSide : BorderSide(
          color: Colors.pink,
          width : 2.0
      )
  ),
);
const textInputDecoration2 = InputDecoration(
  labelStyle: TextStyle(color: Colors.white),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0)
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFF0889B6), width: 2.0)
  ),
);
const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFF8908D9);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);

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
  return TextStyle(color: Colors.deepPurple[700], fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}

TextStyle normalTextStyle(){
  return TextStyle (color: Colors.deepPurple[700],fontSize: 15);
}

class Constants {
  static const String Help ='Help' ;
  static const String Login ='Login' ;
  static const String Signup ='Signup' ;
  static  String myName = '';

  static const List<String> choices = <String>[
    Help ,
    Login,
    Signup
  ];
}

class ColorConstants{
  //static const primaryColor = const Color((0xffF79352);
    static const primaryColor = const Color(0xff130801) ;
}