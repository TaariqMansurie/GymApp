import 'package:GymApp/Drawers/homeNavigationDrawer.dart';
import 'package:GymApp/Screens/Trainers/RulesAndRegulations.dart';
import 'package:GymApp/Widgets/sending_email.dart';
import 'package:GymApp/about_us.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.deepPurple[500],
        automaticallyImplyLeading: true,
      ),
      drawer: HiddenDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                shape: BoxShape.circle
            ),
            child: Center(
              child: Text('Hello Fitness Freaks !',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              shape: BoxShape.circle
            ),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text('We hope you are all in good health and having an amazing experience using this application..'),
                SizedBox(height: 10,),
                Text('If at all you are still facing any kind of issue or need any kind of help with the application services which we are offering or with the application itself then no need to worry..\n We are here to help you out and let you have the maximum benefits of downloading this application. '),
                Text('Kindly contact our team for any kind of guidance you need via email or phone number mentioned below.')
              ]
            ),
          ),
          RaisedButton(
            child: Text('Contact Us'),
            color: Colors.deepPurple[50],
            elevation: 5,
            textColor: Colors.black,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheetHelp()),
              );
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            child: RaisedButton(
              onPressed: (){
                _alertDialog();
              },
              color: Colors.deepPurple[50],
              textColor: Colors.black,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              //padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: Center(
                child: Text('Terms & Condition',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheetHelp() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple[100]
      ),
      height: 100.0,
      // width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        //horizontal: 10,
        vertical: 2,
      ),
    //  color: Colors.blue[200],
      child: Column(
        children: <Widget>[
          Text(
            'Contact Us Via',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    _makeCall('tel://9820157445');
                  },
                  icon: Icon(Icons.call),
                  label: Text('Call'),
              ),
              FlatButton.icon(
                  onPressed: () {
                    _sendSMS('sms://9820157445');
                  },
                  icon: Icon(Icons.message),
                  label: Text('Message'),
              ),

              FlatButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendingMail(),
                      ),
                    );
                  },
                  icon: Icon(Icons.alternate_email),
                  label: Text('Email')),

              // FlatButton.icon(
              //     onPressed: () {

              //     },
              //     icon: Icon(Icons.image),
              //     label: Text('Message'))
            ],
          ),
        ],
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
            title: Text("T & C"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
           ),
            content: Text(
                "Which terms and conditions do you wanna refer ?"),
            buttonPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            actions: <Widget>[
              FlatButton(
                child: Text("Back"),
                textColor: Colors.black,
                color: Colors.deepPurple[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Clients"),
                textColor: Colors.black,
                color: Colors.deepPurple[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                },
              ),
              FlatButton(
                child: Text("Trainers"),
                textColor: Colors.black,
                color: Colors.deepPurple[400],
                shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
                },
              ),
            ],
          );
        }
    );
  }
}

// class tnc extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//       // showDialog(
//       //     barrierDismissible: true,
//       //     context: context,
//       //     builder: (BuildContext context) {
//       //       return AlertDialog(
//       //         backgroundColor: Colors.white,
//       //         elevation: 30,
//       //         title: Text("Fitnezz Den"),
//       //         content: Text(
//       //             "Is your session completed ?"),
//       //         actions: <Widget>[
//       //           FlatButton(
//       //             child: Text("No"),
//       //             onPressed: () {
//       //               //Navigator.pop(context);
//       //               Navigator.of(context).pop();
//       //             },
//       //           ),
//       //           FlatButton(
//       //             child: Text("Yes"),
//       //             onPressed: () {
//       //               //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
//       //             },
//       //           ),
//       //           // FlatButton(
//       //           //   child: Text("Trainers"),
//       //           //   onPressed: () {
//       //           //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
//       //           //   },
//       //           // ),
//       //         ],
//       //       );
//       //     }
//       // );
//       // child: AlertDialog(
//       //   backgroundColor: Colors.white,
//       //   elevation: 30,
//       //   title: Text("T & C"),
//       //   content: Text(
//       //     "Which terms and conditions do you wanna refer ?"),
//       //   actions: <Widget>[
//       //     FlatButton(
//       //        child: Text("Back"),
//       //          onPressed: () {
//       //             Navigator.of(context).pop();
//       //         },
//       //        ),
//       //     FlatButton(
//       //        child: Text("Clients"),
//       //          onPressed: () {
//       //            Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
//       //          },
//       //        ),
//       //     FlatButton(
//       //        child: Text("Trainers"),
//       //          onPressed: () {
//       //            Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
//       //          },
//       //        ),
//       //       ],
//       //     ),
//
//   }
// }



void _makeCall(String number) async {
  if (await canLaunch(number)) {
    await launch(number);
  } else {
    throw 'Could not call $number';
  }
}

void _sendSMS(String messagee) async {
  if (await canLaunch(messagee)) {
    await launch(messagee);
  } else {
    throw 'Could not message $messagee';
  }
}
//
// showDialog(
// barrierDismissible: true,
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
// backgroundColor: Colors.white,
// elevation: 30,
// title: Text("Fitnezz Den"),
// content: Text(
// "Is your session completed ?"),
// actions: <Widget>[
// FlatButton(
// child: Text("No"),
// onPressed: () {
// //Navigator.pop(context);
// Navigator.of(context).pop();
// },
// ),
// FlatButton(
// child: Text("Yes"),
// onPressed: () {
// //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
// },
// ),
// // FlatButton(
// //   child: Text("Trainers"),
// //   onPressed: () {
// //     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations()));
// //   },
// // ),
// ],
// );
// }
// );