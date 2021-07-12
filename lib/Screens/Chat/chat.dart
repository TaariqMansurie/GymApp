import 'package:GymApp/Drawers/userNavigationDrawer.dart';
import 'package:GymApp/Screens/home.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:GymApp/Services/database.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({ Key  key }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Stream chatRooms; //deleting rhe chat rooms from both the sides
  AuthService _auth = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  //   Widget chatList() {
  //   return StreamBuilder(
  //     stream: _groups,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         if (snapshot.data['groups'] != null) {
  //           // print(snapshot.data['groups'].length);
  //           if (snapshot.data['groups'].length != 0) {
  //             return ListView.builder(
  //                 itemCount: snapshot.data['groups'].length,
  //                 shrinkWrap: true,
  //                 itemBuilder: (context, index) {
  //                   int reqIndex = snapshot.data['groups'].length - index - 1;
  //                   return GroupTile(
  //                       userName: snapshot.data['userName'],
  //                       groupId:
  //                           _destructureId(snapshot.data['groups'][reqIndex]),
  //                       groupName: _destructureName(
  //                           snapshot.data['groups'][reqIndex]));
  //                 });
  //           } else {
  //             return noMessageWidget();
  //           }
  //         } else {
  //           return noMessageWidget();
  //         }
  //       } else {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //     },
  //   );
  // }
    Widget chatList() {
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
                        .split('_')[1],
                    // .replaceAll("_",'')
                    //   .replaceAll(Constants.myName, ""),
                    chatRoomId:
                        snapshot.data.documents[index].data["chatRoomId"],
                  );
                })
            : noMessageWidget();
      },
    );
  }
   
     void _popupDialog(BuildContext context) {
       
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget startButton = FlatButton(
      child: Text("Start"),
      onPressed: () async {
        // if (_groupName != null) {
        //   await HelperFunctions.getUserNameSharedPreference().then((val) {
        //     DatabaseMethods(uid: _user.uid).createGroup(val, _groupName);
        //   });
        //   Navigator.of(context).pop();
        // }
      },
    );

    // Create groups ka dialog box

    AlertDialog alert = AlertDialog(
      title: Text("Start your Conversation"),
      content: Text('Do you want to start this conversation !? '),
      // content: TextField(
      //     onChanged: (val) {
      //      // _groupName = val;
      //     },
      //     style: TextStyle(fontSize: 15.0, height: 2.0, color: Colors.black)),
      actions: [
        cancelButton,
        startButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

   Widget noMessageWidget() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  _popupDialog(context);
                },
                child: Icon(Icons.add_circle,
                    color: Colors.deepPurple[400], size: 75.0)),
            SizedBox(height: 20.0),
            Text(
                "You've not yet messaged our expert, tap on the 'add' icon to start the conversation with our expert ! "),
          ],
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        elevation: 0.0,
        title: new Text(" Chats"),
        automaticallyImplyLeading: true,
        actions: [
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Groups()),
          //     );
          //   },
          //   child: Container(
          //       padding: EdgeInsets.symmetric(horizontal: 16),
          //       child: Icon(
          //         Icons.person_add,
          //         color: Colors.blue[900],
          //       )),
          // ),
          GestureDetector(
            onTap: () {
              AuthService().signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Home()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _popupDialog(context);
        },
        child: Icon(Icons.add, color: Colors.white, size: 30.0),
        backgroundColor: Colors.deepPurple[800],
        elevation: 0.0,
      ),
      body: chatList(),
      drawer: UserNavigationDrawer(),
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
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => Chat(
        //         chatRoomId: chatRoomId,
        //         //userName : userName ,
        //       ),
        //       settings: RouteSettings(arguments: userName),
        //     ));
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
                  color: Colors.blue[800], //initials of username in circle
                  borderRadius: BorderRadius.circular(30)),

              //initials of chatperson
              child: Text(userName.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
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