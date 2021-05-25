import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
          backgroundColor: Colors.deepPurple[500],
        ),
        body: Center(
          child: Text('About Us Page'),
        ));
  }
}
