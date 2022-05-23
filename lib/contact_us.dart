import 'package:GymApp/Drawers/homeNavigationDrawer.dart';
import 'package:GymApp/Screens/Trainers/RulesAndRegulations4.dart';
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
      appBar: new AppBar(
        title: Text(
          'Contact Us',style: TextStyle(
            color: Color(0xffffc400)
        ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        automaticallyImplyLeading: true,
      ),
      drawer: HiddenDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.86,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xffffc400),
                      shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Text('Hello Fitness Freaks !',textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffffc400),
                  shape: BoxShape.circle
                ),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text('We hope you are all in good health and having an amazing experience using this application..'),
                    SizedBox(height: 10,),
                    Text('If at all you are still facing any kind of issue or need any kind of help with the application services which we are offering or with the application itself then no need to worry..'),
                    SizedBox(height: 10,),
                    Text('We are here to help you out and let you have the maximum benefits of downloading this application. '),
                    SizedBox(height: 10,),
                    Text('Kindly contact our team for any kind of guidance you need via email or phone number mentioned below.'),
                    SizedBox(height: 10,),
                    Text('Email us at :- fitnessden19@gmail.com',style: TextStyle(color: Colors.black),)
                  ]
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text('Contact Us',style: TextStyle(color : Color(0xffffc400),fontSize: 12),),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheetHelp()),
                  );
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: (){
                    _alertDialog();
                  },
                  //padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: Center(
                    child: Text('Terms & Condition',
                      style: TextStyle(
                          color: Color(0xffffc400),fontSize: 12
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheetHelp() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black
      ),
      height: 120.0,
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
            style: TextStyle(fontSize: 20.0,color: Color(0xffffc400)),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton.icon(
                onPressed: () {
                  _makeCall('tel://9820157445');
                },
                icon: Icon(Icons.call,color: Color(0xffffc400),),
                label: Text('Call',style: TextStyle(
                  color: Color(0xffffc400),
                ),),
              ),
              TextButton.icon(
                onPressed: () {
                  _sendSMS('sms://9820157445');
                },
                icon: Icon(Icons.message,color: Color(0xffffc400)),
                label: Text('Message',style: TextStyle(
                  color: Color(0xffffc400),
                ),),
              ),

              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendingMail(),
                      ),
                    );
                  },
                  icon: Icon(Icons.alternate_email,color: Color(0xffffc400)),
                  label: Text('Email',style: TextStyle(
                    color: Color(0xffffc400),
                  ),
                  )),

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
              TextButton(
                style: TextButton.styleFrom(
                  primary: Color(0xffffc400),backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text("Back",style : TextStyle(color:Color(0xffffc400))),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Clients",style: TextStyle(color: Color(0xffffc400),),),
                style: TextButton.styleFrom(
                  primary: Color(0xffffc400),backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),

                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRules()));
                },
              ),
              TextButton(
                child: Text("Trainers",style: TextStyle(color: Color(0xffffc400)),),
                style: TextButton.styleFrom(
                  primary: Color(0xffffc400),backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrainersRulesAndRegulations4()));
                },
              ),
            ],
          );
        }
    );
  }
}

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
