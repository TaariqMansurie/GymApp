import 'package:GymApp/Screens/Payment/razorpay_payment.dart';
import 'package:GymApp/Screens/Trainings/TrainingDetailsScreen.dart';
import 'package:GymApp/Screens/admin_control.dart';
import 'package:flutter/material.dart';

class SilverPackagee extends StatelessWidget {
  const SilverPackagee({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: Text(
            'Silver Package'
        ),backgroundColor: Colors.deepPurple[500],
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.exit_to_app),
          //   color: Colors.black,
          //   tooltip: 'Logout',
          //   onPressed: () async {
          //     await _auth.signOut();
          //   },
          // ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('1 Month Package',style: TextStyle(
                fontSize: 30,fontWeight: FontWeight.bold,
                backgroundColor: Colors.deepPurple[100],
                color: Colors.black,
                ),
              ),
              SizedBox(height:15),
              Text('3 Month Package',style: TextStyle(
                fontSize: 30,fontWeight: FontWeight.bold,
                backgroundColor: Colors.deepPurple[100],
                color: Colors.black,
                ),
              ),
              SizedBox(height:15),
              Text('6 Month Package',style: TextStyle(
                fontSize: 30,fontWeight: FontWeight.bold,
                backgroundColor: Colors.deepPurple[100],
                color: Colors.black,
                ),
              ),
              SizedBox(height:15),
              Text('12 Month Package',style: TextStyle(
                fontSize: 30,fontWeight: FontWeight.bold,
                backgroundColor: Colors.deepPurple[100],
                color: Colors.black,
                ),
              ),
              RaisedButton(child: Text('Payments'),onPressed: (){ Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => RazorpayPayment()),
              );},),
              RaisedButton(child: Text('Sessions'),onPressed: (){ Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => TrainingDetailsScreen()),
              );},),
              RaisedButton(child: Text('Admin'),onPressed: (){ Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => AdminControl()),
              );},),
            ],
          ),
        )
      ),
    );
  }
}
