
import 'package:GymApp/Model/gender.dart';
import 'package:GymApp/Screens/BMI/Widgets/card_title.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/sameHeightScreen.dart' show screenAwareSize;
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'gender_arrow.dart';
import 'gender_circle.dart';

import 'gender_icon.dart';
import 'gender_styles.dart';

// class GenderCard extends StatefulWidget {
//   // final Gender gender;
//   // final ValueChanged<Gender> onChanged;
//   //
//   // const GenderCard({
//   //   Key key,
//   //   this.gender = Gender.other,
//   //   this.onChanged,
//   // }) : super(key: key);
//      final Gender initialGender;
//
//      const GenderCard({Key key, this.initialGender}) : super(key: key);
//
//   @override
//   _GenderCardState createState() => _GenderCardState();
// }
//
// // class _GenderCardState extends State<GenderCard>
// //     with SingleTickerProviderStateMixin {
// //   AnimationController _arrowAnimationController;
//
//   // @override
//   // void initState() {
//   //   _arrowAnimationController = new AnimationController(
//   //     vsync: this,
//   //     lowerBound: -defaultGenderAngle,
//   //     upperBound: defaultGenderAngle,
//   //     value: genderAngles[widget.gender],
//   //   );
//   //   super.initState();
//   // }
//   //
//   // @override
//   // void dispose() {
//   //   _arrowAnimationController.dispose();
//   //   super.dispose();
//   // }
//   double circleSize(BuildContext context) => screenAwareSize(80.0, context);
//   class _GenderCardState extends State<GenderCard> with SingleTickerProviderStateMixin {
//     AnimationController _arrowAnimationController; //<--- Add controller
//     Gender selectedGender;
//
//     @override
//     void initState() {
//       selectedGender = widget.initialGender ?? Gender.other; //<--- initialize selected gender
//       _arrowAnimationController = new AnimationController( //<--- initialize animation controller
//         vsync: this,
//         lowerBound: -defaultGenderAngle,
//         upperBound: defaultGenderAngle,
//         value: genderAngles[selectedGender],
//       );
//       super.initState();
//     }
//
//     @override
//     void dispose() {
//       _arrowAnimationController.dispose(); //<--- dispose controller when we're done
//       super.dispose();
//     }
//
//     @override
//     Widget build(BuildContext context) {
//       return Card(
//         child: SizedBox(
//           width: double.infinity,
//           child: Padding(
//             padding: EdgeInsets.only(top: screenAwareSize(8.0, context)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 CardTitle("GENDER"),
//                 Padding(
//                   padding: EdgeInsets.only(top: screenAwareSize(16.0, context)),
//                   child: _drawMainStack(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//     Widget _drawMainStack() {
//       return Container(
//         width: double.infinity, //<--- Expand stack width
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: <Widget>[
//             _drawCircleIndicator(),
//             GenderIconTranslated(gender: Gender.female),
//             GenderIconTranslated(gender: Gender.other),
//             GenderIconTranslated(gender: Gender.male),
//             _drawGestureDetector(), //<--- Add gesutre detector
//           ],
//         ),
//       );
//     }
//
//     Widget _drawCircleIndicator() {
//       return Stack(
//         alignment: Alignment.center,
//         children: <Widget>[
//           GenderCircle(),
//           GenderArrow(listenable: _arrowAnimationController),
//         ],
//       );
//     }
//
//     _drawGestureDetector() {
//       return Positioned.fill(
//         child: TapHandler(
//           onGenderTapped: _setSelectedGender,
//         ),
//       );
//     }
//     void _setSelectedGender(Gender gender) {
//       setState(() => selectedGender = gender);
//       _arrowAnimationController.animateTo( //<--- Animate the arrow
//         genderAngles[gender],
//         duration: Duration(milliseconds: 150),
//       );
//     }
//   }
//
// class GenderArrow extends AnimatedWidget { //<--- Use AnimatedWidget
//   const GenderArrow({Key key, Listenable listenable}) : super(key: key, listenable: listenable);
//
//   @override
//   Widget build(BuildContext context) {
//     Animation animation = listenable;
//     return Transform.rotate(
//         angle: animation.value, //<--- use animation value
//
//     );
//   }
// }
//
// class GenderCircle extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: circleSize(context),
//       height: circleSize(context),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Color.fromRGBO(244, 244, 244, 1.0),
//       ),
//     );
//   }
//   }
//
// class TapHandler extends StatelessWidget {
//   final Function(Gender) onGenderTapped;
//
//   const TapHandler({Key key, this.onGenderTapped}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[
//         Expanded(child: GestureDetector(onTap: () => onGenderTapped(Gender.female))),
//         Expanded(child: GestureDetector(onTap: () => onGenderTapped(Gender.other))),
//         Expanded(child: GestureDetector(onTap: () => onGenderTapped(Gender.male))),
//       ],
//     );
//   }
// }
//
//


//     return Card(
//       margin: EdgeInsets.only(
//         left: screenAwareSize(16.0, context),
//         right: screenAwareSize(4.0, context),
//         bottom: screenAwareSize(4.0, context),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           CardTitle("GENDER"),
//           Padding(
//             padding: EdgeInsets.only(top: screenAwareSize(16.0, context)),
//             child: _drawMainStack(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _drawMainStack() {
//     return Container(
//       width: double.infinity,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: <Widget>[
//           _drawCircleIndicator(),
//           GenderIconTranslated(
//             gender: Gender.female,
//             isSelected: widget.gender == Gender.female,
//           ),
//           GenderIconTranslated(
//             gender: Gender.other,
//             isSelected: widget.gender == Gender.other,
//           ),
//           GenderIconTranslated(
//             gender: Gender.male,
//             isSelected: widget.gender == Gender.male,
//           ),
//           _drawGestureDetector(),
//         ],
//       ),
//     );
//   }
//
//   Widget _drawCircleIndicator() {
//     return Stack(
//       alignment: Alignment.center,
//       children: <Widget>[
//         GenderCircle(),
//         GenderArrow(listenable: _arrowAnimationController),
//       ],
//     );
//   }
//
//   _drawGestureDetector() {
//     return Positioned.fill(
//       child: TapHandler(
//         onGenderTapped: _setSelectedGender,
//       ),
//     );
//   }
//
//   void _setSelectedGender(Gender gender) {
//     widget.onChanged(gender);
//     _arrowAnimationController.animateTo(
//       genderAngles[gender],
//       duration: Duration(milliseconds: 150),
//     );
//   }
// }
//
// class TapHandler extends StatelessWidget {
//   final Function(Gender) onGenderTapped;
//
//   const TapHandler({Key key, this.onGenderTapped}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[
//         Expanded(
//             child: GestureDetector(onTap: () => onGenderTapped(Gender.female))),
//         Expanded(
//             child: GestureDetector(onTap: () => onGenderTapped(Gender.other))),
//         Expanded(
//             child: GestureDetector(onTap: () => onGenderTapped(Gender.male))),
//       ],
//     );
//   }
// }

class GenderCard extends StatefulWidget {
  final Gender initialGender;

  const GenderCard({Key key, this.initialGender}) : super(key: key);

  @override
  _GenderCardState createState() => _GenderCardState();
}

const double _defaultGenderAngle = math.pi / 4;
const Map<Gender, double> _genderAngles = {
  Gender.female: -_defaultGenderAngle,
  Gender.other: 0.0,
  Gender.male: _defaultGenderAngle,
};

double _circleSize(BuildContext context) => screenAwareSize(80.0, context);

class _GenderCardState extends State<GenderCard>
    with SingleTickerProviderStateMixin {
  AnimationController _arrowAnimationController;
  Gender selectedGender;

  @override
  void initState() {
    selectedGender = widget.initialGender ?? Gender.other;
    _arrowAnimationController = new AnimationController(
      vsync: this,
      lowerBound: -_defaultGenderAngle,
      upperBound: _defaultGenderAngle,
      value: _genderAngles[selectedGender],
    );
    super.initState();
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: screenAwareSize(8.0, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CardTitle("GENDER"),
            Padding(
              padding: EdgeInsets.only(top: screenAwareSize(16.0, context)),
              child: _drawMainStack(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawMainStack() {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _drawCircleIndicator(),
          GenderIconTranslated(gender: Gender.female),
          GenderIconTranslated(gender: Gender.other),
          GenderIconTranslated(gender: Gender.male),
          _drawGestureDetector(),
        ],
      ),
    );
  }

  Widget _drawCircleIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        GenderCircle(),
        GenderArrow(listenable: _arrowAnimationController),
      ],
    );
  }

  _drawGestureDetector() {
    return Positioned.fill(
      child: TapHandler(
        onGenderTapped: _setSelectedGender,
      ),
    );
  }

  void _setSelectedGender(Gender gender) {
    setState(() => selectedGender = gender);
    _arrowAnimationController.animateTo(
      _genderAngles[gender],
      duration: Duration(milliseconds: 150),
    );
  }
}

class GenderIconTranslated extends StatelessWidget {
  static final Map<Gender, String> _genderImages = {
    Gender.female: "images/gender_female.svg",
    Gender.other: "images/gender_other.svg",
    Gender.male: "images/gender_male.svg",
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
      angle: -_genderAngles[gender],
      child: icon,
    );

    Widget iconWithALine = Padding(
      padding: EdgeInsets.only(bottom: _circleSize(context) / 2),
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
      angle: _genderAngles[gender],
      child: iconWithALine,
    );

    Widget centeredIconWithALine = Padding(
      padding: EdgeInsets.only(bottom: _circleSize(context) / 2),
      child: rotatedIconWithALine,
    );

    return centeredIconWithALine;
  }
}

class GenderArrow extends AnimatedWidget {
  const GenderArrow({Key key, Listenable listenable})
      : super(key: key, listenable: listenable);

  double _arrowLength(BuildContext context) => screenAwareSize(32.0, context);

  double _translationOffset(BuildContext context) =>
      _arrowLength(context) * -0.4;

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Transform.rotate(
      angle: animation.value,
      child: Transform.translate(
        offset: Offset(0.0, _translationOffset(context)),
        child: Transform.rotate(
          angle: -_defaultGenderAngle,
          child: SvgPicture.asset(
            "images/gender_arrow.svg",
            height: _arrowLength(context),
            width: _arrowLength(context),
          ),
        ),
      ),
    );
  }
}

class TapHandler extends StatelessWidget {
  final Function(Gender) onGenderTapped;

  const TapHandler({Key key, this.onGenderTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            child: GestureDetector(onTap: () => onGenderTapped(Gender.female))),
        Expanded(
            child: GestureDetector(onTap: () => onGenderTapped(Gender.other))),
        Expanded(
            child: GestureDetector(onTap: () => onGenderTapped(Gender.male))),
      ],
    );
  }
}

class GenderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: _circleSize(context),
      height: _circleSize(context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(244, 244, 244, 1.0),
      ),
    );
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