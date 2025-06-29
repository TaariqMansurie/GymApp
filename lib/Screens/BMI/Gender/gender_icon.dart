//
// import 'package:GymApp/Model/gender.dart';
// import 'package:GymApp/Screens/BMI/utils/sameHeightScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import 'gender_styles.dart';
//
// class GenderIconTranslated extends StatelessWidget {
//   final Gender gender;
//   final bool isSelected;
//
//   const GenderIconTranslated({Key key, this.gender, this.isSelected = false}) : super(key: key);
//
//   static final Map<Gender, String> _genderImages = {
//     Gender.female: "assets/gender_female.svg",
//     Gender.other: "assets/gender_other.svg",
//     Gender.male: "assets/gender_male.svg",
//   };
//
//   bool get _isOtherGender => gender == Gender.other;
//
//   String get _assetName => _genderImages[gender];
//
//   double _iconSize(BuildContext context) {
//     return screenAwareSize(_isOtherGender ? 22.0 : 16.0, context);
//   }
//
//   double _genderLeftPadding(BuildContext context) {
//     return screenAwareSize(_isOtherGender ? 8.0 : 0.0, context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget icon = Padding(
//       padding: EdgeInsets.only(left: _genderLeftPadding(context)),
//       child: SvgPicture.asset(
//         _assetName,
//         height: _iconSize(context),
//         width: _iconSize(context),
//         color: isSelected ? null : Color.fromRGBO(143, 144, 156, 1.0),
//       ),
//     );
//
//     Widget rotatedIcon = Transform.rotate(
//       angle: -genderAngles[gender],
//       child: icon,
//     );
//
//     Widget iconWithALine = Padding(
//       padding: EdgeInsets.only(bottom: circleSize(context) / 2),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           rotatedIcon,
//           GenderLine(),
//         ],
//       ),
//     );
//
//     Widget rotatedIconWithALine = Transform.rotate(
//       alignment: Alignment.bottomCenter,
//       angle: genderAngles[gender],
//       child: iconWithALine,
//     );
//
//     Widget centeredIconWithALine = Padding(
//       padding: EdgeInsets.only(bottom: circleSize(context) / 2),
//       child: rotatedIconWithALine,
//     );
//
//     return centeredIconWithALine;
//   }
// }
//
// class GenderLine extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: screenAwareSize(6.0, context),
//         top: screenAwareSize(8.0, context),
//       ),
//       child: Container(
//         height: screenAwareSize(8.0, context),
//         width: 1.0,
//         color: Color.fromRGBO(216, 217, 223, 0.54),
//       ),
//     );
//   }
// }
import 'dart:math' as math;
import 'package:GymApp/Model/gender.dart';
import 'package:GymApp/Screens/BMI/utils/sameHeightScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'gender_styles.dart';

const double _defaultGenderAngle = math.pi / 4;
const Map<Gender, double> genderAngles = {
  Gender.female: -_defaultGenderAngle,
  Gender.other: 0.0,
  Gender.male: _defaultGenderAngle,
};

class GenderIconTranslated extends StatelessWidget {
  static final Map<Gender, String> _genderImages = {
    Gender.female: "assets/gender_female.svg",
    Gender.other: "assets/gender_other.svg",
    Gender.male: "assets/gender_male.svg",
  };

  final Gender gender;

  const GenderIconTranslated({Key key, this.gender}) : super(key: key);

  bool get _isOtherGender => gender == Gender.other;

  String get _assetName => _genderImages[gender];

  double _iconSize(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 22.0 : 16.0, context);
  }

  double _genderLeftPadding(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 8.0 : 0.0, context);
  }

  @override
  Widget build(BuildContext context) {
    Widget icon = Padding(
      padding: EdgeInsets.only(left: _genderLeftPadding(context)),
      child: SvgPicture.asset(
        _assetName,
        height: _iconSize(context),
        width: _iconSize(context),
      ),
    );

    Widget rotatedIcon = Transform.rotate(
      angle: -genderAngles[gender],
      child: icon,
    );

    Widget iconWithALine = Padding(
      padding: EdgeInsets.only(bottom: circleSize(context) / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          rotatedIcon,
          GenderLine(),
        ],
      ),
    );

    Widget rotatedIconWithALine = Transform.rotate(
      alignment: Alignment.bottomCenter,
      angle: genderAngles[gender],
      child: iconWithALine,
    );

    Widget centeredIconWithALine = Padding(
      padding: EdgeInsets.only(bottom: circleSize(context) / 2),
      child: rotatedIconWithALine,
    );

    return centeredIconWithALine;
  }
}

class GenderLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: screenAwareSize(6.0, context),
        top: screenAwareSize(8.0, context),
      ),
      child: Container(
        height: screenAwareSize(8.0, context),
        width: 1.0,
        color: Color.fromRGBO(216, 217, 223, 0.54),
      ),
    );
  }
}