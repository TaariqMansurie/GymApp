import 'dart:async';
import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Screens/Description/crossfit.dart';
import 'package:GymApp/Screens/Description/weight_training.dart';
import 'package:GymApp/Screens/Description/yoga.dart';
import 'package:GymApp/Screens/Packages/gold.dart';
import 'package:GymApp/Screens/Packages/goldFemale.dart';
import 'package:GymApp/Screens/Packages/platinum.dart';
import 'package:GymApp/Screens/Packages/platinumFemale.dart';
import 'package:GymApp/Screens/Packages/silver.dart';
import 'package:GymApp/Screens/Trainers/trialForm.dart';
import 'package:GymApp/Screens/Trainings/list_of_trainings3.dart';
import 'package:GymApp/Screens/askAnExpert.dart';
import 'package:GymApp/Screens/description_fitnezz_den_warriors.dart';
import 'package:GymApp/Screens/fitnessBlogs.dart';
import 'package:GymApp/Screens/home.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:GymApp/shared/users.dart';
import 'package:GymApp/trainerOfTheMonth.dart';
import 'package:GymApp/trainerOfTheMonthFemale.dart';
import 'package:GymApp/trainerOfTheWeek.dart';
import 'package:GymApp/trainerOfTheWeekFemale.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Description/online_training.dart';
import 'Diet/diet5.dart';
import 'Transformations/transformation1.dart';

class UserHome2 extends StatefulWidget {
  const UserHome2({Key key}) : super(key: key);

  @override
  _UserHome2State createState() => _UserHome2State();
}

class _UserHome2State extends State<UserHome2> {
  final AuthService _auth = AuthService();
  DocumentSnapshot data;
  ScrollController _controller ;
  ScrollController _controller2 ;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height ;
    var screenWidth = MediaQuery.of(context).size.width ;
    String uid = Provider.of<User>(context).uid;
    return Scaffold(
      appBar: new AppBar(
        title: Text(
            'Home',style: TextStyle(
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
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Chat With Us, So that we can assist you. ',
      //   backgroundColor: Colors.black,
      //   elevation: 10.0,
      //   onPressed: (){
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoom()));
      //   },
      //   child: const Icon(FontAwesomeIcons.rocketchat,color: Color(0xffffc400),),
      // ),
      drawer: UserNavigationDrawer(),
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('users')
            .document(uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot)  {
          if (snapshot.hasData) {
            print(snapshot.hasData);
            String userName = snapshot.data['userName'];
            String email = snapshot.data['userEmail'];
            String gender = snapshot.data['gender'];
            var profilePicUrl;
            profilePicUrl = snapshot.data['profile_pic_url'];
            print({profilePicUrl});
            print(email);
          return Scrollbar(
            controller: _controller,
            interactive: true,
            thickness: 7,
            showTrackOnHover: true,
            isAlwaysShown: true,
            radius: Radius.circular(20),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text(
                          "Welcome Back \n${userName.toUpperCase()} !" ,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.w900),textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    SizedBox(height: 20.0,),

                    //TRAININGS WE OFFER (SERVICES)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Trainings we Offer",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ExploreAllButton3(
                            onTap: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => Trainings3()),
                              );
                            },
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                        child: Scrollbar(
                          controller: _controller2,
                          interactive: true,
                          thickness: 8,
                          showTrackOnHover: true,
                          isAlwaysShown: true,
                          radius: Radius.circular(20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0,left: 5.0),
                              child: Row(
                                children: <Widget>[
                                  buildImageCard1(),
                                  buildImageCard2(),
                                  buildImageCard3(),
                                  buildImageCard4(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25.0,),

                    //trial
                    InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => TrialForm()
                    )
                    );
                  },
                  child: Center(
                    child: Container(
                      height: screenHeight * 0.076,
                      width: screenWidth * 0.80,
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Color(0xffffc400)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text('Book a Trial Now !!',
                          style: GoogleFonts.montserrat(
                              color: Color(0xffffc400),
                              fontWeight: FontWeight.bold,fontSize: 12
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                    SizedBox(height: 25.0,),

                    //totw&totm
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Trainer Of The Week & Month",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            gender == 'MALE'?
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => TOTW()
                            )
                            ):Navigator.push(
                                context, MaterialPageRoute(builder: (context) => TOTWFemale()
                            )
                            ) ;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                            child: Container(
                              height: screenHeight * 0.08,
                              width: screenWidth * 0.35,
                              //color: Colors.black,
                              decoration: BoxDecoration(
                                color: Color(0xffffc400),
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text('Trainer of \nthe week',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,fontSize: 12
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            gender == 'MALE'?
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => TOTM()
                            )
                            ):Navigator.push(
                                context, MaterialPageRoute(builder: (context) => TOTMFemale()
                            )
                            ) ;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                            child: Container(
                              height: screenHeight * 0.08,
                              width: screenWidth * 0.35,
                              //color: Colors.black,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Color(0xffffc400)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text('Trainer of \nthe Month',
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

                    SizedBox(height: 25.0,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Description()
                         )
                        );
                      },
                      child: Center(
                        child: Container(
                          height: screenHeight * 0.076,
                          width: screenWidth * 0.80,
                          //color: Colors.black,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text('Fitnezz Den Warriors',
                              style: GoogleFonts.montserrat(
                                  color: Color(0xffffc400),
                                  fontWeight: FontWeight.bold,fontSize: 12
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0,),


                    //PACKAGES
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Trainer's list",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * .25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20), topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20) )),
                        child: Column(
                          children: [
                            gender == 'MALE' ? Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                SilverPackage(),
                                GoldPackage(),
                             // buildPlatinumPackageCard(),
                              ],
                            ):Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  GoldPackageF(),
                                ],
                              ),

                            SizedBox(height:10.0),

                           gender == 'MALE' ? Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                PlatinumPackage(),
                                //GoldPackage(),
                               ],
                            ):  Row(
                             mainAxisSize: MainAxisSize.max,
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.only(right: 10.0),
                                 child: PlatinumPackageF(),
                               ),
                             ],
                           )
                          ],

                        ),
                      ),
                    ),

                    SizedBox(height: 25.0,),

                    //DIET PACKAGES
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Diet5()
                        )
                        );
                      },
                      child: Center(
                        child: Container(
                          height: screenHeight * 0.076,
                          width: screenWidth * 0.80,
                          //color: Colors.black,
                          decoration: BoxDecoration(
                            color: Color(0xffffc400),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text('Diet Packages',
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,fontSize: 12
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25.0,),

                    //fitness blogs
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => FitnessBlogs()
                          )
                        );
                      },
                      child: Center(
                        child: Container(
                          height: screenHeight * 0.076,
                          width: screenWidth * 0.80,
                          //color: Colors.black,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Color(0xffffc400)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text('Weekly Fitness Updates',
                              style: GoogleFonts.montserrat(
                                color: Color(0xffffc400),
                                fontWeight: FontWeight.bold,fontSize: 12
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25,),

                    //bmi , bmr and macros
                    //BMI AND BMR
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(10,10,0,0),
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       "Calculate your" ,
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .headline6
                    //           .copyWith(fontWeight: FontWeight.w900),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10,),
                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: <Widget>[
                    //     InkWell(
                    //       onTap: (){
                    //         Navigator.push(
                    //             context, MaterialPageRoute(builder: (context) => InputPage3()
                    //           )
                    //         );
                    //       },
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                    //         child: Container(
                    //           height: screenHeight * 0.076,
                    //           width: screenWidth * 0.45,
                    //           //color: Colors.black,
                    //           decoration: BoxDecoration(
                    //             color: Color(0xffffc400),
                    //             border: Border.all(color: Colors.black),
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           child: Center(
                    //             child: Text('BMI',
                    //               style: GoogleFonts.montserrat(
                    //                   color: Colors.black,
                    //                   fontWeight: FontWeight.bold
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: (){
                    //         Navigator.push(
                    //             context, MaterialPageRoute(builder: (context) => BmrHome3()
                    //         )
                    //         );
                    //       },
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                    //         child: Container(
                    //           height: screenHeight * 0.076,
                    //           width: screenWidth * 0.45,
                    //           //color: Colors.black,
                    //           decoration: BoxDecoration(
                    //             color: Colors.black,
                    //             border: Border.all(color: Color(0xffffc400)),
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           child: Center(
                    //             child: Text('BMR',
                    //               style: GoogleFonts.montserrat(
                    //                   color: Color(0xffffc400),
                    //                   fontWeight: FontWeight.bold
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 10,),
                    //
                    // //macro calculator
                    // Center(
                    //   child: InkWell(
                    //     onTap: (){
                    //       Navigator.push(
                    //           context, MaterialPageRoute(builder: (context) => LandingPage3()
                    //       )
                    //       );
                    //       },
                    //     child: Container(
                    //       height: screenHeight * 0.076,
                    //       width: screenWidth * 0.45,
                    //       //color: Colors.black,
                    //       padding: const EdgeInsets.fromLTRB(10,0,0,0),
                    //       decoration: BoxDecoration(
                    //         color: Color(0xffffc400),
                    //         border: Border.all(color: Colors.black),
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //       child: Center(
                    //         child: Text('Macros',
                    //           style: GoogleFonts.montserrat(
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.bold
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    //
                    // SizedBox(height: 25,),

                    //TRAINERS
                    //professional trainers

                    //professional trainers ek saaath
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(10,0,0,0),
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       "View Our Professional Trainers",
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .headline6
                    //           .copyWith(fontWeight: FontWeight.w900),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10,),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                    //   child: InkWell(
                    //     onTap: (){
                    //       gender == 'MALE' ?
                    //       Navigator.push(
                    //           context, MaterialPageRoute(builder: (context) => TrainersList2()
                    //         )
                    //       ):Navigator.push(
                    //           context, MaterialPageRoute(builder: (context) => FemaleTrainersList2()
                    //       )
                    //       );
                    //     },
                    //     child: Center(
                    //       child: Container(
                    //         height: screenHeight * 0.076,
                    //         width: screenWidth * 0.90,
                    //         //color: Colors.black,
                    //         decoration: BoxDecoration(
                    //           color: Color(0xffffc400),
                    //           border: Border.all(color: Colors.black),
                    //           borderRadius: BorderRadius.circular(20),
                    //         ),
                    //         child: Center(
                    //           child: Text('Get a Trainer',
                    //             style: GoogleFonts.montserrat(
                    //                 color: Colors.black,
                    //                 fontWeight: FontWeight.bold
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 25,),

                    //about us and contact us column mein fir row mein contact us ask an expert ke saath
                    // SizedBox(height:25.0,),

                    //about us
                    // InkWell(
                    //   onTap: (){
                    //     Navigator.push(
                    //         context, MaterialPageRoute(builder: (context) => AboutUs2()
                    //     )
                    //     );
                    //   },
                    //   child: Center(
                    //     child: Container(
                    //       height: screenHeight * 0.076,
                    //       width: screenWidth * 0.90,
                    //       //color: Colors.black,
                    //       padding: const EdgeInsets.fromLTRB(10,0,0,0),
                    //       decoration: BoxDecoration(
                    //         color: Colors.black ,
                    //         border: Border.all(color: Color(0xffffc400)),
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //       child: Center(
                    //         child: Text('About Fitnezz Den',
                    //           style: GoogleFonts.montserrat(
                    //               color: Color(0xffffc400),
                    //               fontWeight: FontWeight.bold
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    //
                    // SizedBox(height: 25,),

                    //contact us
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Fitness Helpline" ,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    // SizedBox(height: 10,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     InkWell(
                    //       onTap: (){
                    //         Navigator.push(
                    //             context, MaterialPageRoute(builder: (context) => ContactUs2()
                    //         )
                    //         );
                    //       },
                    //       child: Center(
                    //         child: Container(
                    //           height: screenHeight * 0.076,
                    //           width: screenWidth * 0.45,
                    //           //color: Colors.black,
                    //           padding: const EdgeInsets.fromLTRB(10,0,0,0),
                    //           decoration: BoxDecoration(
                    //             color: Color(0xffffc400) ,
                    //             border: Border.all(color: Colors.black),
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           child: Center(
                    //             child: Text('Contact Us',
                    //               style: GoogleFonts.montserrat(
                    //                   color: Colors.black,
                    //                   fontWeight: FontWeight.bold
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    InkWell(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => AskTheExpert()
                            )
                            );
                          },
                          child: Center(
                            child: Container(
                              height: screenHeight * 0.076,
                              width: screenWidth * 0.80,
                              //color: Colors.black,
                              padding: const EdgeInsets.fromLTRB(10,0,0,0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Color(0xffffc400) ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text('Ask An Expert',
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xffffc400) ,
                                      fontWeight: FontWeight.bold,fontSize: 12
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    //   ],
                    // ),

                    SizedBox(height: 50,),

                  ],
                ),
              ),
            ),
          );
          } else {
            return Container();
            }
          },
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

  Widget buildImageCard1() => InkWell(
    onTap: () {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => OnlineTraining()),
      );
    },
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Ink.image(
            image: AssetImage(
              'assets/online.png',
            ),
            // colorFilter: ColorFilters.greyscale,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => OnlineTraining()),
                );
              },
            ),
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.30,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 5,
            child: Text(
              'Online \nTraining',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget buildImageCard2() => InkWell(
    onTap: () {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => WeightTraining()),
      );
    },
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Ink.image(
            image: AssetImage(
              'assets/deadlift.png',
            ),
            // colorFilter: ColorFilters.greyscale,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => WeightTraining()),
                );
              },
            ),
            height: MediaQuery.of(context).size.height * 0.10,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.30,
          ),
          Positioned(
            bottom:5,
            child: Text(
              'Weight \nTraining ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget buildImageCard3() => InkWell(
    onTap: () {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => CrossfitTraining()),
      );
    },
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Ink.image(
            image: AssetImage(
              'assets/crossfit.png',
            ),
            //  colorFilter: ColorFilters.greyscale,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => CrossfitTraining()),
                );
              },
            ),
            height: MediaQuery.of(context).size.height * 0.10,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.30,
          ),
          Positioned(
            bottom: 5,
            child: Text(
              'Crossfit \nTraining',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget buildImageCard4() => InkWell(
    onTap: () {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => Yoga()),
      );
    },
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Ink.image(
            image: AssetImage(
              'assets/yoga.png',
            ),
            //  colorFilter: ColorFilters.greyscale,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => Yoga()),
                );
              },
            ),
            height: MediaQuery.of(context).size.height * 0.10,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.30,
          ),
          Positioned(
            bottom: 5,
            child: Text(
              'Yoga ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget buildImageCard5() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: AssetImage(
            'https://i.natgeofe.com/n/3861de2a-04e6-45fd-aec8-02e7809f9d4e/02-cat-training-NationalGeographic_1484324.jpg',
          ),
          colorFilter: ColorFilters.greyscale,
          child: InkWell(
            onTap: () {},
          ),
          height: MediaQuery.of(context).size.height * 0.10,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * 0.30,
        ),
        Text(
          'KickBoxing/MMA ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );

}

class ExploreAllButton3 extends StatelessWidget {
  final Function onTap;
  const ExploreAllButton3({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        child: Text(
          'Explore All',
          style: GoogleFonts.varelaRound(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xffffc400)),
        ),
      ),
    );
  }
}

class SilverPackage extends StatelessWidget {
  final Function onTap;
  const SilverPackage({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height ;
    var screenWidth = MediaQuery.of(context).size.width ;
    return InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SilverPackagee()
          )
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff79766f),
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: Color(0xff79766f),
              ),
            ],
          ),
          height: screenHeight * 0.115,
          width: screenWidth * 0.40,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            // color: Colors.white,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const ListTile(
                  leading: Icon(FontAwesomeIcons.star, size: 20,color: Colors.black,),
                  title: Text('Silver',style: TextStyle(fontSize: 12),),
                  //subtitle: Text('Secondary Text'),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class GoldPackage extends StatelessWidget {
  final Function onTap;
  const GoldPackage({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height ;
    var screenWidth = MediaQuery.of(context).size.width ;
    return InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GoldPackagee()
          )
          );
        },
        child: Container(
          decoration: BoxDecoration(
            // image: new DecorationImage(
            //   image: new AssetImage('assets/apple.png'),
            //   fit: BoxFit.fill,
            // ),
            color: Color(0xffFFD700),
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: Color(0xffFFD700),
              ),
            ],
          ),
          height: screenHeight * 0.115,
          width: screenWidth * 0.40,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            // color: Colors.white,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const ListTile(
                  leading: Icon(FontAwesomeIcons.starHalfAlt, size: 20,color: Colors.black,),
                  title: Text('Gold',style: TextStyle(fontSize: 12),),
                  //subtitle: Text('Secondary Text'),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class PlatinumPackage extends StatelessWidget {
  final Function onTap;
  const PlatinumPackage({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height ;
    var screenWidth = MediaQuery.of(context).size.width ;
    return InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PlatinumPackagee()
          )
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: Colors.blueGrey,
              ),
            ],
          ),
          height: screenHeight * 0.115,
          width: screenWidth * 0.40,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            // color: Colors.white,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const ListTile(
                  leading: Icon(FontAwesomeIcons.solidStar, size: 20,color: Colors.black,),
                  title: Text('Platinum',style: TextStyle(fontSize: 12),),
                  //subtitle: Text('Secondary Text'),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class GoldPackageF extends StatelessWidget {
  final Function onTap;
  const GoldPackageF({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height ;
    var screenWidth = MediaQuery.of(context).size.width ;
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GoldFemale()
        )
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFD700),
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Color(0xffFFD700),
            ),
          ],
        ),
        height: screenHeight * 0.115,
        width: screenWidth * 0.40,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          // color: Colors.white,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ListTile(
                leading: Icon(FontAwesomeIcons.starHalfAlt, size: 20,color: Colors.black,),
                title: Text('Gold',style: TextStyle(fontSize: 12),),
                //subtitle: Text('Secondary Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlatinumPackageF extends StatelessWidget {
  final Function onTap;
  const PlatinumPackageF({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height ;
    var screenWidth = MediaQuery.of(context).size.width ;
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PlatinumFemale()
        )
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[600],
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Colors.blueGrey[600],
            ),
          ],
        ),
        height: screenHeight * 0.115,
        width: screenWidth * 0.40,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          // color: Colors.white,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ListTile(
                leading: Icon(FontAwesomeIcons.solidStar, size: 20,color: Colors.black,),
                title: Text('Platinum',style: TextStyle(fontSize: 12),),
                //subtitle: Text('Secondary Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
