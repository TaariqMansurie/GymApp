import 'package:flutter/material.dart';

import 'Screens/input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple[500],
        scaffoldBackgroundColor: Colors.white,
      ),
      home: InputPage(),debugShowCheckedModeBanner: false,
    );
  }
}