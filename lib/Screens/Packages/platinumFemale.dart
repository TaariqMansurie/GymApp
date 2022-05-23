import 'package:GymApp/Screens/Transformations/transformation222.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlatinumFemale extends StatelessWidget {
  CollectionReference ref = Firestore.instance
      .collection('approvedFT');
  ScrollController _controller ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: new Text(" Platinum Female Package ",style: TextStyle(
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
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "    1 Month   :- Rs 8,300" ,textAlign: TextAlign.center,
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
                    SizedBox(height:10),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.black,
                              color: Colors.white,
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
                              final exp = snapshot.data.documents[index]['experience'];
                              final String achievement = snapshot.data.documents[index]['achievements'];
                              final String certification = snapshot.data.documents[index]['certifications'];
                              final String specialization = snapshot.data.documents[index]['specialization'];
                              final String profilepic = snapshot.data.documents[index]['femaleprofiletrainer'];
                              final String doc = snapshot.data.documents[index]['dateofcertifications'];
                              final price1 = '8300';
                              final price2 = '22300' ;
                              final price3 = '42300' ;
                              return exp == '3+ Years' ? Card(
                                child: ListTile(
                                  onTap: (){
                                    print('trainer\'s profile');
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) => SuperTransformation222(name,achievement,certification,specialization,exp,profilepic,doc,price1,price2,price3)),
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
                    ),
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
                  ],
                )
            );
          }
      ),
    );  }
}
