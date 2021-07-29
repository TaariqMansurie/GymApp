import 'package:GymApp/Drawers/homeNavigationDrawer.dart';
import 'package:GymApp/Screens/BMII/landing_screen.dart';
import 'package:GymApp/Screens/BMR/screens/main_page.dart';
import 'package:GymApp/Screens/Trainers/RulesAndRegulations.dart';
import 'package:GymApp/home2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Diet/diet.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedOptionIndexx = 0;
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Home2();
      case 1:
        return Diet();
      case 2:
        return BMICalculator();
      case 3:
        return BmrHome();
        break;
      // case 4:
      //   return RulesAndRegulations();
        default:
        return BmrHome();
    }
  }

  double value = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size;
    return Scaffold(
      // appBar: new AppBar(
      //
      //   title: Text(
      //     'Welcome to Fitnezz Den'
      //   ),
      //   backgroundColor: Colors.deepPurple[500] ,
      //   leading: IconButton(
      //    icon: Icon(FontAwesomeIcons.gripLines),
      //     onPressed: () {},
      //     color: Colors.black,
      //     tooltip: 'Menu',
      // ),
      // ),
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNavigationBarr(),
      drawer: HiddenDrawer(),
      body: callPage(selectedOptionIndexx),
    );
  }

  Widget _buildBottomNavigationBarr() {
    List<String> bottomNavigationBarOptions = [
      'Home',
      'Diet',
      'BMI',
      'BMR',
    //'Trainer\'s\nForm'
    ];

    List<IconData> bottomNavigationBarIcons = [
      Icons.home,
      Icons.favorite_border,
      Icons.notifications_none,
      Icons.info_outline,
      // Icons.person,
    ];

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.deepPurple,
         borderRadius: BorderRadius.only(
             topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        children: List.generate(bottomNavigationBarOptions.length, (index) {
          if (index == selectedOptionIndexx) {
            return Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptionIndexx = index;
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
                  selectedOptionIndexx = index;
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
