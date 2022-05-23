
import 'package:GymApp/Authentication/login.dart';
import 'package:GymApp/Authentication/register.dart';
import 'package:GymApp/Screens/BMR/screens/main_page.dart';
import 'package:GymApp/Screens/Macros%20Calculator/landing_page.dart';
import 'package:GymApp/Screens/description_fitnezz_den_warriors2.dart';
import 'package:GymApp/about_us.dart';
import 'package:GymApp/Screens/BMII/landing_screen.dart';
import 'package:GymApp/Screens/home.dart';
import 'package:GymApp/contact_us.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HiddenDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SizedBox (
      width: MediaQuery.of(context).size.width*0.8,
      child: Theme(
      data: Theme.of(context).copyWith(
      canvasColor: Colors.white), //This will change the drawer background to purple.
      //other styles
        child: Drawer(
          child : SingleChildScrollView(
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.stretch ,
              children : <Widget>[
                DrawerHeader(
            decoration: BoxDecoration (
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Color(0xffffc400)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),

                  child : Padding (
                    padding : EdgeInsets.all(6),
                    child : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container (
                          width : 60,
                          height : 60,
                          child :CircleAvatar(
                            child: Text(''),
                            backgroundColor: Colors.black,
                          ),
                        ),

                        SizedBox(height :15),
                        Text (
                          'Username',
                          style : TextStyle(
                              fontSize : 16 ,
                              fontWeight: FontWeight.w600 ,
                              color : Colors.white
                          ), //TextStyle
                        ), //Text
                        SizedBox (height : 3),
                        Text(
                          'Email id',
                          style : TextStyle (
                              color : Colors.white ,
                              fontSize : 12
                          ),//TextStyle
                        ), //Text
                      ],
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Home()));
                  },
                  leading: Icon(
                    FontAwesomeIcons.home,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Colors.black),
                  ),hoverColor: Colors.deepPurple[100],
                ),
                ListTile(
                  leading: Icon(Icons.wallpaper,color: Colors.black),
                  title: Text(
                    'Fitnezz Den Warriors Wall',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(builder : (context) => Description2()),
                    );
                  },
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BMICalculator()));
                  },
                  leading: Icon(
                    FontAwesomeIcons.calculator,
                    color: Colors.black,
                  ),
                  title: Text(
                    'BMI CALCULATOR',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BmrHome()));
                  },
                  leading: Icon(
                    FontAwesomeIcons.stickyNote,
                    color: Colors.black,
                  ),
                  title: Text(
                    'BMR Calculator',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                  leading: Icon(
                    FontAwesomeIcons.notesMedical,
                    color: Colors.black,
                  ),
                  title: Text(
                      'Macros Calculator',
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                SizedBox(height: 15,),
                Divider(
                  height: 1,
                  thickness: 2,color: Color(0xffffc400),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                  },
                  leading: Icon(
                    FontAwesomeIcons.info,
                    color: Colors.black,
                  ),
                  title: Text(
                    'About Us',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ContactUs()));
                  },
                  leading: Icon(
                    Icons.person,size: 30.0,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Contact Us',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 15,),
                Divider(
                  height: 1,
                  thickness: 2,color: Color(0xffffc400),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserSignIn()));
                  },
                  leading: Icon(
                    FontAwesomeIcons.key,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  leading: Icon(
                    Icons.person_add,size: 30.0,
                    color: Colors.black,
                  ),
                  title: Text(
                    'SignUp',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 2,color: Colors.black38,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
