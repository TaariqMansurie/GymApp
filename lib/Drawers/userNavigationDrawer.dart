import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class  UserNavigationDrawer extends StatelessWidget {
  DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;
    print(uid);
    return uid.isNotEmpty
        ? Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('users')
            .document(uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.hasData);
            print(snapshot.data['userName']);
            String userName = snapshot.data['userName'];
            String email = snapshot.data['userEmail'];
            String profile_pic_url = snapshot.data['profile_photo_url'];
            print({profile_pic_url});
            return SizedBox(
                width:  MediaQuery.of(context).size.width*0.8,

                child:Drawer(

                  child:ListView(
                    padding:EdgeInsets.zero,
                    // crossAxisAlignment: CrossAxisAlignment.stretch ,
                    children: <Widget>[
                      DrawerHeader(

                        decoration: BoxDecoration (
                          color: Colors.deepPurple[500],

                        ),
                        // child : Padding (
                        //  padding : EdgeInsets.all(6),

                        child : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container (
                              width : 60,
                              height : 60,
                              child :CircleAvatar(
                                child: Text(''),
                                backgroundImage: profile_pic_url == null
                                    ? AssetImage('assets/search.png')
                                    : NetworkImage(profile_pic_url),
                              ),
                            ),

                            SizedBox(height :15),
                            InkWell(
                              child: Text (
                                userName,
                                style : TextStyle(
                                    fontSize : 16 ,
                                    fontWeight: FontWeight.w600 ,
                                    color : Colors.black
                                ), //TextStyle
                              ),
                              onTap: (){
                                // Navigator.push(
                                //   context, MaterialPageRoute(builder : (context) => Profile()),
                              //  );
                              },
                            ),
                            SizedBox (height : 3),
                            InkWell(
                              child: Text(
                                email,
                                style : TextStyle (
                                    color : Colors.black ,
                                    fontSize : 12
                                ),//TextStyle
                              ),
                              onTap: (){
                                // Navigator.push(
                                //   context, MaterialPageRoute(builder : (context) => Profile()),
                               // );
                              },
                            ),
                          ],
                        ),
                        // ),
                      ),

                      ListTile(
                        leading : Icon(Icons.person),
                        title: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize : 18,
                          ),
                        ),
                        hoverColor: Colors.blue[200],
                        focusColor: Colors.blue[200],
                        onTap: (){
                          // Navigator.push(
                          //   context, MaterialPageRoute(builder : (context) => Profile()),
                          //);
                        },
                      ),

                      ListTile(
                        leading : Icon(Icons.settings),
                        title: Text(
                          'Settings',
                          style: TextStyle(
                            fontSize : 18,
                          ),
                        ),
                        onTap : null,
                      ),

                      // ListTile(
                      // leading : Icon(Icons.plus_one),
                      // title: Text(
                      //   'Add Account',
                      //    style: TextStyle(
                      //      fontSize : 18,
                      //      ),
                      //      ),
                      // onTap : null,
                      // ),

                      ListTile(
                        leading: Icon(Icons.stars),
                        title: Text(
                          'Rate Us',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onTap: null,
                      ),
                    ],
                  ),
                ));
          } else {
            return Container();
          }
        },
      ),
    )
        :Container();
  }
}
