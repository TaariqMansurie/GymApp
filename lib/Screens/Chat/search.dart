import 'package:GymApp/Screens/Chat/chat.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  DatabaseMethods databaseMethods = new DatabaseMethods();

  TextEditingController searchEditingController = new TextEditingController();
  QuerySnapshot searchResultSnapshot;

  bool isLoading = false;
  bool haveUserSearched = false;

  initiateSearch() async {
    print(searchEditingController.text);
    if (searchEditingController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      await databaseMethods
          .searchByName(searchEditingController.text)
          .then((snapshot) {
        searchResultSnapshot = snapshot;
        print(searchResultSnapshot.documents);
        setState(() {
          isLoading = false;
          haveUserSearched = true;
        });
      });
    }
  }

  //// create chatroom , send user to conversation screen ,push replacement
  Widget userList() {
    return haveUserSearched
        ? ListView.builder(
        shrinkWrap: true,
        itemCount: searchResultSnapshot.documents.length,
        itemBuilder: (context, index) {
          return userTile(
            searchResultSnapshot.documents[index].data['aName'],
            searchResultSnapshot.documents[index].data['aEmail'],
          );
        })
        : Container();
  }
  // the target is to save the data.. when the user logs in we have this email id  and we want to store it locally on our phone which can  be accessed later on ..
  /// 1.create a chatroom, send user to   chatroom, other userdetails

  sendMessageToUser({String userName}) {
    if (userName != Constants.myName) {

      String chatRoomId = getChatRoomId(
          userName,
          Constants.myName
      );
      List<String> users = [  Constants.myName, userName];
      var chatRoomMap = <String, dynamic>{
        'users': users,
        'chatRoomId': chatRoomId,
      };
      databaseMethods.addChatRoom(chatRoomMap, chatRoomId );
      print(chatRoomId);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Chat(
                chatRoomId: chatRoomId,
              )));
    }else{
      print('you cannot send a message to yourself !');
    }
    //String chatRoomId = getChatRoomId( Constants.myName, userName);

    //chatroom is also created successfully just on initiating the search

    // return Container();
  }

  Widget userTile(String userName, String userEmail) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Text(
                    userName,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                if(userName != null){
                  Fluttertoast.showToast(msg: 'Go back to chat section, chat already created !',backgroundColor: Colors.black,textColor: Color(0xffffc400),);
                }
                else{
                  Fluttertoast.showToast(msg: 'NO USERNAME',backgroundColor: Colors.black,textColor: Color(0xffffc400),);
                }
                //
                // }else {
                //   print('null hain username');
                //   return Fluttertoast.showToast(
                //       msg: 'kindly please try again !',
                //       toastLength: Toast.LENGTH_SHORT,
                //       gravity: ToastGravity.CENTER,
                //       backgroundColor: Colors.black,
                //       textColor: Colors.white);
                // }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(24)),
                child: Text(
                  'Message',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return '$b\_$a';
    } else {
      return '$a\_$b';
    }
  } // after this he deleted the chatroom to restore it using the code

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Chat'),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Color(0xffffc400)
        ),
      ),
      body: isLoading
          ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
          : Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: Color(0x54FFFFFF),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.black12,

                      child: TextField(
                        controller: searchEditingController,
                        style: simpleTextStyle(),
                        decoration: InputDecoration(
                            hintText: '     search username Asif Shaikh...',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                    },
                    child: Card(
                      color: Colors.black12,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0x36FFFFFF),
                                    const Color(0x0FFFFFFF)
                                  ],
                                  begin: FractionalOffset.topLeft,
                                  end: FractionalOffset.bottomRight),
                              borderRadius: BorderRadius.circular(40)),
                          padding: EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/icons/search.png',
                            height: 25,
                            width: 25,
                          )),
                    ),
                  )
                ],
              ),
            ),
            userList()
          ],
        ),
      ),
    );
  }
}


