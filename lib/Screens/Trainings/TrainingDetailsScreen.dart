import 'package:GymApp/Screens/ClientBodyMeasurements.dart';
import 'package:GymApp/Screens/Notes/notes.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class TrainingDetailsScreen extends StatefulWidget {
  @override
  _TrainingDetailsScreenState createState() => _TrainingDetailsScreenState();
}

class _TrainingDetailsScreenState extends State<TrainingDetailsScreen> {

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

  DatabaseMethods db = DatabaseMethods();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String uid = Provider.of<User>(context).uid;
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
                            style: Theme
                                .of(context)
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
                            width: size.width * .6,
                            // it just take 60% of total width
                            child: Text(
                              "Live happier and healthier by learning the fundamentals of training and conditioning. ",
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 40,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        ClientBodyMeasurements()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text(
                                  'Input your Weight & \nbody measurements.',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),
                                )),
                                width: size.width * .5,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          SizedBox(
                            height: 40,
                            child: InkWell(
                              onTap: () {
                                print('done');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Notes()));
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
                                )),
                                width: size.width * .5,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * .5,
                            height: size.width * .1,),
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
                                                  session1 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session1' : '$session1'
                                                // }, uid);
                                                //Navigator.of(context).pop();
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
                                                  session2 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session2' : '$session2'
                                                // }, uid);
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
                                                  session3 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session3' : '$session3'
                                                // }, uid);
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
                                isDone: session4,
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
                                                  session4 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session4' : '$session4'
                                                // }, uid);
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
                                isDone: session5,
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
                                                  session5 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session5' : '$session5'
                                                // }, uid);
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
                                                  session6 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session6' : '$session6'
                                                // }, uid);
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
                                                  session7 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session7' : '$session7'
                                                // }, uid);
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
                                                  session8 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session8' : '$session8'
                                                // }, uid);
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
                                                  session9 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session9' : '$session9'
                                                // }, uid);
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
                                isDone: session10,
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
                                                  session10 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session10' : '$session10'
                                                // }, uid);
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
                                isDone: session11,
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
                                                  session11 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session11' : '$session11'
                                                // }, uid);
                                              },
                                            ),
                                          ],
                                        );
                                      }
                                  );
                                },
                              ),
                              //12
                              SessionCard(
                                isDone: session12,
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
                                                  session12 = true;
                                                  Navigator.of(context).pop();
                                                });
                                                // db.updateUserSessions({
                                                //   'session12' : '$session12'
                                                // }, uid);
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
                          (session1 == true && session2 == true &&
                              session3 == true && session4 == true &&
                              session5 == true && session6 == true &&
                              session7 == true && session8 == true &&
                              session9 == true && session10 == true &&
                              session11 == true && session12 == true) ?
                          Container(
                            height: 100,
                            width: 100,
                            child: Center(child: Text(
                                'Your sessions are over, kindly renew your membership.')),
                          ) : Container(height: 0, width: 0,),
                          SizedBox(height: 30),
                          // Center(child: Image.asset('assets/meditation_bg.png')),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
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