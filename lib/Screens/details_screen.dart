import 'package:GymApp/Widgets/bottom_nav_bar.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Color(0xffffc400)
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kYellowColor,
              image: DecorationImage(
                image: AssetImage("assets/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                      ),
                    ),
                    // SizedBox(
                    //   width: size.width * .5, // it just take the 50% width
                    //   child: SearchBar(),
                    // ),
                    SizedBox(width: size.width * .5,height: size.width * .125,),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SessionCard(
                          sessionNum: 1,
                          isDone: true,
                          press: () {},
                        ),
                        //if alert dialog box ki value true hoti hain toh isDone true rakhna hain varna false.
                        SessionCard(
                          sessionNum: 2,
                          press: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 30,
                                    title: Text("Fitnezz Den"),
                                    content: Text(
                                        "Is your session completed ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                        },
                                      ),
                                      // FlatButton(
                                      //   child: Text("Trainers"),
                                      //   onPressed: () {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                                      //   },
                                      // ),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                        SessionCard(
                          sessionNum: 3,
                          press: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 30,
                                    title: Text("Fitnezz Den"),
                                    content: Text(
                                        "Is your session completed ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                        },
                                      ),
                                      // FlatButton(
                                      //   child: Text("Trainers"),
                                      //   onPressed: () {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                                      //   },
                                      // ),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                        SessionCard(
                          sessionNum: 4,
                          press: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 30,
                                    title: Text("Fitnezz Den"),
                                    content: Text(
                                        "Is your session completed ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                        },
                                      ),
                                      // FlatButton(
                                      //   child: Text("Trainers"),
                                      //   onPressed: () {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                                      //   },
                                      // ),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                        SessionCard(
                          sessionNum: 5,
                          press: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 30,
                                    title: Text("Fitnezz Den"),
                                    content: Text(
                                        "Is your session completed ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                        },
                                      ),
                                      // FlatButton(
                                      //   child: Text("Trainers"),
                                      //   onPressed: () {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                                      //   },
                                      // ),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                        SessionCard(
                          sessionNum: 6,
                          press: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 30,
                                    title: Text("Fitnezz Den"),
                                    content: Text(
                                        "Is your session completed ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                        },
                                      ),
                                      // FlatButton(
                                      //   child: Text("Trainers"),
                                      //   onPressed: () {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                                      //   },
                                      // ),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                        SessionCard(
                          sessionNum: 7,
                          press: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 30,
                                    title: Text("Fitnezz Den"),
                                    content: Text(
                                        "Is your session completed ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                        },
                                      ),
                                      // FlatButton(
                                      //   child: Text("Trainers"),
                                      //   onPressed: () {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                                      //   },
                                      // ),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                        SessionCard(
                          sessionNum: 8,
                          press: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 30,
                                    title: Text("Fitnezz Den"),
                                    content: Text(
                                        "Is your session completed ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                        },
                                      ),
                                      // FlatButton(
                                      //   child: Text("Trainers"),
                                      //   onPressed: () {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                                      //   },
                                      // ),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                        SessionCard(
                          sessionNum: 9,
                          press: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 30,
                                    title: Text("Fitnezz Den"),
                                    content: Text(
                                        "Is your session completed ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                        },
                                      ),
                                      // FlatButton(
                                      //   child: Text("Trainers"),
                                      //   onPressed: () {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                                      //   },
                                      // ),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                        SessionCard(
                          sessionNum: 10,
                          press: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 30,
                                    title: Text("Fitnezz Den"),
                                    content: Text(
                                        "Is your session completed ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                        },
                                      ),
                                      // FlatButton(
                                      //   child: Text("Trainers"),
                                      //   onPressed: () {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                                      //   },
                                      // ),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                        SessionCard(
                          sessionNum: 11,
                          press: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 30,
                                    title: Text("Fitnezz Den"),
                                    content: Text(
                                        "Is your session completed ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                        },
                                      ),
                                      // FlatButton(
                                      //   child: Text("Trainers"),
                                      //   onPressed: () {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                                      //   },
                                      // ),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                        SessionCard(
                          sessionNum: 12,
                          press: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 30,
                                    title: Text("Fitnezz Den"),
                                    content: Text(
                                        "Is your session completed ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                        },
                                      ),
                                      // FlatButton(
                                      //   child: Text("Trainers"),
                                      //   onPressed: () {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                                      //   },
                                      // ),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/Meditation_women_small.svg",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Basic 2",
                                  style: Theme.of(context).textTheme.subtitle,
                                ),
                                Text("Start your deepen you practice")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/Lock.svg"),
                          ),
                        ],
                      ),
                    ),

                   // Center(child: Image.asset('assets/meditation_bg.png')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final Function press;

  const SessionCard({
    Key key,
    this.sessionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $sessionNum",
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}