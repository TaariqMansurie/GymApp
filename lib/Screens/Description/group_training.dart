import 'package:flutter/material.dart';

class GroupTraining extends StatelessWidget {
  const GroupTraining({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // leading: Icon(Icons.menu),
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: new Text(" Group Training ",style: TextStyle(
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
                      child: Text('Few Benefits of Group Training are :-')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('1) You get a qualified fitness expert at your disposal.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('2) You can get more bang for your buck.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('3) There is a lower risk of injury.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('4) It’s super easy.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('5) There\'s camaraderie between participants.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('6) It adds huge variety to your workout.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('7) You get a higher endorphin output.')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('8) There are hidden incentives to make you go.')),
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
