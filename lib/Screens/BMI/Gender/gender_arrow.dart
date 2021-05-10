//
// import 'package:GymApp/Screens/BMI/utils/sameHeightScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import 'gender_styles.dart';
//
// class GenderArrow extends AnimatedWidget {
//   const GenderArrow({Key key, Listenable listenable})
//       : super(key: key, listenable: listenable);
//
//   double _arrowLength(BuildContext context) => screenAwareSize(32.0, context);
//
//   double _translationOffset(BuildContext context) =>
//       _arrowLength(context) * -0.4;
//
//   @override
//   Widget build(BuildContext context) {
//     Animation animation = listenable;
//     return Transform.rotate(
//       angle: animation.value,
//       child: Transform.translate(
//         offset: Offset(0.0, _translationOffset(context)),
//         child: Transform.rotate(
//           angle: -defaultGenderAngle,
//           child: SvgPicture.asset(
//             "assets/gender_arrow.svg",
//             height: _arrowLength(context),
//             width: _arrowLength(context),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:GymApp/Screens/BMI/utils/sameHeightScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'gender_icon.dart';
import 'gender_styles.dart';

class GenderArrow extends StatelessWidget {
  final double angle;

  const GenderArrow({Key key, this.angle}) : super(key: key);

  double _arrowLength(BuildContext context) => screenAwareSize(32.0, context);

  double _translationOffset(BuildContext context) => _arrowLength(context) * -0.4;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Transform.translate(
        offset: Offset(0.0, _translationOffset(context)),
        child: Transform.rotate(
          angle: -defaultGenderAngle,
          child: SvgPicture.asset(
            "assets/gender_arrow.svg",
            height: _arrowLength(context),
            width: _arrowLength(context),
          ),
        ),
      ),
    );
  }
}