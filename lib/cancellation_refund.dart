import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:flutter/material.dart';

class CancellationRefund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'Cancellation/Refund Policies',style: TextStyle(
            color: Color(0xffffc400)
        ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        automaticallyImplyLeading: true,
      ),
      drawer: UserNavigationDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50,),

          Container(
            decoration: BoxDecoration(
                color: Color(0xffffc400),
                shape: BoxShape.circle
            ),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            width: MediaQuery.of(context).size.width,
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,0,0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Privacy Policy" ,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text('Payments once made will be non-refundable.'
                    'If you have any complaints about your training, or your trainer please feel free to connect with us on chat Or mail us on fitnessden19@gmail.com'),
                  SizedBox(height: 10,),
                ]
            ),
          ),
        ],
      ),
    );
  }
}
