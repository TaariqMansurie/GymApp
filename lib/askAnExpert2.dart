import 'package:GymApp/Authentication/login.dart';
import 'package:flutter/material.dart' ;
import 'package:google_fonts/google_fonts.dart';

class AskTheExpert2 extends StatefulWidget {
  const AskTheExpert2({Key key}) : super(key: key);

  @override
  _AskTheExpert2State createState() => _AskTheExpert2State();
}

class _AskTheExpert2State extends State<AskTheExpert2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: true,
        title: Text('Ask An Expert',style: TextStyle(color: Color(0xffffc400)),),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Text('When it comes to Fitness everyone has a myth or a question before they start.\n'
                          'We have made an effort to solve it by offering a FREE FITNESS HELPLINE in order to help people take a right step in achieving their Fitness goals.\n'
                          'If you are a celebrity, an office executive, a housewife, or a student and you want to ask us a question regarding your Diet and training please feel free to click our link below ASK AN EXPERT. And we will Answer your queries to the best of our abilities through our App.\n'
                          'We wish you a Fitter Life ahead',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontWeight: FontWeight.w500,fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 30,),

                    InkWell(
                      onTap: (){
                        _alertDialog();
                        },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                        child: Container(
                          height: 50,
                          width: 150,
                          //color: Colors.black,
                          padding: const EdgeInsets.fromLTRB(10,0,0,0),
                          decoration: BoxDecoration(
                            color: Color(0xffffc400),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text('Ask An Expert',
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
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
