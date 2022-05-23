import 'package:flutter/material.dart';

class PhysioTherapy extends StatelessWidget {
  const PhysioTherapy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // leading: Icon(Icons.menu),
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: new Text(" Physiotherapy ",style: TextStyle(
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
                      child: Text('Few Benefits of Physio Therapy are :-')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('1) Reduce or eliminate pain. ')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('2) Avoid surgery. ')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('3) Improve mobility.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('4) Recover from a stroke. ')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('5) Recover from or prevent a sports injury. ')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('6) Improve your balance and prevent falls. ')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('7) Manage diabetes and vascular conditions.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('8) Manage age-related issues.')),
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
