import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Screens/ImageDisplay.dart';
import 'package:flutter/material.dart';


class Description2 extends StatefulWidget {
  const Description2({Key key}) : super(key: key);

  @override
  _Description2State createState() => _Description2State();
}

class _Description2State extends State<Description2> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: Text('Fitnezz Den Warriors',style: TextStyle(color: Color(0xffffc400)),),
        iconTheme: IconThemeData(color: Color(0xffffc400)),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 50),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left : 15.0,right: 15),
                      child: Text('Fitness trainers are the lifeline of our society\'s health, we term them as fitness den warriors as they are solely responsible for people\'s health and fitness.'
                          'We therefore appreciate all the fitness professionals and call them as warriors.'),
                    ),
                    SizedBox(height: 10,),
                    Text('Click next to see the Fitnezz Den Warriors Image Wall',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                ImageDisplay()
                            )
                        );
                      },
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Color(0xffffc400)),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15)
                            ),
                          ),
                          height: 50,
                          width: 100,
                          child: Center(
                            child: Text('Next',style: TextStyle(color: Color(0xffffc400),fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),),
          ],
        ),
      ),
      drawer: UserNavigationDrawer(),
    );
  }
}
