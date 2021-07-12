import 'package:GymApp/Screens/trainerApprovals.dart';
import 'package:GymApp/shared/users.dart';
import 'package:GymApp/userProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class UserNavigationDrawer extends StatelessWidget {
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
                width: MediaQuery.of(context).size.width * 0.8,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.deepPurple[100],
                  ),
                  child: Drawer(
                    child: Column(
                      // padding:EdgeInsets.zero,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        DrawerHeader(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple[400],
                                Colors.deepPurple[800]
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          // child : Padding (
                          //  padding : EdgeInsets.all(6),
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                    child: Text(''),
                                    backgroundImage: profile_pic_url == null
                                        ? AssetImage('assets/apple.png')
                                        : NetworkImage(profile_pic_url),
                                  ),
                                ),
                                SizedBox(height: 15),
                                InkWell(
                                  child: Text(
                                    userName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black), //TextStyle
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder : (context) => Profile()),
                                    );
                                  },
                                ),
                                SizedBox(height: 3),
                                InkWell(
                                  child: Text(
                                    email,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12), //TextStyle
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder : (context) => Profile()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          // ),
                        ),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          hoverColor: Colors.blue[200],
                          focusColor: Colors.blue[200],
                          onTap: () {
                            Navigator.push(
                              context, MaterialPageRoute(builder : (context) => Profile()),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text(
                            'Approvals',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder : (context) => TrainerApprovals()),
                            );
                          },
                        ),
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
                  ),
                ));
          } else {
            return Container();
          }
        },
      ),
    )
        : Container(
      child: Center(child: Text('my name is taariq')),
    );
  }
}

