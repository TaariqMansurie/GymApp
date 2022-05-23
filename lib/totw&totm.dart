import 'package:GymApp/Screens/Transformations/transformation6.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AdminTrainerofWeekAndMonth extends StatefulWidget {
  const AdminTrainerofWeekAndMonth({Key key}) : super(key: key);

  @override
  _AdminTrainerofWeekAndMonthState createState() => _AdminTrainerofWeekAndMonthState();
}

class _AdminTrainerofWeekAndMonthState extends State<AdminTrainerofWeekAndMonth> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new AppBar(
            // leading: Icon(Icons.menu),
            backgroundColor: Colors.black,
            elevation: 0.0,
            title: new Text(" TOW and TOM",style: TextStyle(
                color: Color(0xffFFC400)
            ),),
            iconTheme: IconThemeData(
                color: Color(0xffFFC400)
            ),
            automaticallyImplyLeading: true,
          bottom: TabBar(
            indicatorColor: Color(0xffFFc400),
            tabs: [
              Tab(text: 'Trainer of the Week'),
              Tab(text: 'Trainer of the Month',),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TrainerofTheWeek(),
              TrainerofTheMonth(),
            ],
          ),
        ),
      ),
    );
  }
}

class TrainerofTheWeek extends StatefulWidget {

  @override
  _TrainerofTheWeekState createState() => _TrainerofTheWeekState();
}

class _TrainerofTheWeekState extends State<TrainerofTheWeek> {
  CollectionReference ref = Firestore.instance
      .collection('trainer_of_the_week');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,5,0,0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "   Trainer Of the Week" ,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w900),textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,5,0,0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "   Male Trainers" ,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.w900),textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.black,
                        color: Colors.white,
                        border: Border.all(color: Colors.black)
                    ),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('approvedMT')
                            .snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return CircularProgressIndicator();
                          } else if (snapshot.connectionState == ConnectionState.active){
                            return ListView.builder(itemBuilder: (context, index) {
                              final String name = snapshot.data.documents[index]['first Name'];
                              final String achievement = snapshot.data.documents[index]['achievements'];
                              final String certification = snapshot.data.documents[index]['certifications'];
                              final String specialization = snapshot.data.documents[index]['specialization'];
                              final exp = snapshot.data.documents[index]['experience'];
                              final String profilepic = snapshot.data.documents[index]['maleprofiletrainer'];
                              final String doc = snapshot.data.documents[index]['date of certifications'];
                              return ListTile(
                                onTap: (){
                                  Navigator.push(
                                    context, MaterialPageRoute(
                                      builder: (context) => SuperTransformation6(name,achievement,certification,specialization,exp,profilepic,doc)),
                                  );
                                },
                                leading: CircleAvatar(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Image(
                                            height: 80,
                                            width: 50,
                                            image: profilepic.isNotEmpty ? NetworkImage(profilepic) : Image.asset('assets/apple.png'),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        )
                                    )
                                ),
                                title: Text(name),
                                trailing: SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: (){
                                          //yeh hone pe hum ek message show karenge toast ka ki disappove hogayaa tumhara form.
                                          _alertDialogg(snapshot, index) ;
                                        },
                                        color: Colors.blueGrey,
                                        icon: Icon(FontAwesomeIcons.thumbsUp),
                                      ),
                                      IconButton(
                                        onPressed: (){
                                          _alertDialog(snapshot, index) ;
                                          },
                                        color: Colors.grey,
                                        icon: Icon(FontAwesomeIcons.solidThumbsDown),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                              itemCount: snapshot.hasData ? snapshot.data.documents.length : 0 ,
                              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                            );
                          } else{
                            return Container(child: Center(child: Text('No Trainer\'s Data'),),);
                          }
                        }),
                  ),
                ),
                SizedBox(height: 10.0,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(5,5,0,0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "   Female Trainers" ,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w900),textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.black,
                        color: Colors.white,
                        border: Border.all(color: Colors.black)
                    ),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('approvedFT')
                            .snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return CircularProgressIndicator();
                          }else if (snapshot.connectionState == ConnectionState.active) {
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                final String name = snapshot.data.documents[index]['first Name'];
                                final String lastname = snapshot.data.documents[index]['last Name'];
                                final String achievement = snapshot.data.documents[index]['achievements'];
                                final String certification = snapshot.data.documents[index]['certifications'];
                                final String specialization = snapshot.data.documents[index]['specialization'];
                                final exp = snapshot.data.documents[index]['experience'];
                                final String profilepic = snapshot.data.documents[index]['femaleprofiletrainer'];
                                final String doc = snapshot.data.documents[index]['dateofcertifications'];
                                return ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) => SuperTransformation6(name, achievement, certification, specialization, exp, profilepic,doc)),
                                    );
                                  },
                                  leading: CircleAvatar(
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Image(
                                              height: 80,
                                              width: 50,
                                              image: profilepic.isNotEmpty ? NetworkImage(profilepic) : Image.asset('assets/apple.png'),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )
                                      )
                                  ),
                                  title: Text(name),
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            _alertDialoggg(snapshot, index);
                                          },
                                          color: Colors.blueGrey,
                                          icon: Icon(FontAwesomeIcons.thumbsUp),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _alertDialog(snapshot, index);
                                          },
                                          color: Colors.grey,
                                          icon: Icon(
                                              FontAwesomeIcons.solidThumbsDown),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.hasData ? snapshot.data.documents.length : 0,
                              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                            );
                          }else{
                            return Container(child: Center(child: Text('No Trainer\'s Data'),),);
                          }
                        }),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  //disapprove ka alert dialog box
  void _alertDialog(AsyncSnapshot<QuerySnapshot> snapshot, index) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 30,
            title: Text("Trainer Approval for TOW"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
            ),
            content: Text(
                "Are you sure you want to disapprove this trainer for TOW ?"),
            buttonPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                child: Text("No",style: TextStyle(
                    color: Colors.black
                ),),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Yes",style: TextStyle(
                    color: Colors.black
                ),),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                onPressed: () {
               //   snapshot.data.documents[index].reference.delete();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
  //approve ka alert dialog box male trainer ko
  void _alertDialogg(AsyncSnapshot<QuerySnapshot> snapshot, index) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 30,
            title: Text("Trainer Approval for TOW"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
            ),
            content: Text(
                "Are you sure you want to approve this trainer for TOW?"),
            buttonPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                child: Text("No",style: TextStyle(
                    color: Colors.black
                ),),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Yes",style: TextStyle(
                    color: Colors.black
                ),),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                onPressed: () {
                  ref.add({
                    'first Name': snapshot.data.documents[index]['first Name'],
                    'last Name': snapshot.data.documents[index]['last Name'],
                    'gender': snapshot.data.documents[index]['gender'],
                    'certifications': snapshot.data.documents[index]['certifications'],
                    'specialization': snapshot.data.documents[index]['specialization'],
                    'dateofcertifications': snapshot.data.documents[index]['date of certifications'],
                    'achievements': snapshot.data.documents[index]['achievements'],
                    'experience': snapshot.data.documents[index]['experience'],
                    'starTrainerProfileMale': snapshot.data.documents[index]['maleprofiletrainer'],
                  });
                //  snapshot.data.documents[index].reference.delete();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
  //approve karne ke liye alert dialog box female trainer ko
  void _alertDialoggg(AsyncSnapshot<QuerySnapshot> snapshot, index) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 30,
            title: Text("Trainer Approval for TOW"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
            ),
            content: Text(
                "Are you sure you want to approve this trainer for TOW? "),
            buttonPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                child: Text("No",style: TextStyle(
                    color: Colors.black
                ),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Yes",style: TextStyle(
                    color: Colors.black
                ),),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                onPressed: () {
                  ref.add({
                    'first Name': snapshot.data.documents[index]['first Name'],
                    'last Name': snapshot.data.documents[index]['last Name'],
                    'gender': snapshot.data.documents[index]['gender'],
                    'certifications': snapshot.data.documents[index]['certifications'],
                    'specialization': snapshot.data.documents[index]['specialization'],
                    'dateofcertifications': snapshot.data.documents[index]['dateofcertifications'],
                    'achievements': snapshot.data.documents[index]['achievements'],
                    'experience': snapshot.data.documents[index]['experience'],
                    'starTrainerProfileFemale': snapshot.data.documents[index]['femaletrainerprofile'],
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}

class TrainerofTheMonth extends StatefulWidget {
  @override
  _TrainerofTheMonthState createState() => _TrainerofTheMonthState();
}

class _TrainerofTheMonthState extends State<TrainerofTheMonth> {

  CollectionReference reff = Firestore.instance
      .collection('trainer_of_the_month');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,5,0,0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Trainer Of the Month" ,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w900),textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,5,0,0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "   Male Trainers" ,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w900),textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.black,
                        color: Colors.white,
                        border: Border.all(color: Colors.black)
                    ),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('approvedMT')
                            .snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return CircularProgressIndicator();
                          } else if (snapshot.connectionState == ConnectionState.active){
                            return ListView.builder(itemBuilder: (context, index) {
                              final String name = snapshot.data.documents[index]['first Name'];
                              final String achievement = snapshot.data.documents[index]['achievements'];
                              final String certification = snapshot.data.documents[index]['certifications'];
                              final String specialization = snapshot.data.documents[index]['specialization'];
                              final exp = snapshot.data.documents[index]['experience'];
                              final String profilepic = snapshot.data.documents[index]['maleprofiletrainer'];
                              final String doc = snapshot.data.documents[index]['date of certifications'];
                              return ListTile(
                                onTap: (){
                                  print('trainer profile');
                                  Navigator.push(
                                    context, MaterialPageRoute(
                                      builder: (context) => SuperTransformation6(name,achievement,certification,specialization,exp,profilepic,doc)),
                                  );
                                },
                                leading: CircleAvatar(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Image(
                                            height: 80,
                                            width: 50,
                                            image: profilepic.isNotEmpty ? NetworkImage(profilepic) : Image.asset('assets/apple.png'),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        )
                                    )
                                ),
                                title: Text(name),
                                trailing: SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: (){
                                          //yeh hone pe hum ek message show karenge toast ka ki disappove hogayaa tumhara form.
                                            _alertDialogg(snapshot, index) ;
                                        },
                                        color: Colors.blueGrey,
                                        icon: Icon(FontAwesomeIcons.thumbsUp),
                                      ),
                                      IconButton(
                                        onPressed: (){
                                             _alertDialog(snapshot, index) ;
                                        },
                                        color: Colors.grey,
                                        icon: Icon(FontAwesomeIcons.solidThumbsDown),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                              itemCount: snapshot.hasData ? snapshot.data.documents.length : 0 ,
                              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                            );
                          } else{
                            return Container(child: Center(child: Text('No Trainer\'s Data'),),);
                          }
                        }),
                  ),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,5,0,0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "   Female Trainers" ,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w900),textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.black,
                        color: Colors.white,
                        border: Border.all(color: Colors.black)
                    ),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('approvedFT')
                            .snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return CircularProgressIndicator();
                          }else if (snapshot.connectionState == ConnectionState.active) {
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                final String name = snapshot.data.documents[index]['first Name'];
                                final String achievement = snapshot.data.documents[index]['achievements'];
                                final String certification = snapshot.data.documents[index]['certifications'];
                                final String specialization = snapshot.data.documents[index]['specialization'];
                                final exp = snapshot.data.documents[index]['experience'];
                                final String profilepic = snapshot.data.documents[index]['femaleprofiletrainer'];
                                final String doc = snapshot.data.documents[index]['date of certifications'];
                                return ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) => SuperTransformation6(name, achievement, certification, specialization, exp, profilepic,doc)),
                                    );
                                  },
                                  leading: CircleAvatar(
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Image(
                                              height: 80,
                                              width: 50,
                                              image: profilepic.isNotEmpty ? NetworkImage(profilepic) : Image.asset('assets/apple.png'),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )
                                      )
                                  ),
                                  title: Text(name),
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                                 _alertDialoggg(snapshot, index);
                                          },
                                          color: Colors.blueGrey,
                                          icon: Icon(FontAwesomeIcons.thumbsUp),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                                   _alertDialog(snapshot, index);
                                          },
                                          color: Colors.grey,
                                          icon: Icon(
                                              FontAwesomeIcons.solidThumbsDown),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.hasData ? snapshot.data.documents.length : 0,
                              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                            );
                          }else{
                            return Container(child: Center(child: Text('No Trainer\'s Data'),),);
                          }
                        }),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  //disapprove ka alert dialog box
  void _alertDialog(AsyncSnapshot<QuerySnapshot> snapshot, index) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 30,
            title: Text("Trainer Approval for TOM"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
            ),
            content: Text(
                "Are you sure you want to disapprove this trainer for TOM ?"),
            buttonPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                child: Text("No",style: TextStyle(
                    color: Color(0xffffc400)
                ),),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Yes",style: TextStyle(
                    color: Color(0xffffc400)
                ),),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                onPressed: () {
                //  snapshot.data.documents[index].reference.delete();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  //approve ka alert dialog box
  void _alertDialogg(AsyncSnapshot<QuerySnapshot> snapshot, index) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 30,
            title: Text("Trainer Approval"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
            ),
            content: Text(
                "Are you sure you want to approve this trainer for TOM?"),
            buttonPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                child: Text("No",style: TextStyle(
                    color: Colors.black
                ),),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Yes",style: TextStyle(
                    color: Colors.black
                ),),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                onPressed: () {
                  reff.add({
                    'first Name': snapshot.data.documents[index]['first Name'],
                    'last Name': snapshot.data.documents[index]['last Name'],
                    'gender': snapshot.data.documents[index]['gender'],
                    'certifications': snapshot.data.documents[index]['certifications'],
                    'specialization': snapshot.data.documents[index]['specialization'],
                    'dateofcertifications': snapshot.data.documents[index]['date of certifications'],
                    'achievements': snapshot.data.documents[index]['achievements'],
                    'experience': snapshot.data.documents[index]['experience'],
                    'starTrainerProfileMale': snapshot.data.documents[index]['malepprofiletrainer'],
                  });
              //    snapshot.data.documents[index].reference.delete();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  //approve karne ke liye alert dialog box female trainer ko
  void _alertDialoggg(AsyncSnapshot<QuerySnapshot> snapshot, index) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 30,
            title: Text("Trainer Approval for TOM"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
            ),
            content: Text(
                "Are you sure you want to approve this trainer for TOM? "),
            buttonPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                child: Text("No",style: TextStyle(
                    color: Colors.black
                ),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Yes",style: TextStyle(
                    color: Colors.black
                ),),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[400])
                ),
                onPressed: () {
                  reff.add({
                    'first Name': snapshot.data.documents[index]['first Name'],
                    'last Name': snapshot.data.documents[index]['last Name'],
                    'gender': snapshot.data.documents[index]['gender'],
                    'certifications': snapshot.data.documents[index]['certifications'],
                    'specialization': snapshot.data.documents[index]['specialization'],
                    'dateofcertifications': snapshot.data.documents[index]['dateofcertifications'],
                    'achievements': snapshot.data.documents[index]['achievements'],
                    'experience': snapshot.data.documents[index]['experience'],
                    'starTrainerProfileFemale': snapshot.data.documents[index]['femaleprofiletrainer'],
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}
