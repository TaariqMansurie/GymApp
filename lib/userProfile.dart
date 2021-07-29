import 'package:GymApp/Services/database.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:provider/provider.dart';

List<CameraDescription> cameras;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;

  //final AuthService _auth = AuthService();

  PickedFile _imageFile;
  final ImagePicker _picker = new ImagePicker();
  DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;
    String uidd = Provider.of<User>(context).uidd;
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
                  String profilePicUrl = snapshot.data['profile_photo_url'];
                  print({profilePicUrl});

                  return Stack(
                    children: <Widget>[
                      ClipPath(
                        child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.deepPurple[400],
                                Colors.deepPurple[800],
                              ]),
                            ),),
                            //color: Colors.blue[800]),
                        clipper: getClipper(),
                      ),
                      Positioned(
                          width: 350.0,
                          top: MediaQuery.of(context).size.height / 5,
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 80.0,
                                backgroundImage: profilePicUrl == null
                                    ? AssetImage('assets/search.png')
                                    : NetworkImage(
                                        profilePicUrl), //(iska matlab yeh hain ki background image selected profile photo rahega gallery se liya hua and if voh nhi hua na toh normal default image rahega search.png valaa)
                              ),
                              //camera
                              Container(
                                child: InkWell(
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.teal,
                                    size: 28.0,
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: ((builder) => bottomSheet(uid)),
                                    );
                                  },
                                ),
                                alignment: Alignment(0.015, 0.0),
                              ),
                              Container(
                                  child: SizedBox(
                                height: 50.0,
                                width: double.infinity,
                               )
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  userName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),

                              SizedBox(height: 15.0), //email id
                              Text(
                                email,
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Montserrat'),
                              ),
                              SizedBox(height: 25.0), //edit name
                              Container(
                                  height: 30.0,
                                  width: 95.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.red[900],
                                    color: Colors.redAccent,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Center(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Montserrat'),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(height: 25.0), //logout
                            ],
                          ))
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        : Container();
  }

  Widget bottomSheet(String uid) {
    return Container(
      height: 100.0,
      // width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Choose a Profile Photo',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera, uid);
                  },
                  icon: Icon(Icons.camera),
                  label: Text('Camera')),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery, uid);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery'))
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source, String uid) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
    DatabaseMethods().uploadProfilePicToFirebase(uid, File(pickedFile.path));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
