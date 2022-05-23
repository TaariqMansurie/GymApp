import 'package:GymApp/Screens/big_image_wall.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ImageDisplay extends StatefulWidget {
  String uid;

  ImageDisplay({this.uid});
  @override
  _ImageDisplayState createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  List<String> values = [];
  DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
              color: Color(0xffffc400)
          ),
          title: Text('Image Wall',style: TextStyle(
              color: Color(0xffffc400)),
          ),
        ),
        body: Container(
            child: StreamBuilder<DocumentSnapshot>(
                stream: Firestore.instance
                    .collection('admins')
                    .document('1TilCrxUBPfuXZiAtWUkN26fGRe2')
                    .snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.hasData);
                    print(snapshot.data['aName']);
                   // String userName = snapshot.data['aName'];
                    //String email = snapshot.data['aEmail'];
                    var image_pic_url = snapshot.data['image_photo_url'];
                    print({image_pic_url});
                    //TODOo yahape item count jab 0 hoga tab sahi karna hain item count
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Card(
                              elevation: 10,
                              child: Center(
                                child: InkWell(
                                  onTap:() {
                                    Navigator.push(
                                    context, MaterialPageRoute(builder : (context) => BigImageWall(image_pic_url[index])),
                                     );
                                    },
                                  child: Image.network(
                                      image_pic_url[index] ?? values[index]),
                                ),
                              )),
                        );
                      },

                      itemCount: image_pic_url.length  == null ? 0 : image_pic_url.length );

                       // itemCount : (image_pic_url != null)
                       //      ? image_pic_url.length
                       //      : Image.network('https://i.imgur.com/sUFH1Aq.png'));

                      // itemCount: image_pic_url.length == null
                      //     ? 0
                      //     : image_pic_url.length,
                //    );

                  } else {
                    return Container();
                  }
                })));
  }
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
}
