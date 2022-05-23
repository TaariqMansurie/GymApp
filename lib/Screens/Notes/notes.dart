import 'package:GymApp/Screens/Notes/AddNotes.dart';
import 'package:GymApp/Screens/Notes/EditNotes.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
//  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;

    final ref = Firestore.instance
        .collection('users')
        .document(uid)
        .collection('notes');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddNotes()));
        },
        child: Icon(
          Icons.event_note,
          color: Color(0xffFFC400),
        ),
        backgroundColor: Colors.black,
      ),
      appBar: new AppBar(
        // leading: Icon(Icons.menu),
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: new Text(" Log Book ",style: TextStyle(
          color: Color(0xffFFC400)
        ),),
        iconTheme: IconThemeData(
          color: Color(0xffFFC400)
        ),
        automaticallyImplyLeading: true,
      ),
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (_, index) {
                return InkWell(
                  //koi bhi notes pe tap karenge toh voh particular note ke andar jaayenge hum edit karne
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditNote(
                          docToEdit: snapshot.data.documents[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffc400),
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        //title aur content dikhega bahar se gridview mein koi bhi notes ka
                        Text(snapshot.data.documents[index].data['title'],style: TextStyle(color: Colors.black),),
                        Text(snapshot.data.documents[index].data['content'],style: TextStyle(color: Colors.black),),
                        Text(snapshot.data.documents[index].data['content1'],style: TextStyle(color: Colors.black),),
                        Text(snapshot.data.documents[index].data['content2'],style: TextStyle(color: Colors.black),),
                        Text(snapshot.data.documents[index].data['content3'],style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  ),
                );
              },
              itemCount: snapshot.hasData ? snapshot.data.documents.length : 0,
            );
          }),
    );
  }
}
