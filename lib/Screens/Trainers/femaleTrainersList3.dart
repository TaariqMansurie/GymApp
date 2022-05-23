
import 'package:GymApp/Screens/Transformations/transformation2.dart';
import 'package:GymApp/Screens/Transformations/transformation66.dart';
import 'package:GymApp/Screens/Transformations/transformation8.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FemaleTrainersList3 extends StatefulWidget {
  const FemaleTrainersList3({Key key}) : super(key: key);

  @override
  _FemaleTrainersList3State createState() => _FemaleTrainersList3State();
}

class _FemaleTrainersList3State extends State<FemaleTrainersList3> {

  CollectionReference reff = Firestore.instance
      .collection('approvedFT');
  ScrollController _controller ;
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
      body: StreamBuilder<QuerySnapshot>(
          stream: reff.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Row(
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
                        Text(
                          "1 Month :- Rs 6,300" ,
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
                          padding: const EdgeInsets.only(right: 15),
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
                          controller: _controller,
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
                            final String profilepic = snapshot.data.documents[index]['femaleprofiletrainer'];
                            final String doc = snapshot.data.documents[index]['dateofcertifications'];
                            return exp == '1+ Years' ? Card(
                              child: ListTile(
                                onTap: (){
                                  print('trainer\'s profile');
                                  Navigator.push(
                                    context, MaterialPageRoute(
                                      builder: (context) => SuperTransformation8(name,achievement,certification,specialization,exp,profilepic,doc)),
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
                                            image: NetworkImage(snapshot.data.documents[index]['femaleprofiletrainer']),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        )
                                    )
                                ),
                                title: name.isNotEmpty ? Text(name): Text('No Trainer\'s data yet '),

                              ),
                            ) : Container(
                              height: 0,
                              width: 0,
                              color: Colors.blueGrey,
                            );
                          },
                            itemCount: snapshot.hasData ? snapshot.data.documents.length : Center(child: Text('No Trainer\'s data yet '),) ,
                            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25,),

                    //platinum package trainers
                    Row(
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
                        Text(
                          "1 Month :- Rs 8,300" ,
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
                            "3 Months :- Rs 22,300" ,
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
                            "6 Months :- Rs 42,300" ,
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
                        child: ListView.builder(itemBuilder: (context, index) {
                          final String name = snapshot.data.documents[index]['first Name'];
                          final String achievement = snapshot.data.documents[index]['achievements'];
                          final String certification = snapshot.data.documents[index]['certifications'];
                          final String specialization = snapshot.data.documents[index]['specialization'];
                          final exp = snapshot.data.documents[index]['experience'];
                          final String profilepic = snapshot.data.documents[index]['femaleprofiletrainer'];
                          final String doc = snapshot.data.documents[index]['dateofcertifications'];
                          return exp == '3+ Years' ? Card(
                            child: ListTile(
                              onTap: (){
                                print('trainer\'s profile');
                                Navigator.push(
                                  context, MaterialPageRoute(
                                    builder: (context) => SuperTransformation8(name,achievement,certification,specialization,exp,profilepic,doc)),
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
                                          image: NetworkImage(snapshot.data.documents[index]['femaleprofiletrainer']),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      )
                                  )
                              ),
                              title: Text(name.substring(0,2)),
                            ),
                          ) : Container(
                            height: 0,
                            width: 0,
                          );
                        },
                          itemCount: snapshot.hasData ? snapshot.data.documents.length : 0 ,
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                        ),
                      ),),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
