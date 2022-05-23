
import 'package:GymApp/Screens/Transformations/transformation1.dart';
import 'package:GymApp/Screens/Transformations/transformation2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SilverPackagee extends StatelessWidget {

  CollectionReference ref = Firestore.instance
      .collection('approvedMT');
  ScrollController _controller ;
  ScrollController _controller2 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        // leading: Icon(Icons.menu),
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: new Text(" Silver Package ",style: TextStyle(
            color: Color(0xffFFC400)
        ),),
        iconTheme: IconThemeData(
            color: Color(0xffFFC400)
        ),
        automaticallyImplyLeading: true,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.arrow_back_ios),
        //     color: Colors.blue[900],
        //     tooltip: 'Back',
        //     onPressed: () {
        //       Navigator.pushReplacement(
        //           context, MaterialPageRoute(builder: (context) => UserHome()));
        //     },
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.exit_to_app),
        //     color: Colors.blue[900],
        //     tooltip: 'Logout',
        //     onPressed: () async {
        //       await _auth.signOut();
        //     },
        //   ),
        //   // FlatButton.icon(
        //   //   onPressed: () {},
        //   //   label: Text('Save'),
        //   //   icon: Icon(Icons.save_alt),
        //   // )
        // ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            // if(snapshot.connectionState == ConnectionState.waiting){
            //   return CircularProgressIndicator();
            // } else if (snapshot.connectionState == ConnectionState.done){
            //   return ListView.builder(itemBuilder: (context, index) {
            //     return ListTile(
            //       onTap: (){},
            //       leading: CircleAvatar(
            //           child: ClipRRect(
            //               borderRadius: BorderRadius.circular(20.0),
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                     shape: BoxShape.rectangle,
            //                     borderRadius: BorderRadius.circular(20)
            //                 ),
            //                 child: Image(
            //                   height: 80,
            //                   width: 50,
            //                   image: NetworkImage(snapshot.data.documents[index]['maleprofiletrainer']),
            //                   fit: BoxFit.fitWidth,
            //                 ),
            //               )
            //           )
            //       ),
            //       title: Text(snapshot.data.documents[index]['first Name']),
            //       trailing: SizedBox(
            //         width: 100,
            //         child: Row(
            //           children: [
            //             IconButton(
            //               onPressed: (){
            //                 // ref.add({
            //                 //   'first Name' : snapshot.data.documents[index]['First Name'],
            //                 //   'last Name'  : snapshot.data.documents[index]['Last Name'],
            //                 //   'gender'     : snapshot.data.documents[index]['Gender'],
            //                 //   'certifications' : snapshot.data.documents[index]['Certifications'],
            //                 //   'specialization' : snapshot.data.documents[index]['Specialization'],
            //                 //   'date of certifications' : snapshot.data.documents[index]['Date of Certifications'],
            //                 //   'achievements' : snapshot.data.documents[index]['Achievements'],
            //                 //   'experience' : snapshot.data.documents[index]['Experience'],
            //                 //   'maleprofiletrainer' : snapshot.data.documents[index]['profile_pic_url_tm'],
            //                 // });
            //
            //                 //yeh hone pe hum ek message show karenge toast ka ki disappove hogayaa tumhara form.
            //                 print('hogaya retrieval');
            //               },
            //               color: Colors.blueGrey,
            //               icon: Icon(FontAwesomeIcons.thumbsUp),
            //             ),
            //             IconButton(
            //               onPressed: (){
            //                 // showDialog(context: context, builder: builder);
            //                 //yeh hone pe hum ek message show karenge toast ka ki disappove hogayaa tumhara form.
            //              //   _alertDialog(snapshot, index) ;
            //                 print('nhi hua retrieval hogayaa');
            //               },
            //               color: Colors.grey,
            //               icon: Icon(FontAwesomeIcons.solidThumbsDown),
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            //     itemCount: snapshot.hasData ? snapshot.data.documents.length : 0 ,
            //     keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            //   );
            // } else{
            //   return Container(child: Center(child: Text('No Trainer Data'),),);
            // }
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
                        Center(
                          child: Text('List of Trainers',style: TextStyle(
                            fontSize: 30,fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),
                        ),
                        SizedBox(height:15),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                          child: Text('Click below to view trainer\'s profile',textAlign:TextAlign.left,style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          ),
                        ),
                        SizedBox(height:15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                "    1 Month   :- Rs 6,300" ,textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "3 Months :- Rs 16,300" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "6 Months :- Rs 30,300" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:10),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 500,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                // color: Colors.black,
                                color: Colors.white,
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
                                final String achievement = snapshot.data.documents[index]['achievements'];
                                final String certification = snapshot.data.documents[index]['certifications'];
                                final String specialization = snapshot.data.documents[index]['specialization'];
                                final profilepic = snapshot.data.documents[index]['maleprofiletrainer'];
                                final exp = snapshot.data.documents[index]['experience'];
                                final String doc = snapshot.data.documents[index]['date of certifications'];
                                final price1 = '6,300' ;
                                final price2 = '16,300' ;
                                final price3 = '30,300' ;
                                return exp == '2+ Years' ? Card(
                                  child: ListTile(
                                    onTap: (){
                                      print('trainer\'s profile');
                                      Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) => SuperTransformation1(name,achievement,certification,specialization,exp,profilepic,doc,price1,price2,price3)),
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
                                                image: NetworkImage(snapshot.data.documents[index]['maleprofiletrainer']),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            )
                                        )
                                    ),
                                    title: Text(name),
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
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     primary: Colors.black,
                        //     onPrimary: Color(0xffffc400),
                        //     shape: new RoundedRectangleBorder(
                        //       borderRadius: new BorderRadius.circular(50.0),
                        //     ),),
                        //   child: Text('Payments'),
                        //   onPressed: (){ Navigator.push(
                        //     context, MaterialPageRoute(
                        //       builder: (context) => RazorpayPayment()),
                        //   );},),
                        // ElevatedButton(
                        //   style : ElevatedButton.styleFrom(
                        //     primary: Colors.black,
                        //     onPrimary: Color(0xffffc400),
                        //     shape: new RoundedRectangleBorder(
                        //       borderRadius: new BorderRadius.circular(50.0),
                        //     ),),
                        //   child: Text('Sessions'),
                        //   onPressed: (){
                        //     Navigator.push(
                        //       context, MaterialPageRoute(
                        //         builder: (context) => TrainingDetailsScreen()),
                        //     );},
                        // ),
                      ],
                    ),
                  ),
                )
            );
          }
      ),
    );
      }
    }
