import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Screens/Chat/chat.dart';
import 'package:GymApp/Screens/Trainings/crossfit.dart';
import 'package:GymApp/Screens/userhome2.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Trainers/RulesAndRegulations.dart';
import 'Trainings/list_of_trainings.dart';
import 'Transformations/transformation1.dart';
import 'home.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  int selectedOptionIndex = 0;
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return UserHome2();
    // case 1 : return Groups();
      case 1:
        return Chat();
      case 2:
        return Trainings();
      case 3:
        return CrossFit();
        break;
      case 4:
        return TrainersRulesAndRegulations();
      default:
        return Chat();
    }
  }
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: new AppBar(
      //   title: Text(
      //       'Home'
      //   ),backgroundColor: Colors.deepPurple[500],
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.exit_to_app),
      //       color: Colors.black,
      //       tooltip: 'Logout',
      //       onPressed: () async {
      //         await _auth.signOut();
      //       },
      //     ),
      //   ],
      // ),
    //   floatingActionButton: FloatingActionButton(
    //   tooltip: 'Chat With Us, So that we can assist you. ',
    //   backgroundColor: Colors.deepPurple[800],
    //   elevation: 10.0,
    //   onPressed: (){
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
    //   },
    //   child: const Icon(FontAwesomeIcons.rocketchat),
    // ),
      drawer: UserNavigationDrawer(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: callPage(selectedOptionIndex),
    );
  }

  Widget _buildBottomNavigationBar() {
    List<String> bottomNavigationBarOptions = [
      'Home',
      'Chat',
      'Courses',
      'Crossfit',
      'Trainer\'s\nForm',
    ];

    List<IconData> bottomNavigationBarIcons = [
      Icons.home,
      Icons.message,
      FontAwesomeIcons.dumbbell,
      FontAwesomeIcons.chevronCircleRight,
      Icons.person,
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
                        SizedBox(width: 8,),
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







