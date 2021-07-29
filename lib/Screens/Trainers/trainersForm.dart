import 'dart:io';

import 'package:GymApp/Model/gender.dart';
import 'package:GymApp/Screens/Trainers/trainersForm2.dart';
import 'package:GymApp/Screens/Trainers/trainersForm3.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/Widgets/customInput.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'afterFormSubmission.dart';

class TrainerForm extends StatefulWidget {
  @override
  _TrainerFormState createState() => _TrainerFormState();
}

class _TrainerFormState extends State<TrainerForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DatabaseMethods db = DatabaseMethods();

  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var address = TextEditingController();
  var linkedin = TextEditingController();
  var github = TextEditingController();
  var certifications = TextEditingController();
  var doc = TextEditingController();
  var achievements = TextEditingController();

  var selectedGender = 'Female';
  var selectedDate = '06';
  var selectedMonth = '05';
  var selectedYear = '1998';

  var certificateSelectedDate = '09';
  var certificateSelectedMonth = '07';
  var certificateSelectedYear = '1999';
  final List<String> genderList = ['Male', 'Female'];


  // PickedFile imageFile;
  // final ImagePicker _picker = new ImagePicker();

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> codes = [];
    for (String gender in genderList) {
      codes.add(
        DropdownMenuItem(
          child: Text(
            gender,
            textAlign: TextAlign.center,
            style: GoogleFonts.ptSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF263238),
            ),
          ),
          value: gender,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Color(0xFF263238),
      value: selectedGender,
      items: codes,
      onChanged: (value) {
        setState(
              () {
            selectedGender = value.toString();
          },
        );
      },
    );
  }

  List giveYears() {
    List<String> years = [];
    for (int i = 1980; i < 2021; i++) {
      years.add(i.toString());
    }
    return years;
  }

  List giveMonths() {
    List<String> month = [];
    for (int i = 1; i < 13; i++) {
      if (i < 10) {
        month.add('0' + i.toString());
      } else {
        month.add(i.toString());
      }
    }
    return month;
  }

  List giveDate() {
    List<String> date = [];
    for (int i = 1; i < 32; i++) {
      if (i < 10) {
        date.add('0' + i.toString());
      } else {
        date.add(i.toString());
      }
    }
    return date;
  }

  DropdownButton<String> androidDropdownDate() {
    List<DropdownMenuItem<String>> dates = [];
    for (String date in giveDate()) {
      dates.add(
        DropdownMenuItem(
          child: Text(
            date,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF263238),
            ),
          ),
          value: date,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Color(0xFF263238),
      value: selectedDate,
      items: dates,
      onChanged: (value) {
        setState(
              () {
            selectedDate = value.toString();
          },
        );
      },
    );
  }

  DropdownButton<String> androidDropdownMonth() {
    List<DropdownMenuItem<String>> months = [];
    for (String month in giveMonths()) {
      months.add(
        DropdownMenuItem(
          child: Text(
            month,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF263238),
            ),
          ),
          value: month,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Color(0xFF263238),
      value: selectedMonth,
      items: months,
      onChanged: (value) {
        setState(
              () {
            selectedMonth = value.toString();
          },
        );
      },
    );
  }

  DropdownButton<String> androidDropdownYear() {
    List<DropdownMenuItem<String>> years = [];
    for (String year in giveYears()) {
      years.add(
        DropdownMenuItem(
          child: Text(
            year,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF263238),
            ),
          ),
          value: year,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Color(0xFF263238),
      value: selectedYear,
      items: years,
      onChanged: (value) {
        setState(
              () {
            selectedYear = value.toString();
          },
        );
      },
    );
  }

  DropdownButton<String> certificationDropdownDate() {
    List<DropdownMenuItem<String>> dates = [];
    for (String date in giveDate()) {
      dates.add(
        DropdownMenuItem(
          child: Text(
            date,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF263238),
            ),
          ),
          value: date,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Color(0xFF263238),
      value: certificateSelectedDate,
      items: dates,
      onChanged: (value) {
        setState(
              () {
            certificateSelectedDate = value.toString();
          },
        );
      },
    );
  }

  DropdownButton<String> certificationDropdownMonth() {
    List<DropdownMenuItem<String>> months = [];
    for (String month in giveMonths()) {
      months.add(
        DropdownMenuItem(
          child: Text(
            month,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF263238),
            ),
          ),
          value: month,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Color(0xFF263238),
      value: certificateSelectedMonth,
      items: months,
      onChanged: (value) {
        setState(
              () {
            certificateSelectedMonth = value.toString();
          },
        );
      },
    );
  }

  DropdownButton<String> certificationDropdownYear() {
    List<DropdownMenuItem<String>> years = [];
    for (String year in giveYears()) {
      years.add(
        DropdownMenuItem(
          child: Text(
            year,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF263238),
            ),
          ),
          value: year,
        ),
      );
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.white,
      iconEnabledColor: Color(0xFF263238),
      value: certificateSelectedYear,
      items: years,
      onChanged: (value) {
        setState(
              () {
            certificateSelectedYear = value.toString();
          },
        );
      },
    );
  }

  // Widget bottomSheet(String uid) {
  //   return Container(
  //     height: 100.0,
  //     // width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 20,
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         Text(
  //           'Choose a Profile Photo',
  //           style: TextStyle(fontSize: 20.0),
  //         ),
  //         SizedBox(
  //           height: 20.0,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             FlatButton.icon(
  //                 onPressed: () {
  //                   takePhoto(ImageSource.camera, uid);
  //                 },
  //                 icon: Icon(Icons.camera),
  //                 label: Text('Camera')),
  //             FlatButton.icon(
  //                 onPressed: () {
  //                   takePhoto(ImageSource.gallery, uid);
  //                 },
  //                 icon: Icon(Icons.image),
  //                 label: Text('Gallery'))
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // void takePhoto(ImageSource source, String uid) async {
  //   final pickedFile = await _picker.getImage(
  //     source: source,
  //   );
  //   setState(() {
  //     imageFile = pickedFile;
  //   });
  //   DatabaseMethods().uploadProfilePicToFirebase(uid, File(pickedFile.path));
  // }

  @override
  Widget build(BuildContext context) {
    var uid = Provider.of<User>(context).uid;
    var uidd = Provider.of<User>(context).uidd;
    //
    // CollectionReference ref = Firestore.instance
    //     .collection('users')
    //     .document(uid)
    //     .collection('maleTrainers');
    //
    // DocumentReference documentReference = Firestore.instance
    //     .collection('users')
    //     .document(uid)
    //     .collection('maleTrainers')
    //     .document(uidd);
    //
    // CollectionReference reff = Firestore.instance
    //     .collection('users')
    //     .document(uid)
    //     .collection('femaleTrainers');
    
    var credentials = Provider.of<User>(context, listen: false);
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
                            'Personal',
                            style: GoogleFonts.rubik(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF263238),
                            ),
                          ),
                          Text(
                            'Details    ',
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
                    )
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
                      // CircleAvatar(
                      //   radius: 50.0,
                      //   backgroundImage: imageFile == null
                      //       ? AssetImage('assets/apple.png')
                      //       : FileImage(File(imageFile.path))
                      //   // NetworkImage(
                      //   //     _imageFile.toString()), //(iska matlab yeh hain ki background image selected profile photo rahega gallery se liya hua and if voh nhi hua na toh normal default image rahega search.png valaa)
                      // ),
                      // Container(
                      //   child: InkWell(
                      //     child: Icon(
                      //       Icons.camera_alt,
                      //       color: Colors.teal,
                      //       size: 28.0,
                      //     ),
                      //     onTap: () {
                      //       showModalBottomSheet(
                      //         context: context,
                      //         builder: ((builder) => bottomSheet(uid)),
                      //       );
                      //     },
                      //   ),
                     //   alignment: Alignment(0.015, 0.0),
                    //  ),
                      CustomInputField(
                        label: 'First Name',
                        isObscurred: false,
                        controller: firstName,
                        validation: 'first name',
                      ),
                      CustomInputField(
                        label: 'Last Name',
                        isObscurred: false,
                        controller: lastName,
                        validation: 'last name',
                      ),
                      CustomInputField(
                        label: 'Address',
                        isObscurred: false,
                        controller: address,
                        maxLines: 5,
                        validation: 'address',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender',
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
                                  child: androidDropdown(),
                                )),
                            SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date of Birth',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
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
                                          horizontal: 8.0),
                                      child: androidDropdownDate(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
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
                                          horizontal: 8.0),
                                      child: androidDropdownMonth(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
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
                                          horizontal: 8.0),
                                      child: androidDropdownYear(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                      CustomInputField(
                        label: 'Linkedin Profile',
                        isObscurred: false,
                        controller: linkedin,
                        validation: 'Linkedin',
                      ),

                      CustomInputField(
                        label: 'Certifications',
                        isObscurred: false,
                        controller: certifications,
                        validation: 'certifications',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date of Certifications',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
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
                                          horizontal: 8.0),
                                      child: certificationDropdownDate(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
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
                                          horizontal: 8.0),
                                      child: certificationDropdownMonth(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
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
                                          horizontal: 8.0),
                                      child: certificationDropdownYear(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),

                      CustomInputField(
                        label: 'Achievements',
                        isObscurred: false,
                        controller: achievements,
                        validation: 'achievements',
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
                                 'First Name': firstName.text.toString(),
                                 'Last Name': lastName.text.toString(),
                                 'Address': address.text.toString(),
                                 'Gender': selectedGender.toString(),
                          /*age*/'DOB': selectedDate +
                                    ' ' +
                                    selectedMonth +
                                    ' ' +
                                    selectedYear,
                                'Linkedin': linkedin.text.toString(),
                                //'Github': github.text.toString(),
                                'Certifications': certifications.text.toString(),
                                'Date of Certifications' : certificateSelectedDate +
                                    ' ' +
                                    certificateSelectedMonth +
                                    ' ' +
                                    certificateSelectedYear,
                                'Achievements' : achievements.text.toString(),
                              };
                              // if(selectedGender != 'Female') {
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
                              //   // }, uid,uidd);}
                              //   ref.add({
                              //     'First Name': firstName.text.toString(),
                              //       'Last Name': lastName.text.toString(),
                              //       'Address': address.text.toString(),
                              //       'Gender': selectedGender.toString(),
                              //       'DOB': selectedDate +
                              //           ' ' +
                              //           selectedMonth +
                              //           ' ' +
                              //           selectedYear,
                              //       'LinkedIn Profile':linkedin.text.toString(),
                              //       'Certifications': certifications.text.toString(),
                              //       'Date of Certifications' : certificateSelectedDate +
                              //           ' ' +
                              //           certificateSelectedMonth +
                              //           ' ' +
                              //           certificateSelectedYear,
                              //       'Achievements' : achievements.text.toString(),
                              //   }).whenComplete(() => print('Hogaya male'));
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
                              //   reff.add({
                              //     'First Name': firstName.text.toString(),
                              //     'Last Name': lastName.text.toString(),
                              //     'Address': address.text.toString(),
                              //     'Gender': selectedGender.toString(),
                              //     'DOB': selectedDate +
                              //         ' ' +
                              //         selectedMonth +
                              //         ' ' +
                              //         selectedYear,
                              //     'LinkedIn Profile':linkedin.text.toString(),
                              //     'Certifications': certifications.text.toString(),
                              //     'Date of Certifications' : certificateSelectedDate +
                              //         ' ' +
                              //         certificateSelectedMonth +
                              //         ' ' +
                              //         certificateSelectedYear,
                              //     'Achievements' : achievements.text.toString(),
                              //   }).whenComplete(() => print('Hogaya Female'));
                              // }
                              print(firstName);
                              if(selectedGender != 'Female'){
                                Navigator.push((context),
                                    MaterialPageRoute(builder: (context){
                                      return TrainersForm2(
                                        firstName,lastName,address,selectedGender,
                                        selectedDate,selectedMonth,selectedYear,
                                        linkedin,certifications,certificateSelectedDate,
                                        certificateSelectedMonth,certificateSelectedYear,
                                        achievements
                                      );
                                    }));
                              }else {
                                Navigator.push((context),
                                   MaterialPageRoute(builder: (context){
                                     return TrainersForm3(
                                         firstName,lastName,address,selectedGender,
                                         selectedDate,selectedMonth,selectedYear,
                                         linkedin,certifications,certificateSelectedDate,
                                         certificateSelectedMonth,certificateSelectedYear,
                                         achievements
                                     );
                                }));
                              }
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //       print(certificateSelectedYear);
                              //       return TrainersForm2(
                              //         //personalDetailsMap: personalDetail,
                              //       );
                              //     }));
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
