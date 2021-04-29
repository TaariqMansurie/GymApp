
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:math';


//
// class HomeNavigationDrawer extends StatelessWidget {
//
//   final Function onTap ;
//
//   HomeNavigationDrawer({
//     this.onTap
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox (
//       width: MediaQuery.of(context).size.width*0.8,
//       child: Drawer(
//         child : Column (
//           crossAxisAlignment: CrossAxisAlignment.stretch ,
//           children : <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration (
//                   color: Colors.blue[200]
//               ),
//               child : Padding (
//                 padding : EdgeInsets.all(6),
//                 child : Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     Container (
//                       width : 60,
//                       height : 60,
//                       child :CircleAvatar(
//                         child: Text(''),
//                         backgroundColor: Colors.blue[800],
//                       ),
//                     ),
//
//                     SizedBox(height :15),
//                     Text (
//                       'Username',
//                       style : TextStyle(
//                           fontSize : 16 ,
//                           fontWeight: FontWeight.w600 ,
//                           color : Colors.white
//                       ), //TextStyle
//                     ), //Text
//                     SizedBox (height : 3),
//                     Text(
//                       'Email id',
//                       style : TextStyle (
//                           color : Colors.white ,
//                           fontSize : 12
//                       ),//TextStyle
//                     ), //Text
//                   ],
//                 ),
//               ),
//             ),
//             ListTile (
//               leading : Icon(Icons.calendar_today),
//               title: Text('Calendar'),
//               onTap : (){
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => CalendarsHome()),
//                 // );
//               },
//             ),
//             ListTile (
//               leading : Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap : () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => Settings()),
//                 // );
//               },
//             ),
//             ListTile (
//               leading : Icon(Icons.stars),
//               title: Text('Rate Us'),
//               onTap : () => onTap(context,2),
//             ),
//             ListTile (
//                 leading : Icon(Icons.lock_open),
//                 title: Text('Login'),
//                 onTap : () {
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => MainLogin()),
//                   // );
//                 }
//             ),
//             ListTile (
//               leading : Icon(Icons.person),
//               title: Text('Sign Up'),
//               onTap : (){
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => Register()),
//                 // );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class HiddenDrawerController {
//   HiddenDrawerController({this.items, @required DrawerContent initialPage}) {
//     this.page = initialPage;
//   }
//   List<DrawerItem> items;
//   Function open;
//   Function close;
//   DrawerContent page;
// }
//
// class DrawerContent extends StatefulWidget {
//   Function onMenuPressed;
//   State<StatefulWidget> createState() {
//     return null;
//   }
// }
//
// class DrawerItem extends StatelessWidget {
//   DrawerItem({this.onPressed, this.icon, this.text, this.page});
//   Function onPressed;
//   final Widget icon;
//   final Widget text;
//
//   final DrawerContent page;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 2),
//       child: Material(
//         color: Colors.transparent,
//         child: GestureDetector(
//           onTap: onPressed,
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 8.0),
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.only(left: 16, right: 8),
//                   child: icon,
//                 ),
//                 text
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class HiddenDrawer extends StatefulWidget {
//   HiddenDrawer({this.header, this.decoration, this.controller});
//   BoxDecoration decoration;
//   Widget header;
//   HiddenDrawerController controller;
//   @override
//   _HiddenDrawerState createState() => _HiddenDrawerState();
// }
//
// class _HiddenDrawerState extends State<HiddenDrawer>
//     with TickerProviderStateMixin {
//   bool isMenuOpen = false;
//   bool isMenudragging = false;
//   Animation<double> animation, scaleAnimation;
//   Animation<BorderRadius> radiusAnimation;
//   AnimationController animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(vsync: this, duration: Duration(microseconds: 300));
//     animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController)
//       ..addListener(() {
//         setState(() {});
//       });
//     scaleAnimation =
//         Tween<double>(begin: 1.0, end: 0.86).animate(animationController);
//     radiusAnimation = BorderRadiusTween(
//         begin: BorderRadius.circular(0.0), end: BorderRadius.circular(32))
//         .animate(
//         CurvedAnimation(parent: animationController, curve: Curves.ease));
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     animationController.dispose();
//   }
//
//   drawerItems() {
//     return widget.controller.items.map((DrawerItem item) {
//       if (item.onPressed == null) {
//         item.onPressed = () {
//           widget.controller.page = item.page;
//           widget.controller.close();
//         };
//       }
//       item.page.onMenuPressed = menuPress;
//       return item;
//     }).toList();
//   }
//
//   menuPress() {
//     isMenuOpen ? closeDrawer() : openDrawer();
//   }
//
//   closeDrawer() {
//     animationController.reverse();
//     setState(() {
//       isMenuOpen = false;
//     });
//   }
//
//   openDrawer() {
//     animationController.forward();
//     setState(() {
//       isMenuOpen = true;
//     });
//   }
//
//   animations() {
//     if (isMenudragging) {
//       var opened = false;
//       setState(() {
//         isMenudragging = false;
//       });
//       if (animationController.value >= 0.4) {
//         animationController.forward();
//         opened = true;
//       } else {
//         animationController.reverse();
//       }
//       setState(() {
//         isMenuOpen = opened;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     widget.controller.page.onMenuPressed = menuPress;
//     widget.controller.close = closeDrawer;
//     widget.controller.open = openDrawer;
//     return Listener(
//       onPointerDown: (PointerDownEvent event) {
//         if (isMenuOpen &&
//             event.position.dx / MediaQuery.of(context).size.width >= 0.66) {
//           closeDrawer();
//         } else {
//           setState(() {
//             isMenudragging = (!isMenudragging && event.position.dx <= 8.0);
//           });
//         }
//       },
//       onPointerMove: (PointerMoveEvent event) {
//         if (isMenudragging) {
//           animationController.value =
//               event.position.dx / MediaQuery.of(context).size.width;
//         }
//       },
//       onPointerUp: (PointerUpEvent event) {
//         animations();
//       },
//       onPointerCancel: (PointerCancelEvent event) {
//         animations();
//       },
//       child: Stack(
//         children: <Widget>[
//           Container(
//             decoration: widget.decoration,
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 64.0),
//               child: ListView(
//                 children: <Widget>[
//                   Container(
//                     child: widget.header,
//                   ),
//                   SizedBox(
//                     height: 60,
//                   ),
//                   Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: drawerItems())
//                 ],
//               ),
//             ),
//           ),
//           Transform.scale(
//             scale: scaleAnimation.value,
//             child: Transform.translate(
//                 offset: Offset(
//                     MediaQuery.of(context).size.width * 0.66 * animation.value,
//                     0.0),
//                 child: AbsorbPointer(
//                   absorbing: isMenuOpen,
//                   child: Stack(
//                     children: <Widget>[
//                       Column(
//                         children: <Widget>[
//                           Expanded(
//                             child: Container(
//                               padding: EdgeInsets.symmetric(vertical: 32),
//                               child: ClipRRect(
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(44)),
//                                 child: Container(
//                                   color: Colors.white.withAlpha(128),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: animation.value * 16),
//                         child: ClipRRect(
//                           borderRadius: radiusAnimation.value,
//                           child: Container(
//                             color: Colors.white,
//                             child: widget.controller.page,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )),
//           )
//         ],
//       ),
//     );
//   }
class HiddenDrawer extends StatefulWidget {
  @override
  _HiddenDrawerState createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background of the drawer
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[400],
                  Colors.blue[800]
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            ),
          ),
          SafeArea(
            child: Container(
              width: 200,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar (
                          radius: 50.0,
                          backgroundImage: AssetImage('apple.png'),
                        ),
                        SizedBox(height: 10.0,),
                        Text('Newton',style: TextStyle(color: Colors.white,fontSize: 20.0),),

                      ],
                    ),
                  ),
                  Expanded(
                      child:ListView(
                          children:[
                            ListTile(
                              onTap: (){},
                              leading: Icon(FontAwesomeIcons.home,color: Colors.white,),
                              title: Text(
                                'Home',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: (){},
                              leading: Icon(FontAwesomeIcons.home,color: Colors.white,),
                              title: Text(
                                'Home',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: (){},
                              leading: Icon(FontAwesomeIcons.home,color: Colors.white,),
                              title: Text(
                                'Home',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: (){},
                              leading: Icon(FontAwesomeIcons.home,color: Colors.white,),
                              title: Text(
                                'Home',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ]
                      )
                  )
                ],
              ),
            ),
          ),

          //Now lets Make our Main Screen \
          //We have to wrap our main screen in a tween animation builder
          //which will allow us to animate through it so go to home.dart
        ],
      ),
    );
  }
}
