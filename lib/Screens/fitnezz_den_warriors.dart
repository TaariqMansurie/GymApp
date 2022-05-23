import 'dart:io';
import 'package:GymApp/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class FitnezzDenWarriors extends StatefulWidget {
  const FitnezzDenWarriors({Key key}) : super(key: key);

  @override
  _FitnezzDenWarriorsState createState() => _FitnezzDenWarriorsState();
}

class _FitnezzDenWarriorsState extends State<FitnezzDenWarriors> {
  final ImagePicker _picker = new ImagePicker();
  PickedFile _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Color(0xffffc400)
        ),
        title: Text('Fitnezz Den Warriors',style: TextStyle(
          color: Color(0xffffc400)
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add New Images',
        backgroundColor: Colors.black,
        elevation: 10.0,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: ((builder) => bottomSheet()),
          );
        },
        child: const Icon(FontAwesomeIcons.upload,color: Color(0xffffc400),),
      ),
    );
  }
  void takePhoto(ImageSource source) async {
    final pickedFilee = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFilee;
    });
    DatabaseMethods().uploadImagesToFirebase(File(pickedFilee.path)) ==
        null
        ? CircularProgressIndicator() //if it is null then show this
        : Fluttertoast.showToast(
        msg: "Image successfully uploaded !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black,
        textColor: Color(0xffffc400));
    // or else show this.
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      // width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Choose a Photo To Upload',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text('Camera')),
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery'))
            ],
          ),
        ],
      ),
    );
  }
}
