import 'package:flutter/material.dart';

class Pilates extends StatelessWidget {
  const Pilates({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // leading: Icon(Icons.menu),
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: new Text(" Pilates ",style: TextStyle(
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
                      child: Text('Few Benefits of Pilates Training are :-')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('1) Improved flexibility')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('2) Balanced muscular strength on both sides of your body')),
                ),Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('3) Enhanced muscular control of your back and limbs')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('4) Improved stabilisation of your spine')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('5) Improved posture')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('6) Rehabilitation or prevention of injuries related to muscle imbalances')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('7) Improved physical coordination and balance')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('8) Relaxation of your shoulders, neck and upper back')),
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
