import 'dart:async';
import 'package:GymApp/Drawers/adminNavigationDrawer.dart';
import 'package:GymApp/Screens/Packages/goldFemale.dart';
import 'package:GymApp/Screens/Packages/platinum.dart';
import 'package:GymApp/Screens/Packages/platinumFemale.dart';
import 'package:GymApp/Screens/Packages/silver.dart';
import 'package:GymApp/Screens/home.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Packages/gold.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Admin Home',style: TextStyle(
            color: Color(0xffffc400)
        ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Logout',style: TextStyle(color: Color(0xffffc400),),),
            style:TextButton.styleFrom(
                backgroundColor: Colors.black
            ),
            onPressed: () {
              _alertDialog();
            },
          ),
        ],
      ),
      drawer: AdminNavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //male
            Padding(
              padding: const EdgeInsets.fromLTRB(5,30,0,0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Male Trainers" ,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SilverPackagee()
                      )
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.35,
                      //color: Colors.black,
                      decoration: BoxDecoration(
                        color: Color(0xffffc400),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text('Silver',
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,fontSize: 12
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => GoldPackagee()
                      )
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.35,
                      //color: Colors.black,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Color(0xffffc400)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text('Gold',
                          style: GoogleFonts.montserrat(
                              color: Color(0xffffc400),
                              fontWeight: FontWeight.bold,fontSize: 12
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PlatinumPackagee()
                    )
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.35,
                    //color: Colors.black,
                    decoration: BoxDecoration(
                      color: Color(0xffffc400),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text('Platinum',
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,fontSize: 12
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //female
            Padding(
              padding: const EdgeInsets.fromLTRB(5,30,0,0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Female Trainers" ,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => GoldFemale()
                      )
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.35,
                      //color: Colors.black,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Color(0xffffc400)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text('Gold',
                          style: GoogleFonts.montserrat(
                              color: Color(0xffffc400),
                              fontWeight: FontWeight.bold,fontSize: 12
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PlatinumFemale()
                      )
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.35,
                      //color: Colors.black,
                      decoration: BoxDecoration(
                        color: Color(0xffffc400),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text('Platinum',
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,fontSize: 12
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
            title: Text("Logout"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
            ),
            content: Text(
                "Are you sure you want to logout ?"),
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
                  Timer(
                      Duration(seconds: 4),
                          () {
                        Fluttertoast.showToast(
                            msg: 'Logged out Successfully',
                            backgroundColor: Color(0xffffc400),
                            textColor: Colors.black,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR
                        );
                        Container(child: Center(child: CircularProgressIndicator(color: Color(0xffffc400),backgroundColor: Colors.black,),),);
                        _auth.signOut();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      });
                },
              ),
            ],
          );
        }
    );
  }
}
