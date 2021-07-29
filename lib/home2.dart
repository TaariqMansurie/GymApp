import 'dart:math';
import 'package:GymApp/Drawers/homeNavigationDrawer.dart';
import 'package:GymApp/Screens/fitnessBlogs.dart';
import 'package:GymApp/shared/users.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Screens/Diet/diet.dart';
import 'Screens/Trainings/crossfit.dart';
import 'Screens/Trainings/list_of_trainings.dart';
import 'Screens/details_screen.dart';

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
   // String uid = Provider.of<User>(context).uid;
    var size = MediaQuery.of(context)
        .size;
    return Scaffold(
      appBar: new AppBar(

        title: Text(
            'Welcome to Fitnezz Den'
        ),
        backgroundColor: Colors.deepPurple[500],
        automaticallyImplyLeading: true,
        // leading: IconButton(
        //   icon: Icon(FontAwesomeIcons.gripLines),
        //   onPressed: () {},
        //   color: Colors.black,
        //   tooltip: 'Menu',
        // ),
      ),
      body: SingleChildScrollView(
        child:  Stack(
                children: <Widget>[
                  Container(
                    // Here the height of the container is 45% of our total height
                    height: size.height * .45,
                    decoration: BoxDecoration(
                     // color: Color(0xFFF5CEB8),
                      color: Colors.deepPurple[50],
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage("assets/undraw_pilates_gpdb.png"),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      //child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: mainAxisSize.min,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              alignment: Alignment.center,
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple[500],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      alignment: Alignment.centerLeft,
                                      image : AssetImage("assets/undraw_pilates_gpdb.png")
                                  )
                              ),
                              child: SvgPicture.asset("assets/menu.svg"),
                            ),
                          ),
                          Row(
                            children:<Widget> [
                              Text(
                                "Welcome aboard ! ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(fontWeight: FontWeight.w900),textAlign: TextAlign.start,
                              ),

                              SizedBox(width: 60.0,),

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
                          SizedBox(height: 10.0 ,),

                          Container(
                            height: 100,
                            child: ListView(
                              padding: EdgeInsets.all(10),
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[

                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // image: new DecorationImage(
                                      //   image: new AssetImage('assets/apple.png'),
                                      //   fit: BoxFit.fill,
                                      // ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(13),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 17),
                                          blurRadius: 17,
                                          spreadRadius: -23,
                                          color: Color(0xFFE6E6E6),
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    width: 200,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      // color: Colors.white,
                                      elevation: 10,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Spacer(),
                                          const ListTile(
                                            leading: Icon(FontAwesomeIcons.dumbbell, size: 30,color: Colors.black,),
                                            title: Text('Weight Training'),
                                            //subtitle: Text('Secondary Text'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                // yoga ka card
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => DetailsScreen()
                                    )
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // image: new DecorationImage(
                                      //   image: new AssetImage('assets/apple.png'),
                                      //   fit: BoxFit.fill,
                                      // ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(13),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 17),
                                          blurRadius: 17,
                                          spreadRadius: -23,
                                          color: Color(0xFFE6E6E6),
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    width: 200,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      // color: Colors.white,
                                      elevation: 10,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Spacer(),
                                          const ListTile(
                                            leading: Icon(
                                              FontAwesomeIcons.restroom,
                                              size: 30,
                                              color: Colors.black,
                                            ),
                                            title: Text('Yoga '),
                                            //subtitle: Text('Secondary Text'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                //diet ka card
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => Diet()
                                    )
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // image: new DecorationImage(
                                      //   image: new AssetImage('assets/apple.png'),
                                      //   fit: BoxFit.fill,
                                      // ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(13),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 17),
                                          blurRadius: 17,
                                          spreadRadius: -23,
                                          color: Color(0xFFE6E6E6),
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    width: 200,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      // color: Colors.white,
                                      elevation: 10,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Spacer(),
                                          const ListTile(
                                            leading: Icon(FontAwesomeIcons.breadSlice, size: 30,color: Colors.black,),
                                            title: Text('Diet '),
                                            //subtitle: Text('Secondary Text'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                //crossfit ka card
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => CrossFit()
                                    )
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // image: new DecorationImage(
                                      //   image: new AssetImage('assets/apple.png'),
                                      //   fit: BoxFit.fill,
                                      // ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(13),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 17),
                                          blurRadius: 17,
                                          spreadRadius: -23,
                                          color: Color(0xFFE6E6E6),
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    width: 200,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      // color: Colors.white,
                                      elevation: 10,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Spacer(),
                                          const ListTile(
                                            leading: Icon(FontAwesomeIcons.hammer, size: 30,color: Colors.black,),
                                            title: Text('Crossfit Training'),
                                            //subtitle: Text('Secondary Text'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Expanded(
                          //   child: GridView.count(
                          //     crossAxisCount: 2,
                          //     childAspectRatio: .85,
                          //     crossAxisSpacing: 20,
                          //     mainAxisSpacing: 20,
                          //     children: <Widget>[
                          //       CategoryCard(
                          //         title: "Diet Recommendation",
                          //         svgSrc: "assets/icons/Hamburger.svg",
                          //         press: () {
                          //           Navigator.push(
                          //             context, MaterialPageRoute(builder : (context) => Diet()),
                          //           );
                          //         },
                          //       ),
                          //       CategoryCard(
                          //         title: "Crossfit Exercises",
                          //         svgSrc: "assets/icons/Excrecises.svg",
                          //         press: () {
                          //           Navigator.push(
                          //             context, MaterialPageRoute(builder : (context) => DetailsScreen()),
                          //           );
                          //         },
                          //       ),
                          //       // CategoryCard(
                          //       //   title: "Meditation",
                          //       //   svgSrc: "assets/icons/Meditation.svg",
                          //       //   press: () {
                          //       //     // Navigator.push(
                          //       //     //   context,
                          //       //     //   MaterialPageRoute(builder: (context) {
                          //       //     //     return DetailsScreen();
                          //       //     //   }),
                          //       //     //);
                          //       //   },
                          //       // ),
                          //       //weight training ka card
                          //
                          //       InkWell(
                          //         onTap: () {
                          //           Navigator.push(
                          //             context, MaterialPageRoute(builder : (context) => CrossFit()),
                          //           );
                          //         },
                          //         child: Container(
                          //
                          //           decoration: BoxDecoration(
                          //             // image: new DecorationImage(
                          //             //   image: new AssetImage('assets/apple.png'),
                          //             //   fit: BoxFit.fill,
                          //             // ),
                          //             color: Colors.white,
                          //             borderRadius: BorderRadius.circular(13),
                          //             boxShadow: [
                          //               BoxShadow(
                          //                 offset: Offset(0, 17),
                          //                 blurRadius: 17,
                          //                 spreadRadius: -23,
                          //                 color: kShadowColor,
                          //               ),
                          //             ],
                          //           ),
                          //           height: 100,
                          //           child: Card(
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
                          //                   leading: Icon(Icons.subject, size: 50),
                          //                   title: Text('Weight Training'),
                          //                   //subtitle: Text('Secondary Text'),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //
                          //       // yoga ka card
                          //       InkWell(
                          //         onTap: () {
                          //           Navigator.push(
                          //             context, MaterialPageRoute(builder : (context) => CrossFit()),
                          //           );
                          //         },
                          //         child: Container(
                          //
                          //           decoration: BoxDecoration(
                          //             // image: new DecorationImage(
                          //             //   image: new AssetImage('assets/apple.png'),
                          //             //   fit: BoxFit.fill,
                          //             // ),
                          //             color: Colors.white,
                          //             borderRadius: BorderRadius.circular(13),
                          //             boxShadow: [
                          //               BoxShadow(
                          //                 offset: Offset(0, 17),
                          //                 blurRadius: 17,
                          //                 spreadRadius: -23,
                          //                 color: kShadowColor,
                          //               ),
                          //             ],
                          //           ),
                          //           height: 100,
                          //           child: Card(
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
                          //                   leading: Icon(Icons.accessibility_new, size: 50),
                          //                   title: Text('Yoga '),
                          //                   //subtitle: Text('Secondary Text'),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       // CategoryCard(
                          //       //   title: "Yoga",
                          //       //   svgSrc: "assets/icons/yoga.svg",
                          //       //   press: () {},
                          //       // ),
                          //
                          //       // InkWell(
                          //       //   onTap: () {
                          //       //     Navigator.push(
                          //       //       context, MaterialPageRoute(builder : (context) => CrossFit()),
                          //       //     );
                          //       //   },
                          //       //   child: Container(
                          //       //
                          //       //     decoration: BoxDecoration(
                          //       //       // image: new DecorationImage(
                          //       //       //   image: new AssetImage('assets/apple.png'),
                          //       //       //   fit: BoxFit.fill,
                          //       //       // ),
                          //       //       color: Colors.white,
                          //       //       borderRadius: BorderRadius.circular(13),
                          //       //       boxShadow: [
                          //       //         BoxShadow(
                          //       //           offset: Offset(0, 17),
                          //       //           blurRadius: 17,
                          //       //           spreadRadius: -23,
                          //       //           color: kShadowColor,
                          //       //         ),
                          //       //       ],
                          //       //     ),
                          //       //     height: 100,
                          //       //     child: Card(
                          //       //       shape: RoundedRectangleBorder(
                          //       //         borderRadius: BorderRadius.circular(12.0),
                          //       //       ),
                          //       //      // color: Colors.white,
                          //       //       elevation: 10,
                          //       //       child: Column(
                          //       //         mainAxisSize: MainAxisSize.min,
                          //       //         children: <Widget>[
                          //       //           Spacer(),
                          //       //           const ListTile(
                          //       //             leading: Icon(Icons.subject, size: 50),
                          //       //             title: Text('Weight Training'),
                          //       //             //subtitle: Text('Secondary Text'),
                          //       //           ),
                          //       //         ],
                          //       //       ),
                          //       //     ),
                          //       //   ),
                          //       // ),,
                          //
                          //
                          // ],
                          //   ),
                          // ),

                          SizedBox(height: 15.0,),

                          Text(
                            "Life Changing Transformations : ",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.w900),
                          ),

                          SizedBox(height:20.0,),

                          CarouselSlider(
                            options: CarouselOptions(
                              height: 400.0,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 6),
                              autoPlayAnimationDuration: Duration(milliseconds: 1000),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              pauseAutoPlayOnTouch: true,
                              aspectRatio: 2.0,
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
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      child: Card(
                                        color: Colors.blueAccent,
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
                                  color: _currentIndex == index ? Colors.deepPurple[800] : Colors
                                      .black,
                                ),
                              );
                            }),

                          ),

                          SizedBox(height:20.0,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,0,0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Daily Fitness Updates " ,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => FitnessBlogs()
                                )
                              );
                            },
                            child: Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              //color: Colors.black,
                              padding: const EdgeInsets.fromLTRB(10,0,0,0),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[50],
                                border: Border.all(color: Colors.deepPurple[400]),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text('Click here to view daily fitness updates.',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Center(child: Image.asset('assets/meditation_bg.png')),

                          // Text(
                          //   "Articles  ",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .headline5
                          //       .copyWith(fontWeight: FontWeight.w900),
                          // ),

                          //SizedBox(height: 15.0,),
                          // ListView(
                          //   scrollDirection: Axis.horizontal,
                          //   children: <Widget>[
                          //     Container(
                          //       width: 500,
                          //       height: 200,
                          //       color: Colors.purple[600],
                          //       child: const Center(
                          //           child: Text(
                          //         'Item 1',
                          //         style: TextStyle(fontSize: 18, color: Colors.white),
                          //       )),
                          //     ),
                          //     Container(
                          //       width: 500,
                          //       height: 200,
                          //       color: Colors.purple[500],
                          //       child: const Center(
                          //           child: Text(
                          //         'Item 2',
                          //         style: TextStyle(fontSize: 18, color: Colors.white),
                          //       )),
                          //     ),
                          //     Container(
                          //       width: 500,
                          //       height: 200,
                          //       color: Colors.purple[400],
                          //       child: const Center(
                          //           child: Text(
                          //         'Item 3',
                          //         style: TextStyle(fontSize: 18, color: Colors.white),
                          //       )),
                          //     ),
                          //     Container(
                          //       width: 500,
                          //       height: 200,
                          //       color: Colors.purple[300],
                          //       child: const Center(
                          //           child: Text(
                          //         'Item 4',
                          //         style: TextStyle(fontSize: 18, color: Colors.white),
                          //       )),
                          //     ),
                          //   ],
                          // ),

                          // Row(
                          //   children: <Widget>[
                          //     ListView(
                          //     scrollDirection: Axis.horizontal,
                          //     children: <Widget>[
                          //       Container(
                          //         width: 200,
                          //         color: Colors.purple[600],
                          //         child: const Center(child: Text('Item 1', style: TextStyle(fontSize: 18, color: Colors.white),)),
                          //       ),
                          //       Container(
                          //         width: 200,
                          //         color: Colors.purple[500],
                          //         child: const Center(child: Text('Item 2', style: TextStyle(fontSize: 18, color: Colors.white),)),
                          //       ),
                          //       Container(
                          //         width: 200,
                          //         color: Colors.purple[400],
                          //         child: const Center(child: Text('Item 3', style: TextStyle(fontSize: 18, color: Colors.white),)),
                          //       ),
                          //       Container(
                          //         width: 200,
                          //         color: Colors.purple[300],
                          //         child: const Center(child: Text('Item 4', style: TextStyle(fontSize: 18, color: Colors.white),)),
                          //       ),
                          //     ],
                          //    ),
                          //   ],
                          //  ),
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
          color: Colors.white,
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
              color: Colors.grey[700]),
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
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       stops: [0.3, 1],
      //       colors: [Color(0xffff4000),Color(0xffffcc66),]
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/tr4.png',
            height: 392.0,
            fit: BoxFit.fill,
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff5f2c82), Color(0xff49a09d)]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/tr3.png',
            height: 392.0,
            fit: BoxFit.fill,
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
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       stops: [0.3, 1],
      //       colors: [Color(0xffff4000),Color(0xffffcc66),]
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/tr1.png',
            height: 392.0,
            fit: BoxFit.fill,
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
          fit: BoxFit.fill,
          height: 392.0,
          )

        ],
      ),
    );
  }
}

