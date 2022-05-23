import 'package:GymApp/Screens/BMII/Screens/input_page3.dart';
import 'package:flutter/material.dart';



void main() => runApp(BMICalculator3());

class BMICalculator3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage3(),
      debugShowCheckedModeBanner: false,
    );
  }
}