import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
            'Welcome to Fit Mumbaii'
        ),backgroundColor: Colors.deepPurple[500],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            color: Colors.black,
            tooltip: 'Logout',
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      drawer: UserNavigationDrawer(),
    );
  }
}
