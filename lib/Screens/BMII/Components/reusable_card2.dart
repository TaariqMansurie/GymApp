import 'package:flutter/material.dart';

class ReusableCard2 extends StatelessWidget {
  ReusableCard2({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height ;
    var screenWidth = MediaQuery.of(context).size.width ;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: screenHeight * 0.18,
        width: screenWidth * 0.60,
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}