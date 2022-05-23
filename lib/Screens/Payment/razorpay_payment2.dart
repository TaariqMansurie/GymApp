import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Screens/Trainers/trainersList2.dart';
import 'package:flutter/material.dart';

class RazorpayPayment2 extends StatelessWidget {
  TextEditingController paymentControllerr = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Package Details',style: TextStyle(
            color: Color(0xffFFc400)
        ),),
        automaticallyImplyLeading: true,
        elevation: 2,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffFFc400)
        ),
      ),
      drawer: UserNavigationDrawer(),
      body:  Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:0,right:10),
                    child:Text('Please first select a trainer'),
                    // TextField(
                    //   keyboardType: TextInputType.number,
                    //   controller: paymentControllerr,
                    //   decoration: InputDecoration(
                    //     hintText: 'Enter the package amount to pay',
                    //     icon: Icon(FontAwesomeIcons.moneyBill,
                    //       color: Color(0xffffc400),
                    //       size: 25,
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: Color(0xffffc400)
                    //         ),
                    //         borderRadius: BorderRadius.circular(10)
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: Colors.black,
                    //         width: 2.0,
                    //       ),
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //   ),
                    //   cursorColor: Color(0xffffc400),
                    // ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                        child: Text('View Trainers', style: TextStyle(
                            color: Color(0xffffc400)
                        ),),
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder : (context) => TrainersList2()),
                          );
                        }
                    ),
                  ),
                ],
              )
    );
  }
}
