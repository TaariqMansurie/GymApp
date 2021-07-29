import 'package:GymApp/Drawers/adminNavigationDrawer.dart';
import 'package:flutter/material.dart';

class CrossFit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Crossfit'),
          backgroundColor: Colors.deepPurple[500],
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: Text('Crossfit Page'),
        ),
      drawer: UserNavigationDrawer(),
    );
  }
}
