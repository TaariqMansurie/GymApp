import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class SendingMail extends StatefulWidget {
  const SendingMail({Key key}) : super(key: key);

  @override
  _SendingMailState createState() => _SendingMailState();
}

class _SendingMailState extends State<SendingMail> {
  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController();

  final _subjectController = TextEditingController();

  final _bodyController = TextEditingController(
    // StreamBuilder(
    // builder: (BuildContext context, AsyncSnapshot snapshot),
    // stream: Firestore.instance
    //     .collection('users')
    //     .document(uid)
    //     .get(),
    // ),
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;
    //String listOfTasks ;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Share Via Email'),
        actions: <Widget>[
          IconButton(
            onPressed: send,
            icon: Icon(Icons.send),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _recipientController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Recipient',
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _subjectController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Subject',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _bodyController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                    labelText: 'Body', border: OutlineInputBorder()),
              ),
            ),
          ),
          CheckboxListTile(
            contentPadding:
            EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            title: Text('HTML'),
            onChanged: (bool value) {
              setState(() {
                isHTML = value;
              });
            },
            value: isHTML,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Wrap(
              children: <Widget>[
                for (var i = 0; i < attachments.length; i++)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                          flex: 0,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: 100,
                            height: 100,
                            child: Image.file(File(attachments[i]),
                                fit: BoxFit.cover),
                          )),
                      IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () => {null},
                      )
                    ],
                  ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: null,
                  ),
                ),
              ],
            ),
          ),
          //       final _bodyController = TextEditingController(
          // StreamBuilder(
          // builder: (BuildContext context, AsyncSnapshot snapshot),
          // stream: Firestore.instance
          //     .collection('users')
          //     .document(uid)
          //     .get(),
          // ),
        ],
      ),
    );
  }
}
