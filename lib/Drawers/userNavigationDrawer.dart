import 'dart:async';
import 'package:GymApp/Screens/BMII/landing_screen2.dart';
import 'package:GymApp/Screens/BMR/screens/main_page2.dart';
import 'package:GymApp/Screens/Diet/diet3.dart';
import 'package:GymApp/Screens/ImageDisplay.dart';
import 'package:GymApp/Screens/Macros%20Calculator/landing_page2.dart';
import 'package:GymApp/Screens/Payment/razorpay_payment2.dart';
import 'package:GymApp/Screens/Trainings/TrainingDetailsScreen.dart';
import 'package:GymApp/Screens/Trainings/TrainingDetailsScreen2.dart';
import 'package:GymApp/Screens/Trainings/TrainingDetailsScreen3.dart';
import 'package:GymApp/Screens/Trainings/TrainingDetailsScreen4.dart';
import 'package:GymApp/Screens/description_fitnezz_den_warriors.dart';
import 'package:GymApp/Screens/description_fitnezz_den_warriors2.dart';
import 'package:GymApp/Screens/home.dart';
import 'package:GymApp/Screens/terms_and_condition.dart';
import 'package:GymApp/Screens/userhome.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:GymApp/about_us3.dart';
import 'package:GymApp/cancellation_refund.dart';
import 'package:GymApp/contact_us3.dart';
import 'package:GymApp/privacy_policy.dart';
import 'package:GymApp/shared/users.dart';
import 'package:GymApp/userProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserNavigationDrawer extends StatefulWidget {
  @override
  _UserNavigationDrawerState createState() => _UserNavigationDrawerState();
}

class _UserNavigationDrawerState extends State<UserNavigationDrawer> {
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
                  String profilePicUrl = snapshot.data['profile_pic_url'];
                //  String gender = snapshot.data['gender'];
                  String paymentDone = snapshot.data['payment_successful'];
                  String packageDuration = snapshot.data['package_duration'];
                  print({profilePicUrl});
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Colors.white
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
                                        Color(0xffffc400)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          width: 60,
                                          height: 60,
                                          child: InkWell(
                                            onTap: () {
                                             Navigator.push(
                                              context, MaterialPageRoute(builder : (context) => Profile()),); },
                                            child: CircleAvatar(
                                              child: Text(''),
                                              backgroundImage: profilePicUrl == null
                                                  ? AssetImage('assets/apple.png')
                                                  : NetworkImage(profilePicUrl),
                                            ),
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
                                            Navigator.push(
                                              context, MaterialPageRoute(builder : (context) => Profile()),
                                             );
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
                                            Navigator.push(
                                              context, MaterialPageRoute(builder : (context) => Profile()),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ),
                                ),
                                ListTile(
                                  leading: Icon(
                                    FontAwesomeIcons.home,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'Home',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder : (context) => UserHome()),
                                    );
                                  },
                                ),

                                ListTile(
                                  leading: Icon(FontAwesomeIcons.breadSlice,
                                      color: Colors.black
                                  ),
                                  title: Text(
                                    'Diet',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder : (context) => Diet3()),
                                    );
                                  },
                                ),

                                // ListTile(
                                //   leading: Icon(Icons.museum_outlined,
                                //       color: Colors.black
                                //   ),
                                //   title: Text(
                                //     'List of Trainers',
                                //     style: TextStyle(
                                //       fontSize: 18,
                                //     ),
                                //   ),
                                //   onTap: () {
                                //     Navigator.push(
                                //       context, MaterialPageRoute(builder : (context) => ClientsRulesAndRegulationn2())
                                //     );
                                //   },
                                // ),

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
                                  leading: Icon(Icons.monetization_on,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'Hire a Trainer',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder : (context) => RazorpayPayment2()),
                                    );
                                  },
                                ),

                                (paymentDone == 'true') ?
                                ListTile(
                                  leading: Icon(FontAwesomeIcons.handRock,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'Sessions',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  onTap: () {
                                    if(packageDuration == '1 Month') {
                                     return Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingDetailsScreen()),
                                      );
                                    }else if (packageDuration == '3 Months'){
                                      return Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingDetailsScreen2()),
                                      );
                                    }else if (packageDuration == '6 Months'){
                                      return Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingDetailsScreen3()),
                                      );
                                    }else {
                                      return Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingDetailsScreen4()),
                                      );
                                    }
                                  },
                                ): SizedBox(),

                                // (paymentDone == 'true') ?
                                // ListTile(
                                //   leading: Icon(FontAwesomeIcons.handRock,
                                //     color: Colors.black,
                                //   ),
                                //   title: Text(
                                //     'Payment History',
                                //     style: TextStyle(
                                //       fontSize: 18,
                                //     ),
                                //   ),
                                //   onTap: () {
                                //     Navigator.push(
                                //       context, MaterialPageRoute(builder : (context) => PaymentHistory()),
                                //     );
                                //   },
                                // ): SizedBox(),
                                SizedBox(height: 10,),
                                Divider(
                                  height: 1,
                                  thickness: 2,color: Color(0xffffc400),
                                ),
                                ListTile(
                                  leading: Icon(
                                    FontAwesomeIcons.calculator,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'BMI',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder : (context) => BMICalculator2()),
                                    );
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    FontAwesomeIcons.stickyNote,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'BMR',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder : (context) => BmrHome2()),
                                    );
                                  },
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => LandingPage2()));
                                  },
                                  leading: Icon(
                                    FontAwesomeIcons.notesMedical,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'Macros Calculator',
                                    style: TextStyle(color: Colors.black,fontSize: 18),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 2,color: Color(0xffffc400),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => AboutUs3()));
                                  },
                                  leading: Icon(
                                    FontAwesomeIcons.info,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'About Us',
                                    style: TextStyle(color: Colors.black,fontSize: 18),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ContactUs3()));
                                  },
                                  leading: Icon(
                                    Icons.person,size: 30.0,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'Contact Us',
                                    style: TextStyle(color: Colors.black,fontSize: 18),
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Divider(
                                  height: 1,
                                  thickness: 2,color: Color(0xffffc400),
                                ),
                                SizedBox(height: 10,),
                                // ListTile(
                                //   leading: Icon(Icons.stars,
                                //       color: Colors.black
                                //   ),
                                //   title: Text(
                                //     'Rate Us',
                                //     style: TextStyle(
                                //       fontSize: 18,
                                //     ),
                                //   ),
                                //   onTap: null,
                                // ),
                                ListTile(
                                  leading: Icon(FontAwesomeIcons.textHeight,
                                      color: Colors.black
                                  ),
                                  title: Text(
                                    'Terms and Condition',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  onTap:  () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder : (context) => TermsAndCondtions()),
                                    );
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.privacy_tip_outlined,
                                      color: Colors.black
                                  ),
                                  title: Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  onTap:  () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder : (context) => PrivacyPolicy()),
                                    );
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.cancel_rounded,
                                      color: Colors.black
                                  ),
                                  title: Text(
                                    'Cancellation/Refund Policy',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  onTap:  () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder : (context) => CancellationRefund()),
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
