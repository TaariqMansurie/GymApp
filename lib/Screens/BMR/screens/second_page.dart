import 'package:GymApp/Authentication/login.dart';
import 'package:GymApp/Screens/BMR/components/background_card2.dart';
import 'package:GymApp/Screens/BMR/components/background_card3.dart';
import 'package:GymApp/Screens/BMR/components/background_card4.dart';
import 'package:GymApp/Screens/BMR/components/buttons.dart';
import 'package:GymApp/Screens/Macros%20Calculator/landing_page3.dart';
import 'package:GymApp/Screens/askAnExpert.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

enum ActivityLevel {
  level_0,
  level_1,
  level_2,
  level_3,
  level_4,
}

enum WeightGoal {
  lose,
  gain,
  keep,
}

class SecondPage extends StatefulWidget {
  final String bmrResult;
  final String bmiResult;
  final String resultText;
  final String interpretation;
  SecondPage(
      {this.resultText, this.interpretation, this.bmiResult, this.bmrResult});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  ActivityLevel selectedLevel = ActivityLevel.level_0;
  WeightGoal selectedGoal = WeightGoal.keep;
  double endBMR;
  double finalBMR() {
    endBMR = 0;
    if (selectedLevel == ActivityLevel.level_0) {
      endBMR = 1.2 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_1) {
      endBMR = 1.35 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_2) {
      endBMR = 1.55 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_3) {
      endBMR = 1.75 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_4) {
      endBMR = 2.05 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else
      return endBMR;
  }

  double returnedBMR;

  @override
  void initState() {
    super.initState();
    returnedBMR = finalBMR();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMR CALCULATOR',style: TextStyle(
            color: Color(0xffffc400)
        ),),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.99,
          width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                  child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Your BMI: ${widget.bmiResult}',
                        style: kResultsTitleTextStyle.copyWith(fontSize: 20,fontWeight: FontWeight.bold)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: BackgroundCard3(
                        color: (widget.resultText == 'Underweight' ||
                                widget.resultText == 'Overweight')
                            ? Color(0xFFFEEAEA)
                            : Color(0xFFE3FFEE),
                        childContainer: Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              widget.resultText.toUpperCase(),
                              style: kResultsTextStyle.copyWith(
                                color: (widget.resultText == 'Underweight' ||
                                        widget.resultText == 'Overweight')
                                    ? Color(0xFFF95F49)
                                    : Color(0xFF48C67D),
                                fontSize: 10.5
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // i button
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0,
                                      top: 10.0),
                                  child: Container(
                                      height: MediaQuery.of(context).size.height * 0.9,
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0)),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '< 18.5 – underweight',
                                              style: kInfoTextStyle,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '18.5 – 24.99 – normal',
                                              style: kInfoTextStyle,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '25.0 - 29.0 – overweight',
                                              style: kInfoTextStyle,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                            ' ≥ 29.0 – obese',
                                            style: kInfoTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8,top: 2),
                                              child: Text(
                                                '(If your are overweight or obese,then you surely need a lifestyle change. We would suggest you minimum 3-4 days of physical activity and  a proper diet regimen to keep you healthy !)',
                                                style: TextStyle(
                                                  color: Colors.black,fontWeight: FontWeight.normal
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8,top: 5),
                                              child: Text(
                                                'Do you need training services/ diet services or a personal trainer ?',
                                                style: TextStyle(
                                                    color: Colors.black,fontWeight: FontWeight.normal
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: (){
                                                    _alertDialog();
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: MediaQuery.of(context).size.width * 0.40,
                                                    //color: Colors.black,
                                                    padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black ,
                                                      border: Border.all(color: Color(0xffffc400)),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    child: Center(
                                                      child: Text('       Hire Male/\n Female Trainers',
                                                        style: GoogleFonts.montserrat(
                                                            color: Color(0xffffc400),
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    Navigator.push(
                                                        context, MaterialPageRoute(builder: (context) => AskTheExpert()
                                                    )
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: MediaQuery.of(context).size.width * 0.40,
                                                    padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffffc400),
                                                      border: Border.all(color: Colors.black),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    child: Center(
                                                      child: Text('Ask The Expert',
                                                        style: GoogleFonts.montserrat(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ],
                                        ),
                                      )),
                                );
                              });
                        },
                        icon: Icon(
                          FontAwesomeIcons.infoCircle,
                          color: Colors.black,
                        )),
                  ],
                ),
              )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.09,
                child: BackgroundCard3(
                  radius: 10.0,
                  color: Color(0xFFEDE4FE),
                  childContainer: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              widget.interpretation,
                              style: kBodyTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text('Your activity level:',
                      style:
                          kResultsTitleTextStyle.copyWith(color: Colors.black87,fontSize: 20)),
                )),
            Expanded(
              flex: 3,
              child: ListView(
                children: <Widget>[
                  BackgroundCard4(
                    gesture: () {
                      setState(() {
                        selectedLevel = ActivityLevel.level_0;
                        returnedBMR = finalBMR();
                      });
                    },
                    color: selectedLevel == ActivityLevel.level_0
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: Container(
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Text(
                                'No activity',
                                textAlign: TextAlign.center,
                                style: kLabelTextStyle,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '(sedentary work)',
                                textAlign: TextAlign.center,
                                style: kLabelTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BackgroundCard2(
                    gesture: () {
                      setState(() {
                        selectedLevel = ActivityLevel.level_1;
                        returnedBMR = finalBMR();
                      });
                    },
                    color: selectedLevel == ActivityLevel.level_1
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'Low activity',
                                textAlign: TextAlign.center,
                                style: kLabelTextStyle,
                              ),
                            ),
                            Text(
                              '(1-2 workouts per week)',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BackgroundCard2(
                    gesture: () {
                      setState(() {
                        selectedLevel = ActivityLevel.level_2;
                        returnedBMR = finalBMR();
                      });
                    },
                    color: selectedLevel == ActivityLevel.level_2
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'Average activity',
                                textAlign: TextAlign.center,
                                style: kLabelTextStyle,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '(3-4 workouts per week,',
                                textAlign: TextAlign.center,
                                style: kLabelTextStyle,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                'sedentary work)',
                                textAlign: TextAlign.center,
                                style: kLabelTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BackgroundCard2(
                    gesture: () {
                      setState(() {
                        selectedLevel = ActivityLevel.level_3;
                        returnedBMR = finalBMR();
                      });
                    },
                    color: selectedLevel == ActivityLevel.level_3
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'High activity',
                                textAlign: TextAlign.center,
                                style: kLabelTextStyle,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '(3-4 workouts per week,',
                                textAlign: TextAlign.center,
                                style: kLabelTextStyle,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                'physical work)',
                                textAlign: TextAlign.center,
                                style: kLabelTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BackgroundCard2(
                    gesture: () {
                      setState(() {
                        selectedLevel = ActivityLevel.level_4;
                        returnedBMR = finalBMR();
                      });
                    },
                    color: selectedLevel == ActivityLevel.level_4
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'Very high activity',
                                textAlign: TextAlign.center,
                                style: kLabelTextStyle,
                              ),
                            ),
                            Text(
                              '(daily workouts)',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                scrollDirection: Axis.horizontal,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 26.0, right: 26.0),
              child: Divider(
                color: Colors.black,
                height: 16.0,
              ),
            ),

            Expanded(
              flex: 0,
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text('Your goal:',
                    style:
                        kResultsTitleTextStyle.copyWith(color: Colors.black87,fontSize:20)),
              )),
            ),
            Expanded(
              flex: 2,
              child: ListView(
                children: <Widget>[
                  BackgroundCard2(
                    gesture: () {
                      setState(() {
                        selectedGoal = WeightGoal.lose;
                        returnedBMR = finalBMR();
                      });
                    },
                    color: selectedGoal == WeightGoal.lose
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Lose weight',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BackgroundCard2(
                    gesture: () {
                      setState(() {
                        selectedGoal = WeightGoal.keep;
                        returnedBMR = finalBMR();
                      });
                    },
                    color: selectedGoal == WeightGoal.keep
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Keep weight',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BackgroundCard2(
                    gesture: () {
                      setState(() {
                        selectedGoal = WeightGoal.gain;
                        returnedBMR = finalBMR();
                      });
                    },
                    color: selectedGoal == WeightGoal.gain
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Gain weight',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                scrollDirection: Axis.horizontal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26.0, right: 26.0),
              child: Divider(
                color: Colors.black,
                height: 16.0,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                        child: Text('You should eat:', style: kResultsTitleTextStyle.copyWith(fontSize: 20))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0, right: 15.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                returnedBMR.toStringAsFixed(0),
                                style: kBMRTextStyle,
                              ),
                              Text(
                                'kcal',
                                style: kKcalTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text('For knowing your protein,\ncarbs, fats split\nClick here',style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                      )),
                  Container(
                    child: Icon(FontAwesomeIcons.arrowRight,size: 40,)
                  ),
                  BackgroundCard2(
                    color: Colors.black,
                    childContainer: Container(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LandingPage3(),
                                  ),
                                );
                              },
                              child: Text(
                                'Macros',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffffc400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Button(
                      color: kBottomReturnButtonColor,
                      text: Text(
                        'RETURN',
                        style: TextStyle(
                          fontFamily: "Jaapokki",
                          color: Color(0xffffc400)
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  // share button
                  Expanded(
                    flex: 4,
                    child: Button(
                      color: kBottomButtonColor,
                      text: Text(
                        'SHARE',
                        style: TextStyle(
                          fontFamily: "Jaapokki",
                          color: Color(0xffffc400)
                        ),
                      ),
                      onTap: () {
                        Share.share(
                            'My BMI score is ${widget.bmiResult}. I have ${widget.resultText.toLowerCase()}. I want eat ${returnedBMR.toStringAsFixed(0)} kcal daily.');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),)
      ),
    );
  }
  void _alertDialog() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 30,
            title: Text("To know more"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
            ),
            content: Text(
                "Kindly login to your account !"),
            buttonPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            actions: <Widget>[
              TextButton(
                child: Text("No",style: TextStyle(color: Colors.black),),style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffffc400)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black
                  ))
              ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text("Yes",style: TextStyle(color: Colors.black),),style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffffc400)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black
                  ))
              ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserSignIn()));
                },
              ),
            ],
          );
        }
    );
  }
}
