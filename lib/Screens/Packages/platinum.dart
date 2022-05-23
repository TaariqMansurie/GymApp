import 'package:GymApp/Screens/Transformations/transformation33.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlatinumPackagee extends StatelessWidget {

  CollectionReference ref = Firestore.instance
      .collection('approvedMT');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        // leading: Icon(Icons.menu),
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: new Text(" Platinum Package ",style: TextStyle(
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
                            "     1 Month   :- Rs 10,300" ,textAlign: TextAlign.center,
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
                            "3 Months :- Rs 28,300" ,
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
                            "6 Months :- Rs 52,300" ,
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
                          child: ListView.builder(itemBuilder: (context, index) {
                            final String name = snapshot.data.documents[index]['first Name'];
                            final exp = snapshot.data.documents[index]['experience'];
                            final String achievement = snapshot.data.documents[index]['achievements'];
                            final String certification = snapshot.data.documents[index]['certifications'];
                            final String specialization = snapshot.data.documents[index]['specialization'];
                            final String profilepic = snapshot.data.documents[index]['maleprofiletrainer'];
                            final String doc = snapshot.data.documents[index]['date of certifications'];
                            final price1 = '10300';
                            final price2 = '28300';
                            final price3 = '52300';
                            return exp == '8+ Years' ? Card(
                              child: ListTile(
                                onTap: (){
                                  print('trainer\'s profile');
                                  Navigator.push(
                                    context, MaterialPageRoute(
                                      builder: (context) => SuperTransformation33(name,achievement,certification,specialization,exp,profilepic,doc,price1,price2,price3)),
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
    );
  }
}
