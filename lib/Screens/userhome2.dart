import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Screens/Packages/gold.dart';
import 'package:GymApp/Screens/Packages/platinum.dart';
import 'package:GymApp/Screens/Packages/silver.dart';
import 'package:GymApp/Screens/home.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Chat/chat.dart';
import 'Trainings/list_of_trainings.dart';
import 'Transformations/transformation1.dart';

class UserHome2 extends StatefulWidget {
  const UserHome2({Key key}) : super(key: key);

  @override
  _UserHome2State createState() => _UserHome2State();
}

class _UserHome2State extends State<UserHome2> {
  final AuthService _auth = AuthService();
  DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;
    return Scaffold(
      appBar: new AppBar(
        title: Text(
            'Home'
        ),backgroundColor: Colors.deepPurple[500],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            color: Colors.black,
            tooltip: 'Logout',
            onPressed: () {
              _auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Chat With Us, So that we can assist you. ',
        backgroundColor: Colors.deepPurple[800],
        elevation: 10.0,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
        },
        child: const Icon(FontAwesomeIcons.rocketchat),
      ),
      drawer: UserNavigationDrawer(),
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('users')
            .document(uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot)  {
          if (snapshot.hasData) {
            print(snapshot.hasData);
            print(snapshot.data['userName']);
            String userName = snapshot.data['userName'];
            String email = snapshot.data['userEmail'];
            String profile_pic_url = snapshot.data['profile_photo_url'];
            print({profile_pic_url});
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text(
                      "Welcome Back ${userName.toUpperCase()} !" ,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w900),textAlign: TextAlign.center,
                    ),

                    //  SizedBox(width: 60.0,),

                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Trainings we Offer",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    ExploreAllButton3(
                      onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => Trainings()),
                        );
                      },
                    ),

                  ],
                ),
                SizedBox(height: 20.0,),
                Container(
                  height: 290,
                  width: MediaQuery.of(context).size.width,
                  //child: SingleChildScrollView(
                  // scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        buildImageCard1(),
                        buildImageCard2(),
                        buildImageCard3(),
                        buildImageCard4(),
                        // Card(color: Colors.amber,),
                        //  Card(color: Colors.green,)
                      ],
                    ),
                  ),
                  //),
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,0,0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Our Packages",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: MediaQuery.of(context).size.width,
                 // color: Colors.black,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20), topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20) )),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        SilverPackage(),
                        GoldPackage(),
                       // buildPlatinumPackageCard(),
                        ],
                      ),
                      SizedBox(height:10.0),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          PlatinumPackage(),
                          //GoldPackage(),
                         ],
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 20.0,),
                Center(child: Image.asset('assets/meditation_bg.png')),
              ],
            ),
          );
          } else {
            return Container();
            }
          },
        ),
      );
    }

  // Widget _buildBottomNavigationBar() {
  //   List<String> bottomNavigationBarOptions = [
  //     'Home',
  //     'Favorites',
  //     'Notifications',
  //     'About Us'
  //   ];
  //
  //   List<IconData> bottomNavigationBarIcons = [
  //     Icons.home,
  //     Icons.favorite_border,
  //     Icons.notifications_none,
  //     Icons.info_outline
  //   ];
  //
  //   return Container(
  //     height: 80,
  //     padding: EdgeInsets.symmetric(horizontal: 10),
  //     decoration: BoxDecoration(
  //         color: Colors.deepPurple,
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20), topRight: Radius.circular(20))),
  //     child: Row(
  //       children: List.generate(bottomNavigationBarOptions.length, (index) {
  //         if (index == selectedOptionIndex) {
  //           return Expanded(
  //             flex: 2,
  //             child: GestureDetector(
  //               onTap: () {
  //
  //                 setState(() {
  //                   selectedOptionIndex = index;
  //                 });
  //               },
  //               child: Center(
  //                 child: Container(
  //                   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
  //                   decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.only(
  //                           topLeft: Radius.circular(20),
  //                           bottomRight: Radius.circular(20),
  //                           topRight: Radius.circular(20))),
  //                   child: Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: <Widget>[
  //                       Icon(
  //                         bottomNavigationBarIcons[index],
  //                         color: Colors.black,
  //                       ),
  //                       Text(
  //                         bottomNavigationBarOptions[index],
  //                         style: GoogleFonts.varelaRound(
  //                             fontSize: 15, fontWeight: FontWeight.w500),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           );
  //         }
  //
  //         return Expanded(
  //           child: GestureDetector(
  //             onTap: () {
  //               setState(() {
  //                 selectedOptionIndex = index;
  //               });
  //             },
  //             child: Icon(
  //               bottomNavigationBarIcons[index],
  //               color: Colors.white,
  //             ),
  //           ),
  //         );
  //       }),
  //     ),
  //   );
  // }

  Widget buildImageCard1() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.center,
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
                  builder: (context) => Trainings()),
              );
            },
          ),
          height: 120,
          fit: BoxFit.cover,
        ),
        Text(
          'Online Training',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
  Widget buildImageCard2() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: AssetImage(
            'assets/deadlift.png',
          ),
          // colorFilter: ColorFilters.greyscale,
          child: InkWell(
            onTap: () {},
          ),
          height: 120,
          fit: BoxFit.cover,
        ),
        Text(
          'Weight Training ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
  Widget buildImageCard3() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: AssetImage(
            'assets/crossfit.png',
          ),
          //  colorFilter: ColorFilters.greyscale,
          child: InkWell(
            onTap: () {},
          ),
          height: 120,
          fit: BoxFit.cover,
        ),
        Text(
          'Crossfit Training',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
  Widget buildImageCard4() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: AssetImage(
            'assets/yoga.png',
          ),
          //  colorFilter: ColorFilters.greyscale,
          child: InkWell(
            onTap: () {},
          ),
          height: 120,
          fit: BoxFit.cover,
        ),
        Text(
          'Yoga ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
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
          height: 120,
          fit: BoxFit.cover,
        ),
        Text(
          'KickBoxing/MMA ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );

  // Widget buildSilverPackageCard() => Card(
  //   clipBehavior: Clip.antiAlias,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(24),
  //   ),
  //   child: Stack(
  //     alignment: Alignment.center,
  //     children: [
  //       Ink.image(
  //         image: AssetImage(
  //           'assets/online.png',
  //         ),
  //         // colorFilter: ColorFilters.greyscale,
  //         child: InkWell(
  //           onTap: () {
  //             Navigator.push(
  //               context, MaterialPageRoute(
  //                 builder: (context) => SilverPackage()),
  //             );
  //           },
  //         ),
  //         height: 60,
  //         fit: BoxFit.cover,
  //       ),
  //       Text(
  //         'Silver',
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           color: Colors.white,
  //           fontSize: 24,
  //         ),
  //       ),
  //     ],
  //   ),
  // );
  // Widget buildGoldPackageCard() => Card();
  // Widget buildPlatinumPackageCard() => Card();

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
          color: Colors.deepPurple[200],
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

class SilverPackage extends StatelessWidget {
  final Function onTap;
  const SilverPackage({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SilverPackagee()
          )
          );
        },
        child: Container(
          decoration: BoxDecoration(
            // image: new DecorationImage(
            //   image: new AssetImage('assets/apple.png'),
            //   fit: BoxFit.fill,
            // ),
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
          height: 70,
          width: 190,
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
                  leading: Icon(FontAwesomeIcons.star, size: 30,color: Colors.black,),
                  title: Text('Silver'),
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
          height: 70,
          width: 190,
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
                  leading: Icon(FontAwesomeIcons.starHalfAlt, size: 30,color: Colors.black,),
                  title: Text('Gold'),
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
    return InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PlatinumPackagee()
          )
          );
        },
        child: Container(
          decoration: BoxDecoration(
            // image: new DecorationImage(
            //   image: new AssetImage('assets/apple.png'),
            //   fit: BoxFit.fill,
            // ),
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
          height: 70,
          width: 190,
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
                  leading: Icon(FontAwesomeIcons.solidStar, size: 30,color: Colors.black,),
                  title: Text('Platinum'),
                  //subtitle: Text('Secondary Text'),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
