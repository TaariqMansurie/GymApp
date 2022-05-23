import 'dart:async';
import 'dart:io';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/Widgets/customInput.dart';
import 'package:GymApp/Widgets/custom_input_field_with_hint6.dart';
import 'package:GymApp/Widgets/custom_input_field_with_hint8.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'afterFormSubmission.dart';

class TrialForm extends StatefulWidget {
  @override
  _TrialFormState createState() => _TrialFormState();
}

class _TrialFormState extends State<TrialForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DatabaseMethods db = DatabaseMethods();

  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var trainersName = TextEditingController() ;
  var email = TextEditingController();
  var doc = TextEditingController();
  var selectedGender = 'Female';
  var contactNumber = TextEditingController();

  var certificateSelectedDate = '09';
  var certificateSelectedMonth = '07';
  var certificateSelectedYear = '1999';
  final List<String> genderList = ['Male', 'Female'];

  PickedFile imageFile;
  final ImagePicker _picker = new ImagePicker();
  bool isUploading = false ;


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
            'Choose trainer\'s Profile Screenshot',
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
    DatabaseMethods().uploadTrainerProfileForTrial(uid, File(pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference ref = Firestore.instance
        .collection('Free Trial');
    var uid = Provider.of<User>(context).uid;
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
                          SizedBox(height:15),
                          Text(
                            'Trial Form',
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
                      image: AssetImage('assets/gifs/b.png'),
                      height: 161,
                      width: 136,
                    )
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
                        padding: const EdgeInsets.fromLTRB(10,0,0,0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter your details first",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),

                      SizedBox(height:25),


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

                      //gender
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
                                  child: androidDropdown(),
                                )),
                            SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),

                      //email
                      CustomInputFieldWithHint6(
                        label: 'Email',
                        isObscurred: false,
                        controller: email,
                        validation: 'Email',
                      ),

                      CustomInputFieldWithHint8(
                        label: 'Contact No',
                        isObscurred: false,
                        controller: contactNumber,
                        validation: 'Contact No',
                      ),

                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,0,0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter your trainer details here",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      //trainers name
                      CustomInputField(
                        label: 'Trainers First Name',
                        isObscurred: false,
                        controller: trainersName,
                        validation: 'Trainers First Name',
                      ),

                      //trainers date of certification
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
                                        color: Colors.black,
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
                                        color: Colors.black,
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
                                        color: Colors.black,
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,0,0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Upload your trainer's profile screenshot over here",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      //trainers profile photo
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                          ),),
                            height: 150,
                            width: 150,
                            child : imageFile == null
                                ? Image.asset('assets/icons/upload.png')
                                : Image.file(File(imageFile.path))
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
                              builder: ((builder) => bottomSheet(uid)),
                            );
                          },
                        ),
                        alignment: Alignment(0.015, 0.0),
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
                                'Gender': selectedGender.toString(),
                                'Email': email.text.toString(),
                                'Contact No': contactNumber.text.toString(),
                                'Trainer\'s Name' : trainersName.text.toString(),
                                'Trainer\'s Date of Certifications' : certificateSelectedDate +
                                    ' ' +
                                    certificateSelectedMonth +
                                    ' ' +
                                    certificateSelectedYear,
                                'Trainer\'s Profile Url': trainersProfileUrl.toString(),
                              };
                              print(firstName);
                              print(personalDetail);
                              if(imageFile != null){
                                ref.add({
                                  'First Name': firstName.text.toString(),
                                  'Last Name': lastName.text.toString(),
                                  'Gender': selectedGender.toString(),
                                  'Email': email.text.toString(),
                                  'Contact No': contactNumber.text.toString(),
                                  'Trainer\'s Name' : trainersName.text.toString(),
                                  'Trainer\'s Date of Certifications' : certificateSelectedDate +
                                      ' ' +
                                      certificateSelectedMonth +
                                      ' ' +
                                      certificateSelectedYear,
                                  'Trainer\'s Profile Url': trainersProfileUrl.toString(),
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
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Some error occurred,\nkindly resubmit the form ',
                                    backgroundColor: Color(0xffffc400),
                                    textColor: Colors.black,
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.SNACKBAR
                                );
                              }
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
                              'Submit',
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
             // Center(child: Image.asset('assets/meditation_bg.png')),
            ],
          ),
        ),
      ),
    );
  }

}
