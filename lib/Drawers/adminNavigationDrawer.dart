import 'dart:async';
import 'package:GymApp/Screens/Blogs/blogForm.dart';
import 'package:GymApp/Screens/ImageDisplay.dart';
import 'package:GymApp/Screens/adminChatRoom.dart';
import 'package:GymApp/Screens/admin_control.dart';
import 'package:GymApp/Screens/admin_home.dart';
import 'package:GymApp/Screens/fitnessBlogs.dart';
import 'package:GymApp/Screens/fitnezz_den_warriors.dart';
import 'package:GymApp/Screens/home.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:GymApp/shared/users.dart';
import 'package:GymApp/totw&totm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AdminNavigationDrawer extends StatefulWidget {
  @override
  _AdminNavigationDrawerState createState() => _AdminNavigationDrawerState();
}

class _AdminNavigationDrawerState extends State<AdminNavigationDrawer> {
  DocumentSnapshot data;
  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;
    print(uid);
    return uid.isNotEmpty
        ? Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('users')
            .document(uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.hasData);
            print(snapshot.data['userName']);
            String userName = snapshot.data['userName'];
            String email = snapshot.data['userEmail'];
            String profile_pic_url = snapshot.data['profile_photo_url'];
            print({profile_pic_url});
            return SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.white,
                  ),
                  child: Drawer(
                    child: SingleChildScrollView(
                      child: Column(
                        // padding:EdgeInsets.zero,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          DrawerHeader(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  Color(0xffFFC400)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            // child : Padding (
                            //  padding : EdgeInsets.all(6),
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    width: 60,
                                    height: 60,
                                    child: CircleAvatar(
                                      child: Text(''),
                                      backgroundImage: profile_pic_url == null
                                          ? AssetImage('assets/apple.png')
                                          : NetworkImage(profile_pic_url),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  InkWell(
                                    child: Text(
                                      userName,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white), //TextStyle
                                    ),
                                    onTap: () {
                                      // Navigator.push(
                                      //   context, MaterialPageRoute(builder : (context) => Profile()),
                                      // );
                                    },
                                  ),
                                  SizedBox(height: 3),
                                  InkWell(
                                    child: Text(
                                      email,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12), //TextStyle
                                    ),
                                    onTap: () {
                                      // Navigator.push(
                                      //   context, MaterialPageRoute(builder : (context) => Profile()),
                                      // );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            // ),
                          ),
                          ListTile(
                            leading: Icon(Icons.home_filled,color: Colors.black),
                            title: Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context, MaterialPageRoute(builder : (context) => AdminHome()),
                              );
                            },
                          ),
                          // ListTile(
                          //   leading: Icon(Icons.person,color: Colors.black,),
                          //   title: Text(
                          //     'Profile',
                          //     style: TextStyle(
                          //       fontSize: 18,
                          //     ),
                          //   ),
                          //   onTap: () {
                          //     Navigator.push(
                          //       context, MaterialPageRoute(builder : (context) => Profile()),
                          //     );
                          //   },
                          // ),
                          ListTile(
                            leading: Icon(Icons.admin_panel_settings_rounded,color: Colors.black),
                            title: Text(
                              'Admin Control',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder : (context) => AdminControl()),
                              );
                            },
                          ),
                          // ListTile(
                          //   leading: Icon(Icons.admin_panel_settings_rounded,color: Colors.black),
                          //   title: Text(
                          //     'Male Trainers',
                          //     style: TextStyle(
                          //       fontSize: 18,
                          //     ),
                          //   ),
                          //   onTap: (){
                          //     Navigator.push(
                          //       context, MaterialPageRoute(builder : (context) => TrainersList2()),
                          //     );
                          //   },
                          // ),
                          // ListTile(
                          //   leading: Icon(Icons.admin_panel_settings_rounded,color: Colors.black),
                          //   title: Text(
                          //     'Female Trainers',
                          //     style: TextStyle(
                          //       fontSize: 18,
                          //     ),
                          //   ),
                          //   onTap: (){
                          //     Navigator.push(
                          //       context, MaterialPageRoute(builder : (context) => FemaleTrainersList2()),
                          //     );
                          //   },
                          // ),
                          ListTile(
                            leading: Icon(Icons.chat_bubble_outline,color: Colors.black),
                            title: Text(
                              'User Chats',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context, MaterialPageRoute(builder : (context) => AdminChatRoom()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(FontAwesomeIcons.trademark,color: Colors.black),
                            title: Text(
                              'Trainer of the week & month',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context, MaterialPageRoute(builder : (context) => AdminTrainerofWeekAndMonth()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(FontAwesomeIcons.microblog,color: Colors.black),
                            title: Text(
                              'Blog Updation',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context, MaterialPageRoute(builder : (context) => BlogForm()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(FontAwesomeIcons.blog,color: Colors.black),
                            title: Text(
                              'Blog',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context, MaterialPageRoute(builder : (context) => FitnessBlogs()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(FontAwesomeIcons.shieldAlt,color: Colors.black),
                            title: Text(
                              'Fitnezz Den Warriors',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context, MaterialPageRoute(builder : (context) => FitnezzDenWarriors()),
                              );
                            },
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
                                context, MaterialPageRoute(builder : (context) => ImageDisplay()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.cancel_rounded,
                                color: Colors.black
                            ),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onTap:  () {
                              _alertDialog();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          } else {
            return Container();
          }
        },
      ),
    )
        : Container(
      child: Center(child: Text('my name is taariq')),
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

