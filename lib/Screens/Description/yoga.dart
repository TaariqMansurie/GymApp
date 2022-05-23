import 'package:flutter/material.dart';

class Yoga extends StatelessWidget {
  const Yoga({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // leading: Icon(Icons.menu),
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: new Text(" Yoga ",style: TextStyle(
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
                      child: Text('Few Benefits of Yoga are :-')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('1) Yoga helps with back pain relief.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('2) Yoga can ease arthritis symptoms')),
                ),Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('3) Yoga benefits heart health.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('4) Yoga relaxes you, to help you sleep better.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('5) Yoga can mean more energy and brighter moods.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('6) Yoga improves strength, balance and flexibility.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('7) Yoga helps with back pain relief.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('8) Yoga helps you manage stress.')),
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
