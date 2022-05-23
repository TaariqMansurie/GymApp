import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Screens/Chat/chatRoom.dart';
import 'package:GymApp/Screens/Trainings/list_of_trainings2.dart';
import 'package:GymApp/Screens/userhome2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Trainers/RulesAndRegulations.dart';


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
      case 1:
        return ChatRoom();
      case 2:
        return TrainersRulesAndRegulations();
      default:
        return ChatRoom();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserNavigationDrawer(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: callPage(selectedOptionIndex),
    );
  }

  Widget _buildBottomNavigationBar() {

    List<String> bottomNavigationBarOptions = [
      'Home',
      'Ask An\n Expert',
      //'Our\nServices',
      // 'Trainers',
      'Trainer\'s\nForm',
    ];

    List<IconData> bottomNavigationBarIcons = [
      Icons.home,
      Icons.message,
     // FontAwesomeIcons.dumbbell,
      FontAwesomeIcons.pencilRuler,
    ];
    return Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.black,
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
                            color: Color(0xffffc400),
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
      // else {
      // return Container();
      //   }
      }







