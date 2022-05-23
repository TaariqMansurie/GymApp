import 'package:GymApp/Screens/BMII/Components/bottom_button.dart';
import 'package:GymApp/Screens/BMII/Components/resusable_card.dart';
import 'package:GymApp/Screens/BMR/screens/main_page.dart';
import 'package:GymApp/Screens/BMR/screens/main_page2.dart';
import 'package:GymApp/Screens/BMR/screens/main_page3.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xffffc400)),
        title: Text('BMI CALCULATOR',style: TextStyle(color: Color(0xffffc400)),),
      ),
      body: SingleChildScrollView(
    child :
      Container(
        height: MediaQuery.of(context).size.height * 0.90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ReusableCard(
                colour: kInactiveCardColour,
                cardChild: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),

                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BmrHome3()));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text('BMR Calculation',style: TextStyle(color: Color(0xffffc400),fontSize: 25),),
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      )
    );
  }
}