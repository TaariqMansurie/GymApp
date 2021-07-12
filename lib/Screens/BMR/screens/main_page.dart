import 'package:GymApp/Screens/BMR/components/background_card.dart';
import 'package:GymApp/Screens/BMR/components/buttons.dart';
import 'package:GymApp/Screens/BMR/components/calculations.dart';
import 'package:GymApp/Screens/BMR/components/gender_icon_content.dart';
import 'package:GymApp/Screens/BMR/screens/second_page.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



enum GenderType {
  male,
  female,
}

class   BmrHome extends StatefulWidget {
  @override
  _BmrHomeState createState() => _BmrHomeState();
}

class _BmrHomeState extends State<BmrHome> {
  GenderType selectedGender;
  int height = 160;
  int weight = 75;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(
          child: Text(
            'BMR Calc',
            style: TextStyle(
              fontFamily: "Jaapokki",
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BackgroundCard(
                    color: kActiveCardColor,
                    childContainer: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weight.toString(),
                                style: kNumberStyle,
                              ),
                              Text(
                                'kg',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                  color: Colors.deepPurple[400],
                                  icon: FontAwesomeIcons.minus,
                                  action: () {
                                    setState(() {
                                      weight--;
                                      if (weight <= 0) {
                                        weight = 0;
                                      }
                                    });
                                  }),
                              SizedBox(
                                width: 8.0,
                              ),
                              RoundedIconButton(
                                  color: Colors.deepPurple[600],
                                  icon: FontAwesomeIcons.plus,
                                  action: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BackgroundCard(
                    color: kActiveCardColor,
                    childContainer: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                  color: Colors.deepPurple[400],
                                  icon: FontAwesomeIcons.minus,
                                  action: () {
                                    setState(() {
                                      age--;
                                      if (age <= 0) {
                                        age = 0;
                                      }
                                    });
                                  }),
                              SizedBox(
                                width: 8.0,
                              ),
                              RoundedIconButton(
                                  color: Colors.deepPurple[600],
                                  icon: FontAwesomeIcons.plus,
                                  action: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: BackgroundCard(
              color: kActiveCardColor,
              childContainer: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.deepPurple[400],
                      thumbColor: Colors.deepPurple[600],
                      overlayColor: Color(0x2900D1FF),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 80.0,
                      max: 240.0,
                      inactiveColor: Color(0xFF8D8E98),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BackgroundCard(
                    color: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: GenderIconContent(
                      color: Color(0xFF18C0F4),
                      sex: FontAwesomeIcons.male,
                      label: 'MALE',
                    ),
                    gesture: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: BackgroundCard(
                    color: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: GenderIconContent(
                      color: Color(0xFFF1008F),
                      sex: FontAwesomeIcons.female,
                      label: 'FEMALE',
                    ),
                    gesture: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Button(
              color: kBottomButtonColor,
              text: Text(
                'CALCULATE',
                style: TextStyle(
                  fontFamily: "Jaapokki",
                ),
              ),
              onTap: () {
                if (selectedGender == null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Warning!"),
                        content: Text(
                            "You did not choose gender in this beautiful application. It will not work without it."),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Calculator bmi = Calculator(
                      height: height,
                      weight: weight,
                      gender: selectedGender,
                      age: age);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(
                        bmiResult: bmi.calculateBMI(),
                        resultText: bmi.getResult(),
                        interpretation: bmi.getInterpretation(),
                        bmrResult: bmi.calculateBMR(),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
