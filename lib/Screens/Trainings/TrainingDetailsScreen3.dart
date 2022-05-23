import 'package:GymApp/Screens/ClientBodyMeasurements.dart';
import 'package:GymApp/Screens/Notes/notes.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class TrainingDetailsScreen3 extends StatefulWidget {
  @override
  _TrainingDetailsScreen3State createState() => _TrainingDetailsScreen3State();
}

class _TrainingDetailsScreen3State extends State<TrainingDetailsScreen3> {

  bool session1 = false;
  bool session2 = false;
  bool session3 = false;
  bool session4 = false;
  bool session5 = false;
  bool session6 = false;
  bool session7 = false;
  bool session8 = false;
  bool session9 = false;
  bool session10 = false;
  bool session11 = false;
  bool session12 = false;
  bool session13 = false;
  bool session14 = false;
  bool session15 = false;
  bool session16 = false;
  bool session17 = false;
  bool session18 = false;
  bool session19 = false;
  bool session20 = false;
  bool session21 = false;
  bool session22 = false;
  bool session23 = false;
  bool session24 = false;
  bool session25 = false;
  bool session26 = false;
  bool session27 = false;
  bool session28 = false;
  bool session29 = false;
  bool session30 = false;
  bool session31 = false;
  bool session32 = false;
  bool session33 = false;
  bool session34 = false;
  bool session35 = false;
  bool session36 = false;
  DatabaseMethods db = DatabaseMethods();



  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
      body: StreamBuilder<DocumentSnapshot>(
    stream: Firestore.instance
        .collection('users')
        .document(uid)
        .snapshots(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
          //   print(snapshot.hasData);
          //   String userName = snapshot.data['userName'];
          String email = snapshot.data['userEmail'];
          //   String gender = snapshot.data['gender'];
          var profilePicUrl;
          profilePicUrl = snapshot.data['profile_pic_url'];
          print({profilePicUrl});
          print(email);
          return Stack(
            children: <Widget>[
              Container(
                height: size.height * .45,
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
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
                          "Training",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "1 Hour Course",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: size.width * .6, // it just take 60% of total width
                          child: Text(
                            "Live happier and healthier by learning the fundamentals of training and conditioning. ",
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 40,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ClientBodyMeasurements()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text('Input your Weight &\nbody measurements.',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),
                              )) ,
                              width: size.width* .5 ,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        SizedBox(
                          height: 40,
                          child: InkWell(
                            onTap: (){
                              print('done');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Notes()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text('Log your sets. ',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),
                              )) ,
                              width: size.width* .5 ,
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * .5,height: size.width * .1,),
                        Wrap(
                          spacing: 18,
                          runSpacing: 20,
                          children: <Widget>[
                            //1
                            SessionCard(
                              sessionNum: 1,
                              isDone: session1,
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
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session1 = true ;
                                                Navigator.of(context).pop();
                                              });
                                              Navigator.of(context).pop();
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //2
                            SessionCard(
                              sessionNum: 2,
                              isDone: session2,
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
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session2 = true ;
                                                Navigator.of(context).pop();
                                              });
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
                            //3
                            SessionCard(
                              isDone: session3,
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
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session3 = true ;
                                                Navigator.of(context).pop();
                                              });
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //4
                            SessionCard(
                              isDone : session4,
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
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session4 = true ;
                                                Navigator.of(context).pop();
                                              });
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //5
                            SessionCard(
                              isDone : session5,
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
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session5 = true ;
                                                Navigator.of(context).pop();
                                              });
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //6
                            SessionCard(
                              isDone: session6,
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
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session6 = true ;
                                                Navigator.of(context).pop();
                                              });
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //7
                            SessionCard(
                              isDone: session7,
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
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session7 = true ;
                                                Navigator.of(context).pop();
                                              });
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
                            //8
                            SessionCard(
                              isDone: session8,
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
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session8 = true ;
                                                Navigator.of(context).pop();
                                              });
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //9
                            SessionCard(
                              isDone: session9,
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
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session9 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //10
                            SessionCard(
                              isDone : session10,
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
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session10 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //11
                            SessionCard(
                              isDone : session11 ,
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
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session11 = true ;
                                                Navigator.of(context).pop();
                                              });                                        },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //12
                            SessionCard(
                              isDone : session12,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session12 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //13
                            SessionCard(
                              isDone : session13,
                              sessionNum: 13,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session13 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //14
                            SessionCard(
                              isDone : session14,
                              sessionNum: 14,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session14 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //15
                            SessionCard(
                              isDone : session15,
                              sessionNum: 15,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session15 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //16
                            SessionCard(
                              isDone : session16,
                              sessionNum: 16,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session16 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //17
                            SessionCard(
                              isDone : session17,
                              sessionNum: 17,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session17 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //18
                            SessionCard(
                              isDone : session18,
                              sessionNum: 18,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session18 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //19
                            SessionCard(
                              isDone : session19,
                              sessionNum: 19,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session19 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //20
                            SessionCard(
                              isDone : session20,
                              sessionNum: 20,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session20 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //21
                            SessionCard(
                              isDone : session21,
                              sessionNum: 21,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session21 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //22
                            SessionCard(
                              isDone : session22,
                              sessionNum: 22,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session22 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //23
                            SessionCard(
                              isDone : session23,
                              sessionNum: 23,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session23 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //24
                            SessionCard(
                              isDone : session24,
                              sessionNum: 24,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session24 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //25
                            SessionCard(
                              isDone : session25,
                              sessionNum: 25,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session25 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //26
                            SessionCard(
                              isDone : session26,
                              sessionNum: 26,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session26 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //27
                            SessionCard(
                              isDone : session27,
                              sessionNum: 27,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session27 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //28
                            SessionCard(
                              isDone : session28,
                              sessionNum: 28,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session28 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //29
                            SessionCard(
                              isDone : session29,
                              sessionNum: 29,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session29 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //30
                            SessionCard(
                              isDone : session30,
                              sessionNum: 30,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session30 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //31
                            SessionCard(
                              isDone : session31,
                              sessionNum: 31,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session31 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //32
                            SessionCard(
                              isDone : session32,
                              sessionNum: 32,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session32 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //33
                            SessionCard(
                              isDone : session33,
                              sessionNum: 33,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session33 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //34
                            SessionCard(
                              isDone : session34,
                              sessionNum: 34,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session34 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //35
                            SessionCard(
                              isDone : session35,
                              sessionNum: 35,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session35 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                            //36
                            SessionCard(
                              isDone : session36,
                              sessionNum: 36,
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
                                            "Is your session completed ?\nPlease confirm since it cannot be change !"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              //Navigator.pop(context);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              setState(() {
                                                session36 = true ;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                            ),
                          ],
                        ),
                        (session1==true && session2==true && session3==true && session4== true && session5== true && session6== true &&
                            session7== true && session8== true && session9== true && session10== true && session11== true && session12== true &&
                             session13== true && session14== true && session15== true && session16== true && session17== true && session18== true &&
                              session19== true && session20== true && session21== true && session22== true && session23== true && session24== true &&
                               session25== true && session26== true && session27== true && session28== true && session29== true && session30== true &&
                                session31== true && session32== true && session33== true && session34== true && session35== true && session36== true
                        )?Container(
                          height: 100,
                          width: 100,
                          child: Center(child: Text('Your sessions are over, kindly renew your membership.')),
                        ):Container(height: 0,width: 0,) ,
                        SizedBox(height: 30),
                        // Text(
                        //   "Training",
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .headline6
                        //       .copyWith(fontWeight: FontWeight.bold),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 20),
                        //   padding: EdgeInsets.all(10),
                        //   height: 90,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(13),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         offset: Offset(0, 17),
                        //         blurRadius: 23,
                        //         spreadRadius: -13,
                        //         color: kShadowColor,
                        //       ),
                        //     ],
                        //   ),
                        //   child: Row(
                        //     children: <Widget>[
                        //       SvgPicture.asset(
                        //         "assets/Meditation_women_small.svg",
                        //       ),
                        //       SizedBox(width: 20),
                        //       Expanded(
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: <Widget>[
                        //             Text(
                        //               "Basic 2",
                        //               style: Theme.of(context).textTheme.subtitle2,
                        //             ),
                        //             Text("Start your ultimate journey with us")
                        //           ],
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: EdgeInsets.all(10),
                        //         child: SvgPicture.asset("assets/Lock.svg"),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                       // Center(child: Image.asset('assets/meditation_bg.png')),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ); }
    else {
      return Container();
    }
        }
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
          width: constraint.maxWidth * 0.471, // constraint.maxWidth provide us the available with for this widget
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
                        color: isDone ? Colors.white : kBlackColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "Session $sessionNum",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
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