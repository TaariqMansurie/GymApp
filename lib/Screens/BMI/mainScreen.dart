
import 'package:GymApp/Model/gender.dart';
import 'package:GymApp/Screens/BMI/result_page.dart';
import 'package:GymApp/Screens/BMI/utils/sameHeightScreen.dart';
import 'package:flutter/material.dart';

import 'Gender/gender_card.dart';
import 'Widgets/bmi_app_bar.dart';
import 'Widgets/fade_route.dart';
import 'Widgets/input_page_styles.dart';
import 'Widgets/pacman_slider.dart';
import 'Widgets/transition_dot.dart';

class InputPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(context),
            Expanded(child: _buildCards(context)),
            _buildBottom(context),
          ],
        ),
      ),
    );
  }
  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.0,
        top: screenAwareSize(56.0, context),
      ),
      child: Text(
        "BMI Calculator",
        style: new TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      ),
    );
  }
  Widget _buildBottom(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: screenAwareSize(108.0, context),
      width: double.infinity,
      child: Switch(value: true, onChanged: (val) {}),
    );
  }
  Widget _buildCards(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.0,
        right: 14.0,
        top: screenAwareSize(32.0, context),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(child: GenderCard()),
                Expanded(child: _tempCard("Weight")),
              ],
            ),
          ),
          Expanded(child: _tempCard("Height"))
        ],
      ),
    );
  }

  Widget _tempCard(String label) {
    return Card(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Text(label),
      ),
    );
  }
}

// class InputPageState extends State<InputPage> with TickerProviderStateMixin {
//   AnimationController _submitAnimationController;
//   Gender gender = Gender.other;
//   int height = 180;
//   int weight = 70;
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _submitAnimationController = AnimationController(
//   //     vsync: this,
//   //     duration: Duration(seconds: 2),
//   //   );
//   //   _submitAnimationController.addStatusListener((status) {
//   //     if (status == AnimationStatus.completed) {
//   //       _goToResultPage().then((_) => _submitAnimationController.reset());
//   //     }
//   //   });
//   // }
//
//   // @override
//   // void dispose() {
//   //   _submitAnimationController.dispose();
//   //   super.dispose();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Scaffold(
//           appBar: PreferredSize(
//             child: BmiAppBar(),
//             preferredSize: Size.fromHeight(appBarHeight(context)),
//           ),
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               InputSummaryCard(
//                 gender: gender,
//                 weight: weight,
//                 height: height,
//               ),
//               Expanded(child: _buildCards(context)),
//               _buildBottom(context),
//             ],
//           ),
//         ),
//         TransitionDot(animation: _submitAnimationController),
//       ],
//     );
//   }
//
//   Widget _buildCards(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: GenderCard(
//                   gender: gender,
//                   onChanged: (val) => setState(() => gender = val),
//                 ),
//               ),
//         //       Expanded(
//         //         child: WeightCard(
//         //           weight: weight,
//         //           onChanged: (val) => setState(() => weight = val),
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         // Expanded(
//         //   child: HeightCard(
//         //     height: height,
//         //     onChanged: (val) => setState(() => height = val),
//         //   ),
//         // )
//       ],
//     ),),],);
//   }
//
//   Widget _buildBottom(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: screenAwareSize(16.0, context),
//         right: screenAwareSize(16.0, context),
//         bottom: screenAwareSize(22.0, context),
//         top: screenAwareSize(14.0, context),
//       ),
//       child: PacmanSlider(
//         submitAnimationController: _submitAnimationController,
//         onSubmit: onPacmanSubmit,
//       ),
//     );
//   }
//
//   void onPacmanSubmit() {
//     _submitAnimationController.forward();
//   }
//
//   _goToResultPage() async {
//     return Navigator.of(context).push(FadeRoute(
//       builder: (context) => ResultPage(
//         weight: weight,
//         height: height,
//         gender: gender,
//       ),
//     ));
//   }
// }

// class InputSummaryCard extends StatelessWidget {
//   final Gender gender;
//   final int height;
//   final int weight;
//
//   const InputSummaryCard({Key key, this.gender, this.height, this.weight})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(screenAwareSize(16.0, context)),
//       child: SizedBox(
//         height: screenAwareSize(32.0, context),
//         child: Row(
//           children: <Widget>[
//             Expanded(child: _genderText()),
//             _divider(),
//             Expanded(child: _text("${weight}kg")),
//             _divider(),
//             Expanded(child: _text("${height}cm")),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _genderText() {
//     String genderText = gender == Gender.other
//         ? '-'
//         : (gender == Gender.male ? 'Male' : 'Female');
//     return _text(genderText);
//   }
//
//   Widget _text(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//         color: Color.fromRGBO(143, 144, 156, 1.0),
//         fontSize: 15.0,
//       ),
//       textAlign: TextAlign.center,
//     );
//   }
//
//   Widget _divider() {
//     return Container(
//       width: 1.0,
//       color: Color.fromRGBO(151, 151, 151, 0.1),
//     );
//   }
// }