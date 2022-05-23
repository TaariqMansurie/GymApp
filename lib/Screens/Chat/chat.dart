
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final String chatRoomId;

  Chat({this.chatRoomId});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();
  Stream chatRooms;
  final _controller = ScrollController();

  Widget chatMessages() {
    // we need to use realtime message updations in order to diplay correctly , for that we will be using streams

    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          // reverse: true,
             shrinkWrap: true,scrollDirection: Axis.vertical,
             controller: _controller, 
            // scrollDirection: Axis.vertical,
            itemCount: snapshot.data.documents.length,
             itemBuilder: (context, index) {
               //_controller.jumpTo(_controller.position.maxScrollExtent);
              // _controller.animateTo(
              //   _controller.position.maxScrollExtent,
              //   duration: Duration(seconds: 1),
              //   curve: Curves.fastOutSlowIn,
              // );
              return MessageTile(
                message: snapshot.data.documents[index].data["message"],
                sendByMe: Constants.myName ==
                    snapshot.data.documents[index].data["sendBy"],
              );
            })
            : Container();
      },
    );
  }

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": Constants.myName,
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
      };

      DatabaseMethods().addMessage(widget.chatRoomId, chatMessageMap);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  @override
  void initState() {
    DatabaseMethods().getChats(widget.chatRoomId).then((val) {
      setState(() {
        chats = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String todo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Color(0xffffc400)
        ),
        title: Text(todo,style: TextStyle(color: Color(0xffffc400)),),
      ),
      body: Container(
        color: Colors.yellow[100],
        child: Stack(
          children: [
            chatMessages(),
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.158,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                color: Colors.black,
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: messageEditingController,cursorColor: Color(0xffffc400),
                          style: simpleTextStyle2(),
                          decoration: InputDecoration(
                              hintText: 'Type your Message over here ...',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              border: InputBorder.none),
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        addMessage();
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Color(0xffffc400),
                              borderRadius: BorderRadius.circular(40)),
                          padding: EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/icons/send.png',
                            height: 25,
                            width: 25,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;

  MessageTile({@required this.message, @required this.sendByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8, bottom: 8, left: sendByMe ? 0 : 24, right: sendByMe ? 24 : 0),
      width: MediaQuery.of(context).size.width,
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
          margin:
          sendByMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
          padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: sendByMe
                ? BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(23))
                : BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomRight: Radius.circular(23)),
                color: sendByMe ? Colors.black : Color(0xffffc400)
      ),
      child: Text(message,
          textAlign: TextAlign.start,
          style: TextStyle(
              color: sendByMe ? Colors.white : Colors.black87,
              fontSize: 16,
              fontFamily: 'OverpassRegular',
              fontWeight: FontWeight.w300)),
    ),
    );
  }
}
