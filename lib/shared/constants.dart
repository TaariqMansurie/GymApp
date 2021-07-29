import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// const draweColor = Container(decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.blue[400],
//                   Colors.blue[800],
//                 ],
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter
//               )
//             ),),


//BMR
Map<String,dynamic> purl ;

const Color kAppBarColor = Color(0xFF792CEF);
//const Color kAppBarColor = Color(Colors.deepPurple[800])

const kActiveCardColor = Color(0xFFDCC4F6);
const kInactiveCardColor = Color(0xFF792CEF);
const kBottomButtonColor = Color(0xFF792CEF);
const kBottomReturnButtonColor = Color(0xFFFF2F97);

const kNumberStyle = TextStyle(
  color: Colors.blueGrey,
  fontWeight: FontWeight.w900,
  fontSize: 45.0,
  fontFamily: "Jaapokki",
);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF100101),
  fontFamily: "Jaapokki",
);
// My BMI score is 25.4. I have overweight. I want eat 2254 kcal daily.
const kResultsTitleTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 28.0,
    fontFamily: "Jaapokki");

const kResultsTextStyle = TextStyle(
  fontFamily: "Jaapokki",
  fontWeight: FontWeight.bold,
  fontSize: 12.0,
  color: Color(0xFF48C67D),
);

const kBodyTextStyle = TextStyle(
  color: Color(0xFF591CAE),
  fontWeight: FontWeight.w400,
  fontSize: 15.0,
  fontFamily: "Jaapokki",
);

const kInfoTextStyle = TextStyle(
  color: Color(0xFF591CAE),
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
  fontFamily: "Jaapokki",
);

const kBMITextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 80.0,
  color: Color(0xFF417DE0),
  fontFamily: "Jaapokki",
);

const kBMRWarning = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);

const kBMRTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 28.0,
  color: Colors.black,
  fontFamily: "Jaapokki",
);

const kKcalTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15.0,
  color: Colors.black,
  fontFamily: "Jaapokki",
);
var textInputDecoration1 = InputDecoration(
  // enabledBorder: OutlineInputBorder(
  //     borderSide: BorderSide(
  //       color: Colors.red[900],
  //       width: 1.0,
  //     ),
  //     borderRadius: BorderRadius.circular(15.0),gapPadding: 50.0
  // ),
  // focusedBorder: OutlineInputBorder(
  //   borderSide: BorderSide(
  //     color: Color(0xffff5a5f),
  //     width: 2.0,
  //   ),
  //   borderRadius: BorderRadius.circular(15.0),
  // ),
  // contentPadding: EdgeInsets.symmetric(
  //   vertical: 15.0,
  //   horizontal: 20,
  // ),
  // fillColor: Colors.white,
  // filled: true,
  hintText : 'Enter Email Id',
  fillColor: Colors.white,
  filled: true ,
  enabledBorder : OutlineInputBorder(
      borderSide : BorderSide(
          color: Colors.red[900],
          width : 1.0
      )
  ),
  focusedBorder : OutlineInputBorder(
      borderSide : BorderSide(
          color: Color(0xffff5a5f),
          width : 2.0
      ),
    borderRadius: BorderRadius.circular(15.0),gapPadding: 50.0
  ),
  contentPadding: EdgeInsets.symmetric(
    vertical: 15.0,
    horizontal: 20
  )
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

// class GlobalConstants{
//   Map<String, dynamic> purl ;
// }