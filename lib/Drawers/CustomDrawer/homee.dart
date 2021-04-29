// import 'package:GymApp/Authentication/login.dart';
// import 'package:GymApp/Authentication/register.dart';
// import 'package:GymApp/Drawers/CustomDrawer/page2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../homeNavigationDrawer.dart';
//
//
// class MainPage extends DrawerContent {
//   MainPage({Key key, this.title});
//   final String title;
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Center(
//         child: Column(
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 ClipRRect(
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                   child: Material(
//                     shadowColor: Colors.transparent,
//                     color: Colors.transparent,
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.menu,
//                         color: Colors.black,
//                       ),
//                       onPressed: widget.onMenuPressed,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(widget.title),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MainWidget extends StatefulWidget {
//   MainWidget({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MainWidgetState createState() => _MainWidgetState();
// }
//
// class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
//   HiddenDrawerController _drawerController;
//
//   @override
//   void initState() {
//     super.initState();
//     _drawerController = HiddenDrawerController(
//       initialPage: MainPage(
//         title: 'main',
//       ),
//       items: [
//         DrawerItem(
//           text: Text('Home', style: TextStyle(color: Colors.white)),
//           icon: Icon(Icons.home, color: Colors.white),
//           page: MainPage(
//             title: 'Home',
//           ),
//         ),
//         DrawerItem(
//           text: Text(
//             'Gallery',
//             style: TextStyle(color: Colors.white),
//           ),
//           icon: Icon(Icons.photo_album, color: Colors.white),
//           page: MainPage(
//             title: 'Gallery',
//           ),
//         ),
//         DrawerItem(
//           onPressed: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (_) => Page2()));
//           },
//           text: Text(
//             'Favorites',
//             style: TextStyle(color: Colors.white),
//           ),
//           icon: Icon(Icons.favorite, color: Colors.white),
//           page: MainPage(
//             title: 'Favorites',
//           ),
//         ),
//         DrawerItem(
//           text: Text(
//             'Notification',
//             style: TextStyle(color: Colors.white),
//           ),
//           icon: Icon(Icons.notifications, color: Colors.white),
//           page: MainPage(
//             title: 'Notification',
//           ),
//         ),
//         DrawerItem(
//           onPressed: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (_) =>UserSignIn()));
//           },
//           text: Text(
//             'Login',
//             style: TextStyle(color: Colors.white),
//           ),
//           icon: Icon(Icons.person_outline, color: Colors.white),
//           page: MainPage(
//             title: 'Login',
//           ),
//         ),
//         DrawerItem(
//           onPressed: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (_) =>Register()));
//           },
//           text: Text(
//             'Sign Up',
//             style: TextStyle(color: Colors.white),
//           ),
//           icon: Icon(Icons.person_add, color: Colors.white),
//           page: MainPage(
//             title: 'Sign Up',
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: HiddenDrawer(
//         controller: _drawerController,
//         header: Align(
//           alignment: Alignment.topLeft,
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: CircleAvatar(
//                   radius: 100,
//                   backgroundImage:
//                   NetworkImage(
//                       'https://scontent.fktm7-1.fna.fbcdn.net/v/t1.0-9/82329578_945913889138731_3990029217893974016_o.jpg?_nc_cat=110&_nc_sid=09cbfe&_nc_ohc=-v-Gru-65UgAX8QfObI&_nc_ht=scontent.fktm7-1.fna&oh=97e3c3d49ca37a4fbe39ec7198967706&oe=5F8EEDB0'
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 6,
//               ),
//               Text(
//                 'Username',
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               )
//             ],
//           ),
//         ),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [Colors.deepPurple[500], Colors.purple[500], Colors.purple],
//             // tileMode: TileMode.repeated,
//           ),
//         ),
//       ),
//     );
//   }
// }