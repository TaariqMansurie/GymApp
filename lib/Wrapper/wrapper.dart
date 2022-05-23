import 'package:GymApp/Screens/home.dart';
import 'package:GymApp/Screens/userhome.dart';
import 'package:GymApp/shared/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context){

   final user = Provider.of<User>(context);


    //returns either home or authenticate widget
    if(user == null) // no current user is logged in..so we want to protect our userhome screen !!
        {
      return Home();
    } else {
      return UserHome();
    }

  }
}
