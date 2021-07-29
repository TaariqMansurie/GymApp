import 'package:GymApp/Screens/BMII/landing_screen2.dart';
import 'package:GymApp/Screens/BMII/landing_screen.dart';
import 'package:GymApp/Screens/BMR/screens/main_page.dart';
import 'package:GymApp/Screens/BMR/screens/main_page2.dart';
import 'package:GymApp/Screens/Payment/razorpay_payment.dart';
import 'package:GymApp/Screens/userhome2.dart';
import 'package:GymApp/home2.dart';
import 'package:GymApp/shared/users.dart';
import 'package:GymApp/userProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

class UserNavigationDrawer extends StatelessWidget {
  DocumentSnapshot data;

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
                  String profilePicUrl = snapshot.data['profile_photo_url'];
                  print({profilePicUrl});
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Colors.deepPurple[100],
                        ),
                        child: Drawer(
                          child: Column(
                            // padding:EdgeInsets.zero,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              DrawerHeader(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.deepPurple[400],
                                      Colors.deepPurple[800]
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
                                              color: Colors.black), //TextStyle
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
                                              color: Colors.black,
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
                                hoverColor: Colors.blue[200],
                                focusColor: Colors.blue[200],
                                onTap: () {
                                  Navigator.push(
                                    context, MaterialPageRoute(builder : (context) => UserHome2()),
                                  );
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.person,
                                    color: Colors.black
                                ),
                                title: Text(
                                  'Profile',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                hoverColor: Colors.blue[200],
                                focusColor: Colors.blue[200],
                                onTap: () {
                                  Navigator.push(
                                    context, MaterialPageRoute(builder : (context) => Profile()),
                                  );
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.monetization_on,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  'Payments',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                hoverColor: Colors.blue[200],
                                focusColor: Colors.blue[200],
                                onTap: () {
                                  Navigator.push(
                                    context, MaterialPageRoute(builder : (context) => RazorpayPayment()),
                                  );
                                },
                              ),
                              SizedBox(height: 10,),
                              Divider(
                                height: 1,
                                thickness: 2,color: Colors.black38,
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
                                hoverColor: Colors.blue[200],
                                focusColor: Colors.blue[200],
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
                                hoverColor: Colors.blue[200],
                                focusColor: Colors.blue[200],
                                onTap: () {
                                  Navigator.push(
                                    context, MaterialPageRoute(builder : (context) => BmrHome2()),
                                  );
                                },
                              ),
                              // ListTile(
                              //   leading: Icon(Icons.settings),
                              //   title: Text(
                              //     'Settings',
                              //     style: TextStyle(
                              //       fontSize: 18,
                              //     ),
                              //   ),
                              //   onTap: null,
                              // ),
                              Divider(
                                height: 1,
                                thickness: 2,color: Colors.black38,
                              ),
                              SizedBox(height: 10,),
                              ListTile(
                                leading: Icon(Icons.stars,
                                    color: Colors.black
                                ),
                                title: Text(
                                  'Rate Us',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                onTap: null,
                              ),
                            ],
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
}
//    Widget build(BuildContext context) {
//     return SizedBox (
//       width: MediaQuery.of(context).size.width*0.8,
//       child: Theme(
//       data: Theme.of(context).copyWith(
//       canvasColor: Colors.deepPurple[100],), //This will change the drawer background to blue.
//       //other styles
//         child: Drawer(
//           child : Column (
//             crossAxisAlignment: CrossAxisAlignment.stretch ,
//             children : <Widget>[
//               DrawerHeader(
//           decoration: BoxDecoration (
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.deepPurple[400],
//                   Colors.deepPurple[800]
//                   ],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                 ),
//               ),

//                 child : Padding (
//                   padding : EdgeInsets.all(6),
//                   child : Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Container (
//                         width : 60,
//                         height : 60,
//                         child :CircleAvatar(
//                           child: Text(''),
//                           backgroundColor: Colors.deepPurple[800],
//                         ),
//                       ),

//                       SizedBox(height :15),
//                       Text (
//                         'Username',
//                         style : TextStyle(
//                             fontSize : 16 ,
//                             fontWeight: FontWeight.w600 ,
//                             color : Colors.white
//                         ), //TextStyle
//                       ), //Text
//                       SizedBox (height : 3),
//                       Text(
//                         'Email id',
//                         style : TextStyle (
//                             color : Colors.white ,
//                             fontSize : 12
//                         ),//TextStyle
//                       ), //Text
//                     ],
//                   ),
//                 ),
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => Home()));
//                 },
//                 leading: Icon(
//                   FontAwesomeIcons.home,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   'Home',
//                   style: TextStyle(color: Colors.black),
//                 ),hoverColor: Colors.deepPurple[100],
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => BMICalculator()));
//                 },
//                 hoverColor: Colors.pink,
//                 leading: Icon(
//                   FontAwesomeIcons.calculator,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   'BMI CALCULATOR',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => BmrHome()));
//                 },
//                 leading: Icon(
//                   FontAwesomeIcons.stickyNote,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   'BMR CALCULATOR',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               SizedBox(height: 15,),
//               Divider(
//                 height: 1,
//                 thickness: 2,color: Colors.black38,
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => AboutUs()));
//                 },
//                 leading: Icon(
//                   FontAwesomeIcons.info,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   'About Us',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => AboutUs()));
//                 },
//                 leading: Icon(
//                   Icons.person,size: 30.0,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   'Contact Us',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               SizedBox(height: 15,),
//               Divider(
//                 height: 1,
//                 thickness: 2,color: Colors.black38,
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Chat()));
//                 },
//                 leading: Icon(
//                   FontAwesomeIcons.key,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   'Chat',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Register()));
//                 },
//                 leading: Icon(
//                   Icons.person_add,size: 30.0,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   'SignUp',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               Divider(
//                 height: 1,
//                 thickness: 2,color: Colors.black38,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
