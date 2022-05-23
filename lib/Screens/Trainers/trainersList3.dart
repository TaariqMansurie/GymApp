import 'package:GymApp/Authentication/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainersList3 extends StatefulWidget {
  const TrainersList3({Key key}) : super(key: key);

  @override
  _TrainersList3State createState() => _TrainersList3State();
}

class _TrainersList3State extends State<TrainersList3> {

  CollectionReference ref = Firestore.instance
      .collection('approvedMT');
  ScrollController _controller ;
  ScrollController _controller2 ;
  ScrollController _controller3 ;
  ScrollController _controller4 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Trainers',style: TextStyle(
            color: Color(0xffFFc400)
        ),),
        automaticallyImplyLeading: true,
        elevation: 2,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffFFc400)
        ),
      ),
      //drawer: UserNavigationDrawer(),
      body: StreamBuilder<QuerySnapshot>(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Container(
              child: Scrollbar(
                controller: _controller,
                interactive: true,
                thickness: 7,
                showTrackOnHover: true,
                isAlwaysShown: true,
                radius: Radius.circular(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Silver package trainers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,50,0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Silver Package " ,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: _alertDialog,
                            child: Text(
                              "     1 Month :- Rs ?" ,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: _alertDialog,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "3 Months :- Rs ?" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: _alertDialog,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "6 Months :- Rs ?" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.black,
                              color: Colors.white,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Scrollbar(
                            controller: _controller2,
                            interactive: true,
                            thickness: 7,
                            showTrackOnHover: true,
                            isAlwaysShown: true,
                            radius: Radius.circular(20),
                            child: ListView.builder(itemBuilder: (context, index) {
                              final String name = snapshot.data.documents[index]['first Name'];
                              final exp = snapshot.data.documents[index]['experience'];
                              return exp == '2+ Years' ? Card(
                                child: ListTile(
                                  onTap: (){
                                    print('trainer\'s profile');
                                    // Navigator.push(
                                    //   context, MaterialPageRoute(
                                    //     builder: (context) => SuperTransformation1(name,achievement,certification,specialization,exp,profilepic,doc)),
                                    // );
                                    _alertDialog();
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
                                              image: NetworkImage(snapshot.data.documents[index]['maleprofiletrainer']),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )
                                      )
                                  ),
                                  title: Text(name.substring(0,2)),
                                  // trailing: SizedBox(
                                  //   width: 100,
                                  //   child: Row(
                                  //     children: [
                                  //       IconButton(
                                  //         onPressed: (){
                                  //           // ref.add({
                                  //           //   'first Name' : snapshot.data.documents[index]['First Name'],
                                  //           //   'last Name'  : snapshot.data.documents[index]['Last Name'],
                                  //           //   'gender'     : snapshot.data.documents[index]['Gender'],
                                  //           //   'certifications' : snapshot.data.documents[index]['Certifications'],
                                  //           //   'specialization' : snapshot.data.documents[index]['Specialization'],
                                  //           //   'date of certifications' : snapshot.data.documents[index]['Date of Certifications'],
                                  //           //   'achievements' : snapshot.data.documents[index]['Achievements'],
                                  //           //   'experience' : snapshot.data.documents[index]['Experience'],
                                  //           //   'maleprofiletrainer' : snapshot.data.documents[index]['profile_pic_url_tm'],
                                  //           // });
                                  //
                                  //           //yeh hone pe hum ek message show karenge toast ka ki disappove hogayaa tumhara form.
                                  //           print('hogaya retrieval');
                                  //         },
                                  //         color: Colors.blueGrey,
                                  //         icon: Icon(FontAwesomeIcons.thumbsUp),
                                  //       ),
                                  //       IconButton(
                                  //         onPressed: (){
                                  //           // showDialog(context: context, builder: builder);
                                  //           //yeh hone pe hum ek message show karenge toast ka ki disappove hogayaa tumhara form.
                                  //        //   _alertDialog(snapshot, index) ;
                                  //           print('nhi hua retrieval hogayaa');
                                  //         },
                                  //         color: Colors.grey,
                                  //         icon: Icon(FontAwesomeIcons.solidThumbsDown),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ),
                              ) : Container(
                                height: 0,
                                width: 0,
                              );
                            },
                              itemCount: snapshot.hasData ? snapshot.data.documents.length : 0 ,
                              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 50,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,50,0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Gold Package " ,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: _alertDialog,
                            child: Text(
                              "         1 Month :- Rs ?" ,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: _alertDialog,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "3 Months :- Rs ?" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: _alertDialog,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "6 Months :- Rs ?" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.black,
                              color: Colors.white,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Scrollbar(
                            controller: _controller3,
                            interactive: true,
                            thickness: 7,
                            showTrackOnHover: true,
                            isAlwaysShown: true,
                            radius: Radius.circular(20),
                            child: ListView.builder(itemBuilder: (context, index) {
                              final String name = snapshot.data.documents[index]['first Name'];
                              // final String achievement = snapshot.data.documents[index]['achievements'];
                              // final String certification = snapshot.data.documents[index]['certifications'];
                              // final String specialization = snapshot.data.documents[index]['specialization'];
                               final exp = snapshot.data.documents[index]['experience'];
                              // final String profilepic = snapshot.data.documents[index]['maleprofiletrainer'];
                              // final String doc = snapshot.data.documents[index]['date of certifications'];
                              return exp == '4+ Years' ? Card(
                                child: ListTile(
                                  onTap: (){
                                    print('trainer\'s profile');
                                    // Navigator.push(
                                    //   context, MaterialPageRoute(
                                    //     builder: (context) => SuperTransformation1(name,achievement,certification,specialization,exp,profilepic,doc)),
                                    // );
                                    _alertDialog();
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
                                              image: NetworkImage(snapshot.data.documents[index]['maleprofiletrainer']),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )
                                      )
                                  ),
                                  title: Text(name.substring(0,2)),
                                  // trailing: SizedBox(
                                  //   width: 100,
                                  //   child: Row(
                                  //     children: [
                                  //       IconButton(
                                  //         onPressed: (){
                                  //           // ref.add({
                                  //           //   'first Name' : snapshot.data.documents[index]['First Name'],
                                  //           //   'last Name'  : snapshot.data.documents[index]['Last Name'],
                                  //           //   'gender'     : snapshot.data.documents[index]['Gender'],
                                  //           //   'certifications' : snapshot.data.documents[index]['Certifications'],
                                  //           //   'specialization' : snapshot.data.documents[index]['Specialization'],
                                  //           //   'date of certifications' : snapshot.data.documents[index]['Date of Certifications'],
                                  //           //   'achievements' : snapshot.data.documents[index]['Achievements'],
                                  //           //   'experience' : snapshot.data.documents[index]['Experience'],
                                  //           //   'maleprofiletrainer' : snapshot.data.documents[index]['profile_pic_url_tm'],
                                  //           // });
                                  //
                                  //           //yeh hone pe hum ek message show karenge toast ka ki disappove hogayaa tumhara form.
                                  //           print('hogaya retrieval');
                                  //         },
                                  //         color: Colors.blueGrey,
                                  //         icon: Icon(FontAwesomeIcons.thumbsUp),
                                  //       ),
                                  //       IconButton(
                                  //         onPressed: (){
                                  //           // showDialog(context: context, builder: builder);
                                  //           //yeh hone pe hum ek message show karenge toast ka ki disappove hogayaa tumhara form.
                                  //        //   _alertDialog(snapshot, index) ;
                                  //           print('nhi hua retrieval hogayaa');
                                  //         },
                                  //         color: Colors.grey,
                                  //         icon: Icon(FontAwesomeIcons.solidThumbsDown),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ),
                              ) : Container(
                                height: 0,
                                width: 0,
                              );
                            },
                              itemCount: snapshot.hasData ? snapshot.data.documents.length : 0 ,
                              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 50,),

                      //platinum package trainers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,50,0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Platinum Package " ,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: _alertDialog,
                            child: Text(
                              "       1 Month :- Rs ?" ,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                     InkWell(
                         onTap: _alertDialog,

                         child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              "3 Months :- Rs ?" ,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: _alertDialog,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "6 Months :- Rs ?" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Scrollbar(
                            controller: _controller4,
                            interactive: true,
                            thickness: 7,
                            showTrackOnHover: true,
                            isAlwaysShown: true,
                            radius: Radius.circular(20),
                            child: ListView.builder(itemBuilder: (context, index) {
                              final String name = snapshot.data.documents[index]['first Name'];
                              final exp = snapshot.data.documents[index]['experience'];
                              return exp == '8+ Years' ? Card(
                                child: ListTile(
                                  onTap: (){
                                    _alertDialog();
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
                                              image: NetworkImage(snapshot.data.documents[index]['maleprofiletrainer']),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )
                                      )
                                  ),
                                  title: Text(name.substring(0,2)),
                                  // trailing: SizedBox(
                                  //   width: 100,
                                  //   child: Row(
                                  //     children: [
                                  //       IconButton(
                                  //         onPressed: (){
                                  //           // ref.add({
                                  //           //   'first Name' : snapshot.data.documents[index]['First Name'],
                                  //           //   'last Name'  : snapshot.data.documents[index]['Last Name'],
                                  //           //   'gender'     : snapshot.data.documents[index]['Gender'],
                                  //           //   'certifications' : snapshot.data.documents[index]['Certifications'],
                                  //           //   'specialization' : snapshot.data.documents[index]['Specialization'],
                                  //           //   'date of certifications' : snapshot.data.documents[index]['Date of Certifications'],
                                  //           //   'achievements' : snapshot.data.documents[index]['Achievements'],
                                  //           //   'experience' : snapshot.data.documents[index]['Experience'],
                                  //           //   'maleprofiletrainer' : snapshot.data.documents[index]['profile_pic_url_tm'],
                                  //           // });
                                  //
                                  //           //yeh hone pe hum ek message show karenge toast ka ki disappove hogayaa tumhara form.
                                  //           print('hogaya retrieval');
                                  //         },
                                  //         color: Colors.blueGrey,
                                  //         icon: Icon(FontAwesomeIcons.thumbsUp),
                                  //       ),
                                  //       IconButton(
                                  //         onPressed: (){
                                  //           // showDialog(context: context, builder: builder);
                                  //           //yeh hone pe hum ek message show karenge toast ka ki disappove hogayaa tumhara form.
                                  //        //   _alertDialog(snapshot, index) ;
                                  //           print('nhi hua retrieval hogayaa');
                                  //         },
                                  //         color: Colors.grey,
                                  //         icon: Icon(FontAwesomeIcons.solidThumbsDown),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ),
                              ) : Container(
                                height: 0,
                                width: 0,
                              );
                            },
                              itemCount: snapshot.hasData ? snapshot.data.documents.length : 0 ,
                              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                            ),
                          ),
                        ),),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
  void _alertDialog() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 30,
            title: Text("To know more"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
            ),
            content: Text(
                "Kindly login to your account !"),
            buttonPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            actions: <Widget>[
              TextButton(
                child: Text("No",style: TextStyle(color: Colors.black),),style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffffc400)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black
                  ))
              ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text("Yes",style: TextStyle(color: Colors.black),),style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffffc400)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  textStyle: MaterialStateProperty.all(TextStyle(
                      color: Colors.black
                  ))
              ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserSignIn()));
                },
              ),
            ],
          );
        }
    );
  }
}
