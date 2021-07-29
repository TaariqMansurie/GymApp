import 'package:GymApp/Drawers/adminNavigationDrawer.dart';
import 'package:flutter/material.dart';

class Trainings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Types of Fitness Courses'),
          backgroundColor: Colors.deepPurple[500],
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: Text('List of trainings'),
        ),
        drawer: UserNavigationDrawer(),
    );
  }
}
