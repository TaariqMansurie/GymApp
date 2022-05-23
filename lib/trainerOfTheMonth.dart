import 'package:GymApp/Screens/Transformations/transformation1.dart';
import 'package:GymApp/Screens/Transformations/transformation7.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TOTM extends StatelessWidget {
  CollectionReference ref = Firestore.instance
      .collection('trainer_of_the_month');
  ScrollController _controller ;
  ScrollController _controller2 ;
  ScrollController _controller3 ;
  ScrollController _controller4 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        // leading: Icon(Icons.menu),
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: new Text(" TOTM ",style: TextStyle(
            color: Color(0xffFFC400)
        ),),
        iconTheme: IconThemeData(
            color: Color(0xffFFC400)
        ),
        automaticallyImplyLeading: true,
      ),
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
                        //silver
                        Center(
                          child: Text(
                            "Star Trainer Of The Month",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.w900),
                          )
                        ),
                        SizedBox(height:15),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                          child: Text('Click below to view trainer\'s profile',textAlign:TextAlign.left,style: TextStyle(
                            fontSize: 15,fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          ),
                        ),
                        SizedBox(height:15),
                        Center(
                          child: Text(
                            "Silver",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.w900),
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                "1 Month   :- Rs 6,300" ,textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w800,fontSize: 13),
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
                                    .copyWith(fontWeight: FontWeight.w800,fontSize: 13),
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
                                    .copyWith(fontWeight: FontWeight.w800,fontSize: 13),
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
                               // border: Border.all(color: Colors.black)
                            ),
                            child: Scrollbar(
                              controller: _controller2,
                              interactive: true,
                              thickness: 7,
                              showTrackOnHover: true,
                              isAlwaysShown: true,
                              radius: Radius.circular(20),
                              child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) {
                                final String name = snapshot.data.documents[index]['first Name'];
                                final exp = snapshot.data.documents[index]['experience'];
                                final String achievement = snapshot.data.documents[index]['achievements'];
                                final String certification = snapshot.data.documents[index]['certifications'];
                                final String specialization = snapshot.data.documents[index]['specialization'];
                                final String profilepic = snapshot.data.documents[index]['starTrainerProfileMale'];
                                final String doc = snapshot.data.documents[index]['date of certifications'];
                                final String gender =  snapshot.data.documents[index]['Gender'] ;
                                return exp == '2+ Years' && gender == 'MALE'? Card(
                                  child: ListTile(
                                    onTap: (){
                                      print('trainer\'s profile');
                                      Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) => SuperTransformation7(name,achievement,certification,specialization,exp,profilepic,doc)),
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
                                                image: NetworkImage(profilepic),
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

                        //gold
                        SizedBox(height:15),
                        Center(
                          child: Text(
                            "Gold",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.w900),
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                "1 Month   :- Rs 8,300" ,textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w800,fontSize: 13),
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
                                "3 Months :- Rs 22,300" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w800,fontSize: 13),
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
                                "6 Months :- Rs 42,300" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w800,fontSize: 13),
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
                              //  border: Border.all(color: Colors.black)
                            ),
                            child: Scrollbar(
                              controller: _controller3,
                              interactive: true,
                              thickness: 7,
                              showTrackOnHover: true,
                              isAlwaysShown: true,
                              radius: Radius.circular(20),
                              child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) {
                                final String name = snapshot.data.documents[index]['first Name'];
                                final exp = snapshot.data.documents[index]['experience'];
                                final String achievement = snapshot.data.documents[index]['achievements'];
                                final String certification = snapshot.data.documents[index]['certifications'];
                                final String specialization = snapshot.data.documents[index]['specialization'];
                                final String profilepic = snapshot.data.documents[index]['starTrainerProfileMale'];
                                final String doc = snapshot.data.documents[index]['date of certifications'];
                                final String gender =  snapshot.data.documents[index]['Gender'] ;
                                return exp == '4+ Years' && gender == 'MALE' ? Card(
                                  child: ListTile(
                                    onTap: (){
                                      print('trainer\'s profile');
                                      Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) => SuperTransformation7(name,achievement,certification,specialization,exp,profilepic,doc)),
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
                                                image: NetworkImage(profilepic),
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

                        //platinum
                        SizedBox(height:15),
                        Center(
                          child: Text(
                            "Platinum",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.w900),
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "1 Month   :- Rs 10,300" ,textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w800,fontSize: 13),
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
                                "3 Months :- Rs 28,300" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w800,fontSize: 13),
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
                                "6 Months :- Rs 58,300" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w800,fontSize: 13),
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
                                //border: Border.all(color: Colors.black)
                            ),
                            child: Scrollbar(
                              controller: _controller4,
                              interactive: true,
                              thickness: 7,
                              showTrackOnHover: true,
                              isAlwaysShown: true,
                              radius: Radius.circular(20),
                              child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) {
                                final String name = snapshot.data.documents[index]['first Name'];
                                final exp = snapshot.data.documents[index]['experience'];
                                final String achievement = snapshot.data.documents[index]['achievements'];
                                final String certification = snapshot.data.documents[index]['certifications'];
                                final String specialization = snapshot.data.documents[index]['specialization'];
                                final String profilepic = snapshot.data.documents[index]['starTrainerProfileMale'];
                                final String doc = snapshot.data.documents[index]['date of certifications'];
                                final String gender =  snapshot.data.documents[index]['Gender'] ;
                                return exp == '8+ Years' && gender == 'MALE'? Card(
                                  child: ListTile(
                                    onTap: (){
                                      print('trainer\'s profile');
                                      Navigator.push(
                                        context, MaterialPageRoute(
                                          builder: (context) => SuperTransformation7(name,achievement,certification,specialization,exp,profilepic,doc)),
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
                                                image: NetworkImage(profilepic),
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
                        //   child: Text('Confirm'),
                        //   onPressed: (){ Navigator.push(
                        //     context, MaterialPageRoute(
                        //       builder: (context) => RazorpayPayment(packageType,packageDuration)),
                        //   );},),
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