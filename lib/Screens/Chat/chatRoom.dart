import 'dart:async';
import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Screens/Chat/chat.dart';
import 'package:GymApp/Screens/Chat/search.dart';
import 'package:GymApp/Screens/home.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/helper/helper_functions.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  Stream chatRooms; //deleting rhe chat rooms from both the sides
  DatabaseMethods databaseMethods = new DatabaseMethods();
  final AuthService _auth = AuthService();


  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ChatRoomsTile(
                userName: snapshot.data.documents[index].data['chatRoomId']
                    .toString()
                   // .split('_')[1],
                .replaceAll("_",'')
                  .replaceAll(Constants.myName, ""),
                chatRoomId:
                snapshot.data.documents[index].data["chatRoomId"],
              );
            })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfogetChats();
    super.initState();
  }

  getUserInfogetChats() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    DatabaseMethods().getUserChats(Constants.myName).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            'we got the data + ${chatRooms.toString()} this is name  ${Constants.myName}');
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserNavigationDrawer(),
      appBar: new AppBar(
        title: Text(
          'Ask An Expert',
          style: TextStyle(
            color: Color(0xffffc400)
           ),
          ),
        actions: <Widget>[
          TextButton(
            child: Text('Logout',style: TextStyle(color: Color(0xffffc400),),),
            onPressed: () {
              _alertDialog();
            },
            style:TextButton.styleFrom(
                backgroundColor: Colors.black
            ),
          ),
        ],
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: chatRoomsList(),
      ),
      //search button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search,color: Color(0xffffc400),),
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search()));
        },
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
            title: Text("Logout"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                color: Colors.black
            ),
            content: Text(
                "Are you sure you want to logout ?"),
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
                  Timer(
                      Duration(seconds: 4),
                          () {
                        Fluttertoast.showToast(
                            msg: 'Logged out Successfully',
                            backgroundColor: Color(0xffffc400),
                            textColor: Colors.black,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR
                        );
                        Container(child: Center(child: CircularProgressIndicator(color: Color(0xffffc400),backgroundColor: Colors.black,),),);
                        _auth.signOut();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      });
                },
              ),
            ],
          );
        }
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({this.userName, @required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Chat(
                chatRoomId: chatRoomId,
                //userName : userName ,
              ),
              settings: RouteSettings(arguments: userName), //arguments voh isliye dalaa hain coz appbar pe name chahiye tha na user ka saamne vaale ka isliye.
            ));
      },

      //chat room list of contacts whom you are talking to..

      child: Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.black, //initials of username in circle
                  borderRadius: BorderRadius.circular(30)),

              //initials of chatperson
              child: Text(userName.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xffffc400),
                      fontSize: 16,
                      fontFamily: 'OverpassRegular',
                      fontWeight: FontWeight.w300)),
            ),

            //username font
            SizedBox(
              width: 12,
            ),

            Text(
              userName,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'OverpassRegular',
                  fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          );
        }
      }
