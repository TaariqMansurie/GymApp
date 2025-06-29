import 'package:GymApp/Screens/BMI/utils/sameHeightScreen.dart';
import 'package:flutter/material.dart';

// const TextStyle _titleStyle = TextStyle(
//   fontSize: 16.0,
//   fontWeight: FontWeight.w600,
//   color: Color.fromRGBO(14, 24, 35, 1.0),
// );
//
// const TextStyle _subtitleStyle = TextStyle(
//   fontSize: 11.0,
//   color: Color.fromRGBO(143, 144, 156, 1.0),
// );

class CardTitle extends StatelessWidget {
  final String title;
 // final String subtitle;

  const CardTitle(this.title, {Key key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
      title,
      style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    );
  }
}