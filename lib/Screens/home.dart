import 'dart:math';


import 'package:GymApp/Drawers/homeNavigationDrawer.dart';
import 'package:GymApp/Screens/Transformations/transformation1.dart';
import 'package:GymApp/Screens/Transformations/transformation2.dart';
import 'package:GymApp/Screens/Transformations/transformation3.dart';
import 'package:GymApp/Screens/crossfit.dart';
import 'package:GymApp/Screens/details_screen.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


import 'Diet/diet.dart';
import 'Transformations/transformation4.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

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

  int selectedOptionIndex = 0;
  double value = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size;
    return Scaffold(
      appBar: new AppBar(

        title: Text(
          'Welcome to Fit Mumbai'
        ),
        backgroundColor: Colors.deepPurple[500] ,
        leading: IconButton(
         icon: Icon(FontAwesomeIcons.gripLines),
          onPressed: () {},
          color: Colors.black,
          tooltip: 'Menu',
      ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        overlayColor: Colors.black,
        backgroundColor: Colors.deepPurple[500],
        animatedIconTheme: IconThemeData.fallback(),
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
          child: Icon(Icons.image),
          backgroundColor: Colors.blue,
          label: 'Add Images',
          onTap: () {
            // showModalBottomSheet(
            //   context: context,
            //   builder: ((builder) => bottomSheet2(uid)),
            // );
          },
        ),
          SpeedDialChild(
          child: Icon(Icons.videocam),
          backgroundColor: Colors.blue,
          label: 'Add Videos',
          onTap: () {
            // showModalBottomSheet(
            //   context: context,
            //   builder: ((builder) => bottomSheet3(uid)),
            // );
          },
        ),
          SpeedDialChild(
          child: Icon(Icons.picture_as_pdf),
          backgroundColor: Colors.blue,
          label: 'Add Pdf files',
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => UploadingPdf()));
          },
        ),
          SpeedDialChild(
          child: Icon(Icons.event_note),
          backgroundColor: Colors.blue,
          label: 'Add Notes',
          onTap: () {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => Notes()));
          //
           },
        ),
      ],
    ),
     // bottomNavigationBar: _buildBottomNavigationBar(),
      drawer: HiddenDrawer(),
      body: SingleChildScrollView(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: value),
          duration: Duration(milliseconds: 500),
          builder: (_, double val,__) {
            return (Transform(
              transform :Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val) //this line will allow us to translate the screen
                  ..rotateY((pi/6) * val),

          child: Stack(
              children: <Widget>[
                Container(
                  // Here the height of the container is 45% of our total height
                  height: size.height * .45,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5CEB8),
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
                                color: Color(0xFFF2BEA1),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  alignment: Alignment.centerLeft,
                                  image : AssetImage("assets/undraw_pilates_gpdb.png")
                                )
                              ),
                              child: SvgPicture.asset("assets/menu.svg"),
                            ),
                          ),
                          Text(
                            "Welcome aboard ! ",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.w900),textAlign: TextAlign.start,
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
                            "Life Changing Transformations  ",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.w900),
                          ),

                          SizedBox(height:10.0,),

                          CarouselSlider(
                            options: CarouselOptions(
                              height: 400.0,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 10),
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
                          Text(
                            "Articles  ",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
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
                      ),  //okay now lets make the gesture detector widget that will allow us to open the drawer
                // GestureDetector(onHorizontalDragUpdate: (e){
                //   if (e.delta.dx>0) {
                //     setState(() {
                //       value = 1 ;
                //     });
                //   } else {
                //     setState(() {
                //       value = 0;
                //     });
                //   }
                // },)
                    ],

                  ),
            ));
          },

        ),


              ),
            );
          }


  Widget _buildBottomNavigationBar() {
    List<String> bottomNavigationBarOptions = [
      'Home',
      'Favorites',
      'Notifications',
      'About Us'
    ];

    List<IconData> bottomNavigationBarIcons = [
      Icons.home,
      Icons.favorite_border,
      Icons.notifications_none,
      Icons.info_outline
    ];

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        children: List.generate(bottomNavigationBarOptions.length, (index) {
          if (index == selectedOptionIndex) {
            return Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {

                  setState(() {
                    selectedOptionIndex = index;
                  });
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          bottomNavigationBarIcons[index],
                          color: Colors.black,
                        ),
                        Text(
                          bottomNavigationBarOptions[index],
                          style: GoogleFonts.varelaRound(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedOptionIndex = index;
                });
              },
              child: Icon(
                bottomNavigationBarIcons[index],
                color: Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}
class Transformation1 extends StatelessWidget {
  const Transformation1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SuperTransformation1()
         )
        );
      } ,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 1],
              colors: [Color(0xffff4000),Color(0xffffcc66),]
          ),
        ),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Transformation 1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                )
            ),
            Text(
                "Tap To Know More...",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600
                )
            ),
          ],
        ),
      ),
    );
  }
}

class Transformation2 extends StatelessWidget {
  const Transformation2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SuperTransformation2()
        )
        );
      },
      child: Container(
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
            Text(
                "Data",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                )
            ),
            Text(
                "Data",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600
                )
            ),
          ],
        ),
      ),
    );
  }
}

class Transformation3 extends StatelessWidget {
  const Transformation3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SuperTransformation3()
        )
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 1],
              colors: [Color(0xffff4000),Color(0xffffcc66),]
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/apple.png',
              height: 180.0,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

class Transformation4 extends StatelessWidget {
  const Transformation4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SuperTransformation4()
        )
        );
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Data",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                )
            ),
            Text(
                "Data",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600
                )
            ),
          ],
        ),
      ),
    );
  }
}
