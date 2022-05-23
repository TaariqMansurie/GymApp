import 'package:GymApp/Drawers/homeNavigationDrawer.dart';
import 'package:GymApp/Screens/BMII/Screens/input_page3.dart';
import 'package:GymApp/Screens/BMR/screens/main_page3.dart';
import 'package:GymApp/Screens/Description/crossfit.dart';
import 'package:GymApp/Screens/Description/functional.dart';
import 'package:GymApp/Screens/Description/group_training.dart';
import 'package:GymApp/Screens/Description/kickboxing.dart';
import 'package:GymApp/Screens/Description/online_training.dart';
import 'package:GymApp/Screens/Description/pilates.dart';
import 'package:GymApp/Screens/Description/weight_training.dart';
import 'package:GymApp/Screens/Description/yoga.dart';
import 'package:GymApp/Screens/Diet/diet4.dart';
import 'package:GymApp/Screens/Trainers/trainersList3.dart';
import 'package:GymApp/Screens/Trainings/list_of_trainings3.dart';
import 'package:GymApp/Screens/askAnExpert.dart';
import 'package:GymApp/Screens/fitnessBlogs.dart';
import 'package:GymApp/about_us2.dart';
import 'package:GymApp/askAnExpert2.dart';
import 'package:GymApp/contact_us2.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Authentication/login.dart';
import 'Screens/Macros Calculator/landing_page3.dart';
import 'Screens/Trainings/list_of_trainings.dart';

class Home2 extends StatefulWidget {
  const Home2({Key key}) : super(key: key);
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  int _currentIndex= 0 ;
  List transformationList = [
    Transformation1(),
    Transformation2(),
    Transformation3(),
    Transformation4()
  ];

  int currentIndex = 0;
  List eyeCatchyList = [
    //trainers
    TrainerList(),
    //services
    Training(),
    //ask the expert
    AaskTheExpert(),
    //diet
    diet4(),
    //know about fitnezz den
    aboutUs2()
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  double value = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeight = MediaQuery.of(context).size.height ;
    var screenWidth = MediaQuery.of(context).size.width ;
    return Scaffold(
      appBar: new AppBar(
        title: Text(
            'Welcome to Fitnezz Den',style: TextStyle(
            color: Color(0xffffc400),fontSize: 16
            ),
          ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        child:  Stack(
                children: <Widget>[
                  Container(
                    // Here the height of the container is 45% of our total height
                    height: size.height * .45,
                    decoration: BoxDecoration(
                     // color: Color(0xFFF5CEB8),
                      color: Colors.white,
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage("assets/undraw_pilates_gpdb.png"),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      //child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: (){
                                _alertDialog();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Color(0xffffc400),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        alignment: Alignment.centerLeft,
                                        image : AssetImage("assets/undraw_pilates_gpdb.png")
                                    )
                                ),
                                child: SvgPicture.asset("assets/menu.svg"),
                              ),
                            ),
                          ),

                          //intro title
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Center(
                              child: Text(
                                "Start your fitness journey now",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(fontWeight: FontWeight.w900,fontSize: 18),textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 5),
                          //   child: Center(
                          //     child: Text(
                          //       "journey now ",
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .headline4
                          //           .copyWith(fontWeight: FontWeight.w900,fontSize: 16),textAlign: TextAlign.start,
                          //     ),
                          //   ),
                          // ),

                          SizedBox(height: 10.0 ,),

                          CarouselSlider(
                            options: CarouselOptions(
                              enlargeCenterPage: false,
                              height: 158.0,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 6),
                              autoPlayAnimationDuration: Duration(milliseconds: 1000),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              pauseAutoPlayOnTouch: true,pageSnapping: true,
                              aspectRatio: 4.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                            items: eyeCatchyList.map((card) {
                              return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.30,
                                      width: 230 ,
                                      child: Card(
                                        color: Colors.white12,
                                        child: card,
                                      ),
                                    );
                                  }
                              );
                            }).toList(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: map<Widget>(eyeCatchyList, (index, url) {
                              return Container(
                                width: 10.0,
                                height: 10.0,
                                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == index ? Color(0xffffc400) : Colors
                                      .black,
                                ),
                              );
                            }),

                          ),

                          SizedBox(height: 25.0 ,),

                          //bmi & bmr
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,0,0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Calculate your" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => InputPage3()
                                    )
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Container(
                                      height: screenHeight * .08,
                                      width: screenWidth * .35,
                                      //color: Colors.black,
                                      //text,icon ke saath vaali padding
                                      decoration: BoxDecoration(
                                        color: Color(0xffffc400),
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text('BMI',
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
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => BmrHome3()
                                    )
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                                    child: Container(
                                      height: screenHeight * 0.08,
                                      width: screenWidth * .35,
                                      //color: Colors.black,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(color: Color(0xffffc400)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text('BMR',
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
                          ),
                          SizedBox(height: 10,),
                          //macros calculation
                          Center(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => LandingPage3()
                                )
                                );                                  },
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Text('Macros',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffffc400),fontSize: 12
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25.0,),

                          //trainer of the week and month
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
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    _alertDialog() ;
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
                                    _alertDialog() ;
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
                                        child: Text('Trainer of \nthe month',
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
                          ),

                          SizedBox(height: 25.0,),

                          //professional trainers
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: (){
                                    _alertDialog();
                                  },
                                  child: Container(
                                    height: screenHeight * 0.08,
                                    width: screenWidth * 0.35,
                                    //color: Colors.black,
                                    decoration: BoxDecoration(
                                      color: Colors.black ,
                                      border: Border.all(color: Color(0xffffc400)),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text('Hire Male/\nFemale Trainers',
                                        style: GoogleFonts.montserrat(
                                            color: Color(0xffffc400),
                                            fontWeight: FontWeight.bold,fontSize: 12
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => Diet4()
                                    )
                                    );
                                  },
                                  child: Container(
                                    height: screenHeight * 0.08,
                                    width: screenWidth * 0.35,
                                    //color: Colos.blarck,
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
                              ],
                            ),
                          ),

                          SizedBox(height: 25,),

                          //diet ka
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,0,0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Fitness Helpline",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => AskTheExpert2()
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


                          SizedBox(height: 25,),

                          //cards services ke
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment:Alignment.center,
                                child: Text(
                                  "         Our Trainer's \n         Expertise" ,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontWeight: FontWeight.w900),
                                ),
                              ),
                              ExploreAllButton2(
                                onTap: () {
                                  Navigator.push(
                                    context, MaterialPageRoute(
                                      builder: (context) => Trainings()),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          //scrollh
                          // Container(
                          //   height: 100,
                          //   child: ListView(
                          //     padding: EdgeInsets.all(10),
                          //     scrollDirection: Axis.horizontal,
                          //     children: <Widget>[
                          //
                          //       SizedBox(width: 15,),
                          //
                          //       //weight training
                          //       InkWell(
                          //         onTap: () {
                          //           Navigator.push(
                          //               context, MaterialPageRoute(builder: (context) => WeightTraining()
                          //           )
                          //           );
                          //         },
                          //         child: Container(
                          //           decoration: BoxDecoration(
                          //             color: Colors.black,
                          //             borderRadius: BorderRadius.circular(13),
                          //             boxShadow: [
                          //               BoxShadow(
                          //                 offset: Offset(0, 17),
                          //                 blurRadius: 17,
                          //                 spreadRadius: -23,
                          //                 color: Color(0xFFE6E6E6),
                          //               ),
                          //             ],
                          //           ),
                          //           height: 50,
                          //           width: 100,
                          //           child: Card(
                          //             color: Color(0xffffc400),
                          //             shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(12.0),
                          //             ),
                          //             // color: Colors.white,
                          //             elevation: 10,
                          //             child: Column(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: <Widget>[
                          //                 Spacer(),
                          //                 const ListTile(horizontalTitleGap: 0,
                          //                   dense: true,
                          //                   leading: Icon(FontAwesomeIcons.dumbbell, size: 20,color: Colors.black,),
                          //                   title: Text('Weight',style: TextStyle(color: Colors.black),),
                          //                   contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),                                          ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //
                          //       SizedBox(width: 15,),
                          //
                          //       // yoga ka card
                          //       InkWell(
                          //         onTap: (){
                          //           Navigator.push(
                          //               context, MaterialPageRoute(builder: (context) => Yoga()
                          //           )
                          //           );
                          //         },
                          //         child: Container(
                          //           decoration: BoxDecoration(
                          //             // image: new DecorationImage(
                          //             //   image: new AssetImage('assets/apple.png'),
                          //             //   fit: BoxFit.fill,
                          //             // ),
                          //             color: Colors.black,
                          //             borderRadius: BorderRadius.circular(13),
                          //             border: Border.all(color: Color(0xffffc400)),
                          //             boxShadow: [
                          //               BoxShadow(
                          //                 offset: Offset(0, 17),
                          //                 blurRadius: 17,
                          //                 spreadRadius: -23,
                          //                 color: Color(0xFFE6E6E6),
                          //               ),
                          //             ],
                          //           ),
                          //           height: 50,
                          //           width: 100,
                          //           child: Card(
                          //             color: Colors.black,
                          //             shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(12.0),
                          //             ),
                          //             // color: Colors.white,
                          //             elevation: 10,
                          //             child: Column(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: <Widget>[
                          //                 Spacer(),
                          //                 const ListTile(
                          //                   horizontalTitleGap: 0,
                          //                   dense: true,
                          //                   leading: Icon(FontAwesomeIcons.child, size: 20,color: Color(0xffffc400),),
                          //                   title: Text('Yoga',style: TextStyle(color: Color(0xffffc400)),),
                          //                   contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                          //                   //subtitle: Text('Secondary Text'),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //
                          //       SizedBox(width: 5,),
                          //
                          //       //crossfit ka card
                          //       // InkWell(
                          //       //   onTap: () {
                          //       //     Navigator.push(
                          //       //         context, MaterialPageRoute(builder: (context) => CrossfitTraining()
                          //       //     )
                          //       //     );
                          //       //   },
                          //       //   child: Container(
                          //       //     decoration: BoxDecoration(
                          //       //       // image: new DecorationImage(
                          //       //       //   image: new AssetImage('assets/apple.png'),
                          //       //       //   fit: BoxFit.fill,
                          //       //       // ),
                          //       //       color: Colors.black,
                          //       //       borderRadius: BorderRadius.circular(13),
                          //       //       boxShadow: [
                          //       //         BoxShadow(
                          //       //           offset: Offset(0, 17),
                          //       //           blurRadius: 17,
                          //       //           spreadRadius: -23,
                          //       //           color: Color(0xFFE6E6E6),
                          //       //         ),
                          //       //       ],
                          //       //     ),
                          //       //     height: 50,
                          //       //     width: 80,
                          //       //     child: Card(
                          //       //       color: Color(0xffffc400),
                          //       //       shape: RoundedRectangleBorder(
                          //       //         borderRadius: BorderRadius.circular(12.0),
                          //       //       ),
                          //       //       // color: Colors.white,
                          //       //       elevation: 10,
                          //       //       child: Column(
                          //       //         mainAxisSize: MainAxisSize.min,
                          //       //         children: <Widget>[
                          //       //           Spacer(),
                          //       //           const ListTile(
                          //       //             leading: Icon(FontAwesomeIcons.hammer, size: 20,color: Colors.black,),
                          //       //             //subtitle: Text('Secondary Text'),
                          //       //           ),
                          //       //         ],
                          //       //       ),
                          //       //     ),
                          //       //   ),
                          //       // ),
                          //     ],
                          //   ),
                          // ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Container(
                              width: screenWidth * 1,
                              height: screenHeight * 0.09,
                              child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisSize: MainAxisSize.max,
                               children: [
                                 InkWell(
                                   onTap: (){
                                     Navigator.push(
                                       context, MaterialPageRoute(
                                         builder: (context) => OnlineTraining()),
                                     );
                                   },
                                   child: Container(
                                     width: screenWidth * 0.20,
                                     height: screenHeight * 0.08,
                                     padding: EdgeInsets.all(8),
                                     decoration: BoxDecoration(
                                       border: Border.all(color: Colors.black),
                                       color: Color(0xffffc400),
                                       borderRadius: BorderRadius.only(
                                           topLeft: Radius.circular(10),
                                           topRight: Radius.circular(10),
                                           bottomRight: Radius.circular(10)),
                                     ),
                                     child: Center(
                                       child: Text(
                                         'Online\nTraining',
                                         style: GoogleFonts.varelaRound(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w600,
                                             color: Colors.black),
                                       ),
                                     ),
                                   ),
                                 ),
                                 InkWell(
                                   onTap: (){
                                     Navigator.push(
                                       context, MaterialPageRoute(
                                         builder: (context) => WeightTraining()),
                                     );
                                   },
                                   child: Container(
                                     width: screenWidth * 0.20,
                                     height: screenHeight * 0.08,
                                     padding: EdgeInsets.all(8),
                                     decoration: BoxDecoration(
                                       color: Colors.black,
                                       borderRadius: BorderRadius.only(
                                           topLeft: Radius.circular(10),
                                           topRight: Radius.circular(10),
                                           bottomRight: Radius.circular(10)),
                                     ),
                                     child: Center(
                                       child: Text(
                                         'Weight\nTraining',
                                         style: GoogleFonts.varelaRound(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w600,
                                             color: Color(0xffffc400)),
                                       ),
                                     ),
                                   ),
                                 ),
                                 InkWell(
                                   onTap: (){
                                     Navigator.push(
                                       context, MaterialPageRoute(
                                         builder: (context) => FunctionalTraining()),
                                     );
                                   },
                                   child: Container(
                                     width: screenWidth * 0.20,
                                     height: screenHeight * 0.08,
                                     padding: EdgeInsets.all(8),
                                     decoration: BoxDecoration(
                                       color: Color(0xffffc400),
                                       borderRadius: BorderRadius.only(
                                           topLeft: Radius.circular(10),
                                           topRight: Radius.circular(10),
                                           bottomRight: Radius.circular(10)),
                                     ),
                                     child: Center(
                                       child: Text(
                                         'Functional\nTraining',
                                         style: GoogleFonts.varelaRound(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w600,
                                             color: Colors.black),
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                         ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: screenWidth * 1,
                            height: screenHeight * 0.085,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) => CrossfitTraining()),
                                    );
                                  },
                                  child: Container(
                                    width: screenWidth * 0.20,
                                    height: screenHeight * 0.08,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Crossfit\nTraining',
                                        style: GoogleFonts.varelaRound(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffffc400)),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) => Pilates()),
                                    );
                                  },
                                  child: Container(
                                    width: screenWidth * 0.20,
                                    height: screenHeight * 0.08,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color(0xffffc400),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Pilates\nTraining',
                                        style: GoogleFonts.varelaRound(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),                            child: Container(
                              width: screenWidth * 1,
                              height:  screenHeight * 0.085,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) => Yoga()),
                                      );
                                    },
                                    child: Container(
                                      width: screenWidth * 0.20,
                                      height: screenHeight * 0.08,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Yoga\nTraining',
                                          style: GoogleFonts.varelaRound(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffffc400)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) => KickBoxing()),
                                      );
                                    },
                                    child: Container(
                                      width: screenWidth * 0.20,
                                      height: screenHeight * 0.08,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                      color: Color(0xffffc400),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                      child: Center(
                                        child: Text(
                                          'MMA\nTraining',
                                          style: GoogleFonts.varelaRound(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) => GroupTraining()),
                                      );
                                    },
                                    child: Container(
                                      width: screenWidth * 0.20,
                                      height: screenHeight * 0.08,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                      child: Center(
                                        child: Text(
                                          'Group\nTraining',
                                          style: GoogleFonts.varelaRound(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffffc400)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          // Container(
                          //   width: screenWidth * 1,
                          //   height: screenHeight * 0.085,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: [
                          //       InkWell(
                          //         onTap: (){
                          //           Navigator.push(
                          //             context, MaterialPageRoute(
                          //               builder: (context) => CuppingTheory()),
                          //           );
                          //         },
                          //         child: Container(
                          //           width: screenWidth * 0.25,
                          //           height: screenHeight * 0.09,
                          //           padding: EdgeInsets.all(8),
                          //           decoration: BoxDecoration(
                          //             color: Color(0xffffc400),
                          //             borderRadius: BorderRadius.only(
                          //                 topLeft: Radius.circular(10),
                          //                 topRight: Radius.circular(10),
                          //                 bottomRight: Radius.circular(10)),
                          //           ),
                          //           child: Center(
                          //             child: Text(
                          //               'Cupping\nTherapy',
                          //               style: GoogleFonts.varelaRound(
                          //                   fontSize: 12,
                          //                   fontWeight: FontWeight.w600,
                          //                   color: Colors.black,
                          //             ),
                          //         ),
                          //           ),
                          //         ),
                          //       ),
                          //       InkWell(
                          //         onTap: (){
                          //           Navigator.push(
                          //             context, MaterialPageRoute(
                          //               builder: (context) => PhysioTherapy()),
                          //           );
                          //         },
                          //         child: Container(
                          //           width: screenWidth * 0.25,
                          //           height: screenHeight * 0.09,
                          //           padding: EdgeInsets.all(8),
                          //           decoration: BoxDecoration(
                          //             color: Colors.black,
                          //             borderRadius: BorderRadius.only(
                          //                 topLeft: Radius.circular(10),
                          //                 topRight: Radius.circular(10),
                          //                 bottomRight: Radius.circular(10)),
                          //           ),
                          //           child: Center(
                          //             child: Text(
                          //               'Physio\nTherapy',
                          //               style: GoogleFonts.varelaRound(
                          //                   fontSize: 12,
                          //                   fontWeight: FontWeight.w600,
                          //                   color: Color(0xffffc400)),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          SizedBox(height: 25.0,),

                          //life changing transformations
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                "Life Changing Transformations" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          SizedBox(height:25.0,),
                          CarouselSlider(
                            options: CarouselOptions(
                              enlargeCenterPage: false,
                              height: 158.0,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 6),
                              autoPlayAnimationDuration: Duration(milliseconds: 1000),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              pauseAutoPlayOnTouch: true,
                              aspectRatio: 4.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                            items: transformationList.map((card) {
                              return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.30,
                                      width: 230 ,
                                      child: Card(
                                        color: Colors.blueGrey,
                                        child: card,
                                      ),
                                    );
                                  }
                              );
                            }).toList(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: map<Widget>(transformationList, (index, url) {
                              return Container(
                                width: 10.0,
                                height: 10.0,
                                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == index ? Color(0xffffc400) : Colors
                                      .black,
                                ),
                              );
                            }),

                          ),

                          SizedBox(height:25.0,),

                          //about us
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => AboutUs2()
                                )
                              );
                            },
                            child: Center(
                              child: Container(
                                height: screenHeight * 0.08,
                                width: screenWidth * 0.76,
                                //color: Colors.black,
                                decoration: BoxDecoration(
                                  color: Colors.black ,
                                  border: Border.all(color: Color(0xffffc400)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text('About Fitnezz Den',
                                    style: GoogleFonts.montserrat(
                                        color: Color(0xffffc400),
                                        fontWeight: FontWeight.bold,fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height:25.0,),

                          //blogs
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => FitnessBlogs()
                                )
                              );
                            },
                            child: Center(
                              child: Container(
                                height: screenHeight * 0.08,
                                width: screenWidth * 0.76,
                                //color: Colors.black,
                                decoration: BoxDecoration(
                                  color: Color(0xffffc400) ,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text('Weekly Fitness Updates.',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 25,),

                          //contact us
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => ContactUs2()
                              )
                              );
                            },
                            child: Center(
                              child: Container(
                                height: screenHeight * 0.08,
                                width: screenWidth * 0.76,
                                //color: Colors.black,
                                decoration: BoxDecoration(
                                  color: Colors.black ,
                                  border: Border.all(color: Color(0xffffc400)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text('Contact Us',
                                    style: GoogleFonts.montserrat(
                                        color: Color(0xffffc400),
                                        fontWeight: FontWeight.bold,fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20,),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      drawer: HiddenDrawer(),
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


class ExploreAllButton2 extends StatelessWidget {
  final Function onTap;
  const ExploreAllButton2({
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

class Transformation1 extends StatelessWidget {
  const Transformation1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/tr4.png',
            height: 150.0,
            fit: BoxFit.contain,
            width: 200,
          )
        ],
      ),
    );
  }
}

class Transformation2 extends StatelessWidget {
  const Transformation2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/tr3.png',
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}

class Transformation3 extends StatelessWidget {
  const Transformation3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/tr1.png',
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}

class Transformation4 extends StatelessWidget {
  const Transformation4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/tr5.png',
            fit: BoxFit.contain,
            height: 150.0,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

class TrainerList extends StatelessWidget {
  const TrainerList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TrainersList3()
          )
          );
        },
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/gifs/p.png',
              height: 150.0,
              fit: BoxFit.contain,
              width: 250,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Star Trainers" ,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w900,backgroundColor: Colors.white,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Training extends StatelessWidget {
  const Training({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Trainings3()
          )
          );
        },
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/gifs/m.png',
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Training Services" ,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w900,backgroundColor: Colors.white,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AaskTheExpert extends StatelessWidget {
  const AaskTheExpert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AskTheExpert()
          )
          );
        },
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/gifs/n.png',
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Ask An Expert" ,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w900,backgroundColor: Colors.white,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class diet4 extends StatelessWidget {
  const diet4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Diet4()
          )
          );
        },
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/gifs/j.png',
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Diet Packages" ,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w900,backgroundColor: Colors.white,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class aboutUs2 extends StatelessWidget {
  const aboutUs2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutUs2()
          )
          );
        },
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/gifs/o.png',
              fit: BoxFit.contain,
              height: 150.0,
              width: double.infinity,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "About Us " ,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w900,backgroundColor: Colors.white,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

