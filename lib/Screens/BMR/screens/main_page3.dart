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

class BmrHome3 extends StatefulWidget {
  @override
  _BmrHome3State createState() => _BmrHome3State();
}

class _BmrHome3State extends State<BmrHome3> {
  GenderType selectedGender;
  int height = 160;
  int weight = 75;
  int age = 20;

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
          height: MediaQuery.of(context).size.height * 0.85,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              //weight & age
              Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BackgroundCard(
                        color: kInactiveCardColor,
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
                              flex: 2,
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
                                      color: Color(0xFFEB1555),
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
                                      color: Color(0xFFEB1555),
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
                        color: kInactiveCardColor,
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
                              flex: 2,
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
                                      color: Color(0xFFEB1555),
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
                                      color: Color(0xFFEB1555),
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

              //height
              Expanded(
                flex: 4,
                child: BackgroundCard(
                  color: kInactiveCardColor,
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
                          inactiveTrackColor: Colors.black,
                          activeTrackColor: Colors.grey,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
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

              //height
              Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap : () {
                          setState(() {
                            selectedGender = GenderType.male;
                          });},
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: selectedGender == GenderType.male
                                  ? kActiveCardColor
                                  : kInactiveCardColor,
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: GenderIconContent(
                              color: Color(0xFF18C0F4),
                              sex: FontAwesomeIcons.male,
                              label: 'MALE',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap : () {
                          setState(() {
                            selectedGender = GenderType.female;
                          });},
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: selectedGender == GenderType.female
                                  ? kActiveCardColor
                                  : kInactiveCardColor,
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: GenderIconContent(
                              color: Color(0xFFF1008F),
                              sex: FontAwesomeIcons.female,
                              label: 'FEMALE',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15,left: 15,bottom: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: 80,
                    child: Button(
                      color: Colors.black,
                      text: Text(
                        'CALCULATE',
                        style: TextStyle(
                            fontFamily: "Jaapokki",
                            color: Color(0xffffc400)
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
                                  TextButton(
                                    child: Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        else {
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
