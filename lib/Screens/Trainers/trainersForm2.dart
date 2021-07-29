//male trainers ka form hain yeh

import 'dart:io';

import 'package:GymApp/Screens/Trainers/afterFormSubmission.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

Future uploadProfilePicToFirebaseMale(String uid,String uidd, File image) async {
  final ref = FirebaseStorage.instance
      .ref()
      .child('profile_pictures')
      .child(uid + '.jpg');

  var snapshot = await ref.putFile(image).onComplete;
  var downloadUrl = await snapshot.ref.getDownloadURL();
  print(downloadUrl);

  // Firestore.instance
  //     .collection("users")
  //     .document(uid)
  //     .collection('maleTrainers')
  //     .document(uid)
  //     .setData({'profile_pic_url_tm' : downloadUrl},merge: true);
  // .updateData({"profile_photo_url": downloadUrl});
  // .updateData();
}
class TrainersForm2 extends StatefulWidget {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var address = TextEditingController();
  var linkedin = TextEditingController();
  //var github = TextEditingController();
  var certifications = TextEditingController();
  // var doc = TextEditingController();
  var achievements = TextEditingController();

  var selectedGender = 'Female';
  var selectedDate = '06';
  var selectedMonth = '05';
  var selectedYear= '1998';

  var certificateSelectedDate = '09';
  var certificateSelectedMonth = '07';
  var certificateSelectedYear = '1999';

  // TrainersForm2(TextEditingController firstName, TextEditingController lastName, TextEditingController address,
  //     String selectedGender, String selectedDate, String selectedMonth, String selectedYear,
  //     TextEditingController linkedin, TextEditingController certifications,
  //     String certificateSelectedDate, String certificateSelectedMonth,
  //     String certificateSelectedYear, TextEditingController achievements);


  TrainersForm2(this.firstName,this.lastName,this.address,
      this.selectedGender,this.selectedDate,this.selectedMonth,
      this.selectedYear,this.linkedin,this.certifications,
      this.certificateSelectedDate,this.certificateSelectedMonth,
      this.certificateSelectedYear,this.achievements);

  @override
  _TrainersForm2State createState() => _TrainersForm2State();
}

class _TrainersForm2State extends State<TrainersForm2> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> maleExperienceList = ['2+ Years', '4+ Years', '8+ Years'];
  var maleExperience = '2+ Years';
  DatabaseMethods db = DatabaseMethods();
  PickedFile imageFile;
  final ImagePicker _picker = new ImagePicker();

  DropdownButton<String> maleExperienceDropdown() {
    List<DropdownMenuItem<String>> codes1 = [];
    for (String experience in maleExperienceList) {
      codes1.add(
        DropdownMenuItem(
          child: Text(
            experience,
            textAlign: TextAlign.center,
            style: GoogleFonts.ptSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF263238),
            ),
          ),
          value: experience,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Color(0xFF263238),
      value: maleExperience,
      items: codes1,
      onChanged: (value) {
        setState(
              () {
            maleExperience = value.toString();
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
      imageFile = pickedFile;
    });
    DatabaseMethods().uploadMaleTrainerProfile(uid, File(pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
    var uid = Provider.of<User>(context).uid;
    var uidd = Provider.of<User>(context).uidd;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    CollectionReference ref = Firestore.instance
        .collection('maleTrainers');

    // DocumentReference reffff = Firestore.instance
    //     .collection('users')
    //     .document(uid)
    //     .collection('maleTrainers')
    //     .document(uid);
    //
    // CollectionReference _users = Firestore.instance
    //     .collection('users')
    //     .document(uid)
    //     .collection('maleTrainers');
    //
    // DocumentReference reference = _users.document(uid);
    // CollectionReference reff = Firestore.instance
    //     .collection('users')
    //     .document(uid)
    //     .collection('femaleTrainers');

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
            ),
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
                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Image(
                             image: AssetImage('assets/Hide.png'),
                             height: 20,
                             width: 20,
                            ),
                          ],
                        ),
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
                image: AssetImage('assets/Chef.gif'),
                height: 141,
                width: 126,
                     ),
                  ],
                ),
              ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
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
                                  ? AssetImage('assets/apple.png')
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
                                  color: Color(0xffff5a5f),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: maleExperienceDropdown(),
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
                              // 'First Name': firstName.text.toString(),
                              // 'Last Name': lastName.text.toString(),
                              // 'Address': address.text.toString(),
                              // 'Gender': selectedGender.toString(),
                              // /*age*/'DOB': selectedDate +
                              //     ' ' +
                              //     selectedMonth +
                              //     ' ' +
                              //     selectedYear,
                              // 'Linkedin': linkedin.text.toString(),
                              // //'Github': github.text.toString(),
                              // 'Certifications': certifications.text.toString(),
                              // 'Date of Certifications' : certificateSelectedDate +
                              //     ' ' +
                              //     certificateSelectedMonth +
                              //     ' ' +
                              //     certificateSelectedYear,
                              // 'Achievements' : achievements.text.toString(),
                              'Experience': maleExperience.toString(),
                              'profile_pic_url_tm' : DatabaseMethods.urlll.toString(),
                            };
                            // if(selectedGender != 'Female'){
                            //   // db.addTrainerMaleInfo({
                            //   //   'First Name': firstName.text.toString(),
                            //   //   'Last Name': lastName.text.toString(),
                            //   //   'Address': address.text.toString(),
                            //   //   'Gender': selectedGender.toString(),
                            //   //   'DOB': selectedDate +
                            //   //       ' ' +
                            //   //       selectedMonth +
                            //   //       ' ' +
                            //   //       selectedYear,
                            //   //   'LinkedIn Profile':linkedin.text.toString(),
                            //   //   'Certifications': certifications.text.toString(),
                            //   //   'Date of Certifications' : certificateSelectedDate +
                            //   //       ' ' +
                            //   //       certificateSelectedMonth +
                            //   //       ' ' +
                            //   //       certificateSelectedYear,
                            //   //   'Achievements' : achievements.text.toString(),
                            //   // }, uid,uidd);
                            // }
                            // else {
                            //   // db.addTrainerFemaleInfo({
                            //   //   'First Name': firstName.text.toString(),
                            //   //   'Last Name': lastName.text.toString(),
                            //   //   'Address': address.text.toString(),
                            //   //   'Gender': selectedGender.toString(),
                            //   //   'DOB': selectedDate +
                            //   //       ' ' +
                            //   //       selectedMonth +
                            //   //       ' ' +
                            //   //       selectedYear,
                            //   //   'LinkedIn Profile':linkedin.text.toString(),
                            //   //   'Certifications': certifications.text.toString(),
                            //   //   'Date of Certifications' : certificateSelectedDate +
                            //   //       ' ' +
                            //   //       certificateSelectedMonth +
                            //   //       ' ' +
                            //   //       certificateSelectedYear,
                            //   //   'Achievements' : achievements.text.toString(),
                            //   // }, uid,uidd);
                            // }
                            print(maleExperience);
                            // if(selectedGender != 'Female'){
                            //   Navigator.push((context),
                            //       MaterialPageRoute(builder: (context){
                            //         return TrainersForm2();
                            //       }));
                            // }else {
                            //   Navigator.push((context),
                            //       MaterialPageRoute(builder: (context){
                            //         return TrainersForm3();
                            //       }));
                            // }
                            if( imageFile != null){
                              // db.addTrainerMaleInfo({
                              //   'Experience': maleExperience.toString(),
                              // }, uid, uidd);
                              //    reffff.updateData({
                              //      'Experience' : maleExperience.toString(),
                              //    }).whenComplete(() => print('Hogaya male trainer update firebase mein'));
                              //       reffff.setData({
                              //         'Experience' : maleExperience.toString(),
                              //       },merge: true).whenComplete(() => print('male data add ho rhaa hain firebase mein sahi se'));
                                ref.add({
                                  'First Name': widget.firstName.text.toString(),
                                    'Last Name': widget.lastName.text.toString(),
                                    'Address': widget.address.text.toString(),
                                    'Gender': widget.selectedGender.toString(),
                                    'DOB': widget.selectedDate +
                                        ' ' +
                                        widget.selectedMonth +
                                        ' ' +
                                        widget.selectedYear,
                                    'LinkedIn Profile':widget.linkedin.text.toString(),
                                    'Certifications': widget.certifications.text.toString(),
                                    'Date of Certifications' : widget.certificateSelectedDate +
                                        ' ' +
                                        widget.certificateSelectedMonth +
                                        ' ' +
                                        widget.certificateSelectedYear,
                                    'Achievements' : widget.achievements.text.toString(),
                                    'Experience' : maleExperience.toString(),
                                    'profile_pic_url_tm': purl.toString(),
                                }).whenComplete(() => print('Hogaya male'));
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  print(maleExperience);
                                  return AfterTrainerFormSubmission(
                                    //personalDetailsMap: personalDetail,
                                  );
                                 }
                                )
                              );
                            }else{
                            Fluttertoast.showToast(
                              msg: 'some error happened, kindly resend the form, Also check the profile picture',
                              backgroundColor: Colors.deepPurple[400],
                              textColor: Colors.black,
                              toastLength: Toast.LENGTH_LONG,
                             );
                            }
                            //print(credentials.userId);

                          }
                        },
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
            Center(child: Image.asset('assets/meditation_bg.png')),
            ],
          ),
        ),
      ),
    );
  }
}
