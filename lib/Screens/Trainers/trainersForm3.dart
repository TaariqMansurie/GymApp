//female trainers ka form hain yeh

import 'dart:async';
import 'dart:io';

import 'package:GymApp/Services/database.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'afterFormSubmission.dart';

class TrainersForm3 extends StatefulWidget {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var certifications = TextEditingController();
  var specialization = TextEditingController();
  var achievements = TextEditingController();
  var contactNo = TextEditingController();


  var selectedGender = 'Female';

  var certificateSelectedDate = '09';
  var certificateSelectedMonth = '07';
  var certificateSelectedYear = '1999';


  TrainersForm3(this.firstName,this.lastName,
      this.selectedGender,this.contactNo,this.certifications,this.specialization,
      this.certificateSelectedDate,this.certificateSelectedMonth,
      this.certificateSelectedYear,this.achievements);

  @override
  _TrainersForm3State createState() => _TrainersForm3State();
}

class _TrainersForm3State extends State<TrainersForm3> {

  final List<String> femaleExperienceList = ['1+ Years', '3+ Years'];
  var femaleExperience = '1+ Years';
  DatabaseMethods db = DatabaseMethods();
  PickedFile imageFile;
  final ImagePicker _picker = new ImagePicker();
  bool isUploading = false ;


  DropdownButton<String> femaleExperienceDropdown() {
    List<DropdownMenuItem<String>> codes2 = [];
    for (String experience2 in femaleExperienceList) {
      codes2.add(
        DropdownMenuItem(
          child: Text(
            experience2,
            textAlign: TextAlign.center,
            style: GoogleFonts.ptSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF263238),
            ),
          ),
          value: experience2,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Color(0xFF263238),
      value: femaleExperience,
      items: codes2,
      onChanged: (value) {
        setState(
              () {
            femaleExperience = value.toString();
          },
        );
      },
    );
  }

  Widget bottomSheet(String uid,String uidd) {
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
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera, uid);
                  },
                  icon: Icon(Icons.camera),
                  label: Text('Camera')),
              TextButton.icon(
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
      imageFile = pickedFile;
    });
    DatabaseMethods().uploadFemaleTrainerProfile(uid, File(pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
    var uid = Provider.of<User>(context).uid;
    var uidd = Provider.of<User>(context).uidd;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    CollectionReference reff = Firestore.instance
        .collection('femaleTrainers');

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color:Color(0xffffc400)),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Experience',
                            style: GoogleFonts.rubik(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF263238),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/gifs/b.png'),
                      height: 141,
                      width: 126,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose your profile photo first :-',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Center(
                              child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: imageFile == null
                                      ? AssetImage('assets/icons/upload.png')
                                      : FileImage(File(imageFile.path))
                                // NetworkImage(
                                //     _imageFile.toString()), //(iska matlab yeh hain ki background image selected profile photo rahega gallery se liya hua and if voh nhi hua na toh normal default image rahega search.png valaa)
                              ),
                            ),
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
                                    builder: ((builder) => bottomSheet(uid,uidd)),
                                  );
                                },
                              ),
                              alignment: Alignment(0.015, 0.0),
                            ),
                            SizedBox(height: 20,),

                            Text(
                              'Experience',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: femaleExperienceDropdown(),
                                )),
                            SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42.0,
                          vertical: 10,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              Map<String, String> personalDetail = {
                                'Experience': femaleExperience.toString(),
                                'profile_pic_url_tf': purll.toString(),
                              };
                              print(femaleExperience);
                              print(personalDetail);
                              if(imageFile != null){
                                   reff.add({
                                     'First Name': widget.firstName.text.toString(),
                                     'Last Name': widget.lastName.text.toString(),
                                     'Gender': widget.selectedGender.toString(),
                                     'Contact No': widget.contactNo.text.toString(),
                                     'Certifications': widget.certifications.text.toString(),
                                     'Specialization':widget.specialization.text.toString(),
                                     'Date of Certifications' : widget.certificateSelectedDate +
                                         ' ' +
                                         widget.certificateSelectedMonth +
                                         ' ' +
                                         widget.certificateSelectedYear,
                                     'Achievements' : widget.achievements.text.toString(),
                                     'Experience' : femaleExperience.toString(),
                                     'profile_pic_url_tf': femaleTrainerUrl.toString(),
                                   }).
                                   whenComplete(() {
                                     imageFile != null ? Timer(
                                         Duration(seconds: 6),
                                             () {
                                           setState(() {
                                             isUploading = false ;
                                             Center(child : new CircularProgressIndicator(backgroundColor: Colors.black,)) ;
                                           });
                                           Fluttertoast.showToast(
                                               msg: 'Form Submitted Successfully ',
                                               backgroundColor: Color(0xffffc400),
                                               textColor: Colors.black,
                                               toastLength: Toast.LENGTH_LONG,
                                               gravity: ToastGravity.SNACKBAR
                                           );
                                           Navigator.pushReplacement(
                                               context,
                                               MaterialPageRoute(
                                                 builder: (context) => AfterTrainerFormSubmission(),
                                               ));}) : Center(child: CircularProgressIndicator(),) ;
                                 });
                              }else{
                              Fluttertoast.showToast(
                                msg: 'some error happened, kindly resend the form, Also check the profile picture',
                                backgroundColor: Colors.deepPurple[400],
                                textColor: Colors.black,
                                toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER
                              );
                            }
                          }},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF263238),
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: Text(
                              'Next',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
         //     Center(child: Image.asset('assets/meditation_bg.png')),
            ],
          ),
        ),
      ),
    );
  }
}
