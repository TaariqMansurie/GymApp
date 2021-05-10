import 'dart:math' as math;


import 'package:GymApp/Model/gender.dart';
import 'package:GymApp/Screens/BMI/utils/sameHeightScreen.dart';
import 'package:flutter/material.dart';

const double defaultGenderAngle = math.pi / 4;
const Map<Gender, double> genderAngless = {
  Gender.female: -defaultGenderAngle,
  Gender.other: 0.0,
  Gender.male: defaultGenderAngle,
};

double circleSize(BuildContext context) => screenAwareSize(80.0, context);