import 'package:GymApp/Screens/BMII/Screens/input_page2.dart';
import 'package:flutter/material.dart';



void main() => runApp(BMICalculator2());

class BMICalculator2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage2(),
      debugShowCheckedModeBanner: false,
    );
  }
}