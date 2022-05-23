import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Screens/Transformations/transformation7.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainersList extends StatefulWidget {
  const TrainersList({Key key}) : super(key: key);

  @override
  _TrainersListState createState() => _TrainersListState();
}

class _TrainersListState extends State<TrainersList> {

  CollectionReference ref = Firestore.instance
      .collection('approvedMT');

  CollectionReference reff = Firestore.instance
      .collection('approvedFT');
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
      drawer: UserNavigationDrawer(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          Text(
                            "1 Month :- Rs 6000" ,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              "3 Months :- Rs 16,000" ,
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
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              "6 Months :- Rs 30,000" ,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.45,
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
                              final String achievement = snapshot.data.documents[index]['achievements'];
                              final String certification = snapshot.data.documents[index]['certifications'];
                              final String specialization = snapshot.data.documents[index]['specialization'];
                              final exp = snapshot.data.documents[index]['experience'];
                              final String profilepic = snapshot.data.documents[index]['maleprofiletrainer'];
                              final String doc = snapshot.data.documents[index]['date of certifications'];
                              return exp == '2+ Years' ? Card(
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
                                              image: NetworkImage(snapshot.data.documents[index]['maleprofiletrainer']),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )
                                      )
                                  ),
                                  title: Text(name),
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

                      SizedBox(height: 25,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,50,0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Gold Package" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          Text(
                            "1 Month :- Rs 8000" ,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              "3 Months :- Rs 22,000" ,
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
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              "6 Months :- Rs 42,000" ,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.45,
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
                              final String achievement = snapshot.data.documents[index]['achievements'];
                              final String certification = snapshot.data.documents[index]['certifications'];
                              final String specialization = snapshot.data.documents[index]['specialization'];
                              final exp = snapshot.data.documents[index]['experience'];
                              final String profilepic = snapshot.data.documents[index]['maleprofiletrainer'];
                              final String doc = snapshot.data.documents[index]['date of certifications'];
                              return exp == '4+ Years' ? Card(
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
                        ),
                      ),

                      SizedBox(height: 25,),

                      //platinum package trainers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,0,0),
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
                          Text(
                            "1 Month :- Rs 10,000" ,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              "3 Months :- Rs 28,000" ,
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
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              "6 Months :- Rs 58,000" ,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.45,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.black,
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
                              final String achievement = snapshot.data.documents[index]['achievements'];
                              final String certification = snapshot.data.documents[index]['certifications'];
                              final String specialization = snapshot.data.documents[index]['specialization'];
                              final exp = snapshot.data.documents[index]['experience'];
                              final String profilepic = snapshot.data.documents[index]['maleprofiletrainer'];
                              final String doc = snapshot.data.documents[index]['date of certifications'];
                              return exp == '8+ Years' ? Card(
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
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
