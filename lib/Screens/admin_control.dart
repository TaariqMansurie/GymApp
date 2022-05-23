import 'package:GymApp/Screens/Payment/payment_success.dart';
import 'package:GymApp/Screens/Transformations/transformation3.dart';
import 'package:GymApp/Screens/Transformations/transformation4.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminControl extends StatefulWidget {
  const AdminControl({Key key}) : super(key: key);

  @override
  _AdminControlState createState() => _AdminControlState();
}

class _AdminControlState extends State<AdminControl> {
  CollectionReference ref = Firestore.instance
      .collection('approvedMT');

  CollectionReference reff = Firestore.instance
      .collection('approvedFT');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Color(0xffFFc400),
              tabs: [
                Tab(text: 'Approvals'),
                Tab(text: 'Client Sessions',),
              ],
            ),
            title: Text('Admin Control',style: TextStyle(color: Color(0xffFFC400)),),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () {Navigator.of(context).pop();}),
            iconTheme: IconThemeData(
              color: Color(0xffFFC400)
            ),
          ),
          body: TabBarView(
            children: [
              TrainersApprovals(),
              ClientSessions(),
            ],
          ),
        ),
      ),
    );
  }
}

class TrainersApprovals extends StatefulWidget {

  @override
  _TrainersApprovalsState createState() => _TrainersApprovalsState();
}

class _TrainersApprovalsState extends State<TrainersApprovals> {
  CollectionReference ref = Firestore.instance
      .collection('approvedMT');

  CollectionReference reff = Firestore.instance
      .collection('approvedFT');

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
                            .collection('maleTrainers')
                            .snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                           return CircularProgressIndicator();
                           } else if (snapshot.connectionState == ConnectionState.active){
                            return ListView.builder(itemBuilder: (context, index) {
                              final String nameOG = snapshot.data.documents[index]['First Name'];
                              final String achievementOG = snapshot.data.documents[index]['Achievements'];
                              final String certificationOG = snapshot.data.documents[index]['Certifications'];
                              final String specializationOG = snapshot.data.documents[index]['Specialization'];
                              final expOG = snapshot.data.documents[index]['Experience'];
                              final docOG = snapshot.data.documents[index]['Date of Certifications'];
                              final String profilepicOG = snapshot.data.documents[index]['profile_pic_url_tm'];
                              return ListTile(
                                onTap: (){
                                  print('trainer profile');
                                  Navigator.push(
                                    context, MaterialPageRoute(
                                      builder: (context) => SuperTransformation3(nameOG,achievementOG,certificationOG,specializationOG,expOG,profilepicOG,docOG)),
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
                                            image: profilepicOG.isNotEmpty ? NetworkImage(profilepicOG) : Image.asset('assets/apple.png'),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        )
                                    )
                                ),
                                title: Text(snapshot.data.documents[index]['First Name']),
                                trailing: SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: (){
                                          _alertDialogg(snapshot, index) ;
                                          print('approve hogaya');
                                        },
                                        color: Colors.blueGrey,
                                        icon: Icon(FontAwesomeIcons.thumbsUp),
                                      ),
                                      IconButton(
                                        onPressed: (){
                                          _alertDialog(snapshot, index) ;
                                           print('disapprove hogayaa');
                                        },
                                        color: Colors.grey,
                                        icon: Icon(FontAwesomeIcons.solidThumbsDown),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                              itemCount: snapshot.hasData ? snapshot.data.documents.length : Center(child: Text('No Trainer\'s data yet '),) ,
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
                              .collection('femaleTrainers')
                              .snapshots(),
                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return CircularProgressIndicator();
                            }else if (snapshot.connectionState == ConnectionState.active) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  final String nameOG = snapshot.data.documents[index]['First Name'];
                                  final String achievementOG = snapshot.data.documents[index]['Achievements'];
                                  final String certificationOG = snapshot.data.documents[index]['Certifications'];
                                  final String specializationOG = snapshot.data.documents[index]['Specialization'];
                                  final expOG = snapshot.data.documents[index]['Experience'];
                                  final docOG = snapshot.data.documents[index]['Date of Certifications'] ;
                                  final String profilepicOG = snapshot.data.documents[index]['profile_pic_url_tf'];
                                  return ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) => SuperTransformation4(nameOG, achievementOG, certificationOG, specializationOG, expOG, profilepicOG)),
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
                                                image: profilepicOG.isNotEmpty ? NetworkImage(profilepicOG) : Image.asset('assets/apple.png'),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            )
                                        )
                                    ),
                                    title: Text(snapshot.data.documents[index]['First Name']),
                                    trailing: SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              _alertDialoggg(snapshot, index);
                                              print('approve hogaya');
                                            },
                                            color: Colors.blueGrey,
                                            icon: Icon(FontAwesomeIcons.thumbsUp),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              _alertDialog(snapshot, index);
                                              print('disapprove hogayaa');
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

      //disapprove karne ke liye trainer ka form
  void _alertDialog(AsyncSnapshot<QuerySnapshot> snapshot, index) {
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
                "Are you sure you want to disapprove this trainer's form ?"),
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
                  snapshot.data.documents[index].reference.delete();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  //approve karen ke liye male trainer ka form
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
                "Are you sure you want to approve this trainer's form ?"),
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
                    'first Name': snapshot.data.documents[index]['First Name'],
                    'last Name': snapshot.data.documents[index]['Last Name'],
                    'gender': snapshot.data.documents[index]['Gender'],
                    'certifications': snapshot.data.documents[index]['Certifications'],
                    'specialization': snapshot.data.documents[index]['Specialization'],
                    'date of certifications': snapshot.data.documents[index]['Date of Certifications'],
                    'achievements': snapshot.data.documents[index]['Achievements'],
                    'experience': snapshot.data.documents[index]['Experience'],
                    'maleprofiletrainer': snapshot.data.documents[index]['profile_pic_url_tm'],
                  });
                  snapshot.data.documents[index].reference.delete();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  //approve karen ke liye female trainer ka form
  void _alertDialoggg(AsyncSnapshot<QuerySnapshot> snapshot, index) {
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
                "Are you sure you want to approve this trainer's form ?"),
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
                    'first Name': snapshot.data.documents[index]['First Name'],
                    'last Name': snapshot.data.documents[index]['Last Name'],
                    'gender': snapshot.data.documents[index]['Gender'],
                    'certifications': snapshot.data.documents[index]['Certifications'],
                    'specialization': snapshot.data.documents[index]['Specialization'],
                    'dateofcertifications': snapshot.data.documents[index]['Date of Certifications'],
                    'achievements': snapshot.data.documents[index]['Achievements'],
                    'experience': snapshot.data.documents[index]['Experience'],
                    'femaleprofiletrainer': snapshot.data.documents[index]['profile_pic_url_tf'],
                  });
                  snapshot.data.documents[index].reference.delete();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}

class ClientSessions extends StatefulWidget {

  @override
  _ClientSessionsState createState() => _ClientSessionsState();
}

class _ClientSessionsState extends State<ClientSessions> {
  @override
  Widget build(BuildContext context) {
    CollectionReference ref = Firestore.instance
        .collection('users');
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: StreamBuilder<QuerySnapshot>(
              stream: ref.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(itemBuilder: (context,index){
                    print(snapshot.hasData);
                    print(snapshot.data.documents[index]['userName']);
                    String userName = snapshot.data.documents[index]['userName'];
                    String email = snapshot.data.documents[index]['userEmail'];
                    String gender = snapshot.data.documents[index]['gender'];
                    String profilePic = snapshot.data.documents[index]['profile_pic_url'];
                    String trainerSelected = snapshot.data.documents[index]['Trainer\'s Name'];
                    String packageDuration  = snapshot.data.documents[index]['package_duration'];
                    String packageType = snapshot.data.documents[index]['package_type'];
                    String paymentSuccess = snapshot.data.documents[index]['payment_successful'];
                    String paymentAmount = snapshot.data.documents[index]['package_amount'];
                    return Card(
                      child: ListTile(
                        onTap: (){
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => PaymentSuccessful(userName,email,gender,profilePic,trainerSelected,packageDuration,packageType,paymentSuccess,paymentAmount)),
                          );
                        },
                        // leading: CircleAvatar(
                        //     child: ClipRRect(
                        //         borderRadius: BorderRadius.circular(20.0),
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //               shape: BoxShape.rectangle,
                        //               borderRadius: BorderRadius.circular(20)
                        //           ),
                        //           child: Image(
                        //             height: 80,
                        //             width: 50,
                        //             image: profilePic != null ? NetworkImage(profilePic) : Image.asset('assets/apple.png'),
                        //             fit: BoxFit.fitWidth,
                        //           ),
                        //         )
                        //     )
                        // ),
                        title: Text(userName),
                      ),
                    );
                  },
                      itemCount: snapshot.hasData ? snapshot.data.documents.length : Center(child: Text('No Trainer\'s data yet '),) ,
                );
                }else{
                  return Container(child: Center(child: Text('No Trainer\'s Data'),),);
                }
              }
            )
        )
    );
  }
}

