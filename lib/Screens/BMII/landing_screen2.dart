import 'package:GymApp/Screens/BMII/Screens/input_page.dart';
import 'package:GymApp/Screens/BMII/Screens/input_page2.dart';
import 'package:flutter/material.dart';



void main() => runApp(BMICalculator2());

class BMICalculator2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple[500],
        scaffoldBackgroundColor: Colors.white,
      ),
      home: InputPage2(),
      debugShowCheckedModeBanner: false,
    );
  }
}