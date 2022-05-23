import 'package:flutter/material.dart';

class WeightTraining extends StatelessWidget {
  const WeightTraining({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // leading: Icon(Icons.menu),
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: new Text(" Weight Training ",style: TextStyle(
            color: Color(0xffFFC400)
        ),),
        iconTheme: IconThemeData(
            color: Color(0xffFFC400)
        ),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 25,top: 10,right: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.79,
          width: MediaQuery.of(context).size.width * 0.85,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Few Benefits of Weight Training are :-')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('1) Strength Training Makes You Stronger and Fitter')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('2) Strength Training Protects Bone Health and Muscle Mass')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('3) Strength Training Helps Your Body Burn Calories Efficiently')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('4) Strength Training Helps Keep the Weight off for Good')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('5) Strength Training Helps You Develop Better Body Mechanics')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('6) Strength Training Boosts Energy Levels and Improves Your Mood')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('7) Strength Training Has Cardiovascular Health Benefits')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('8) Strength Training Can Help With Chronic Disease Management')),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 30),
                //   child: Container(
                //     height: 50,
                //     width: 300,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       shape: BoxShape.rectangle,
                //       border: Border.all(color: Colors.black),
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 30),
                //   child: Container(
                //     height: 50,
                //     width: 300,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       shape: BoxShape.rectangle,
                //       border: Border.all(color: Colors.black),
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 30),
                //   child: Container(
                //     height: 50,
                //     width: 300,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       shape: BoxShape.rectangle,
                //       border: Border.all(color: Colors.black),
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
