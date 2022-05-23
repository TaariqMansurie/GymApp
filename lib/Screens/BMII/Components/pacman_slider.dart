
import 'package:GymApp/Screens/BMII/Components/sameHeightScreen.dart';
import 'package:GymApp/Screens/BMII/Screens/input_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class PacmanSlider extends StatefulWidget {
  @override
  _PacmanSliderState createState() => _PacmanSliderState();
}

class _PacmanSliderState extends State<PacmanSlider>  with TickerProviderStateMixin {
  final int numberOfDots = 10;
  final double minOpacity = 0.1;
  final double maxOpacity = 0.5;

  AnimationController hintAnimationController;

  @override
  void initState() {
    super.initState();
    _initHintAnimationController();
    hintAnimationController.forward();
  }

  @override
  void dispose() {
    hintAnimationController.dispose();
    super.dispose();
  }

  void _initHintAnimationController() {
    hintAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    hintAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 800), () {
          hintAnimationController.forward(from: 0.0);
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenAwareSize(52.0, context),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Theme
            .of(context)
            .primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenAwareSize(24.0, context),
        ),
        child: Row(
          children: <Widget>[
            PacmanIcon(),
            Expanded(child: _drawDots()),
          ],
        ),
      ),
    );
  }

  Widget _drawDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(numberOfDots, _generateDot)
        ..add(Opacity(
          opacity: maxOpacity,
          child: Dot(size: 14.0),
        )),
    );
  }

  Widget _generateDot(int dotNumber) {
  //  Animation animation = _initDotAnimation(dotNumber);
    return AnimatedBuilder(
      animation: hintAnimationController,
      builder: (context, child) =>
          Opacity(
            opacity: hintAnimationController.value,
            child: child,
          ),
      child: Dot(size: 9.0),
    );
  }

  // Animation<double> _initDotAnimation(int dotNumber) {
  //   double lastDotStartTime = 0.4;
  //   double dotAnimationDuration = 0.6;
  //   double begin = lastDotStartTime * dotNumber / numberOfDots;
  //   double end = begin + dotAnimationDuration;
  //   return SinusoidalAnimation(min: minOpacity, max: maxOpacity).animate(
  //     CurvedAnimation(
  //       parent: hintAnimationController,
  //       curve: Interval(begin, end),
  //     ),
  //   );
  // }
}
class SinusoidalAnimation extends Animatable<double> {
  SinusoidalAnimation({this.min, this.max});

  final double min;
  final double max;

  @override
  double transform(double t) {
    return min + (max - min) * math.sin(math.pi * t);
  }
}