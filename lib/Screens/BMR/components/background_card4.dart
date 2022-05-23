import 'package:flutter/material.dart';

class BackgroundCard4 extends StatelessWidget {
  BackgroundCard4(
      {@required this.color,
        this.childContainer,
        this.gesture,
        this.radius = 25.0});
  final Color color;
  final Widget childContainer;
  final Function gesture;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gesture,
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: childContainer,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
