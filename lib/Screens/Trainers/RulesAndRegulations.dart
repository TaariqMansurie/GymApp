import 'package:GymApp/Screens/Trainers/trainersForm.dart';
import 'package:flutter/material.dart';

class RulesAndRegulations extends StatelessWidget {
  const RulesAndRegulations({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Continue ..'),
          onPressed: (){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) {
    return TrainerForm();
          },
        ),
    );
  },
    ),
    ),
    );
}
}
