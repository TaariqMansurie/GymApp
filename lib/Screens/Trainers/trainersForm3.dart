//female trainers ka form hain yeh

import 'package:GymApp/Services/database.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'afterFormSubmission.dart';

class TrainersForm3 extends StatefulWidget {
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

  TrainersForm3(this.firstName,this.lastName,this.address,
      this.selectedGender,this.selectedDate,this.selectedMonth,
      this.selectedYear,this.linkedin,this.certifications,
      this.certificateSelectedDate,this.certificateSelectedMonth,
      this.certificateSelectedYear,this.achievements);

  @override
  _TrainersForm3State createState() => _TrainersForm3State();
}

class _TrainersForm3State extends State<TrainersForm3> {
  // var firstName = TextEditingController();
  // var lastName = TextEditingController();
  // var address = TextEditingController();
  // var linkedin = TextEditingController();
  // //var github = TextEditingController();
  // var certifications = TextEditingController();
  // // var doc = TextEditingController();
  // var achievements = TextEditingController();
  //
  // var selectedGender = 'Female';
  // var selectedDate = '06';
  // var selectedMonth = '05';
  // var selectedYear= '1998';
  //
  // var certificateSelectedDate = '09';
  // var certificateSelectedMonth = '07';
  // var certificateSelectedYear = '1999';

  final List<String> femaleExperienceList = ['2+ Years', '4+ Years'];
  var femaleExperience = '2+ Years';
  DatabaseMethods db = DatabaseMethods();

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
  @override
  Widget build(BuildContext context) {
    var uid = Provider.of<User>(context).uid;
    var uidd = Provider.of<User>(context).uidd;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    CollectionReference reff = Firestore.instance
        .collection('users')
        .document(uid)
        .collection('femaleTrainers');

    // DocumentReference refff = Firestore.instance
    // .collection('users')
    // .document(uid)
    // .collection('femaleTrainers')
    // .document(uidd);

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
                                'Experience': femaleExperience.toString(),
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
                              print(femaleExperience);
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
                              if(widget.selectedGender != null){
                                // db.addTrainerFemaleInfo({
                                //   'Experience': femaleExperience.toString(),
                                // }, uid, uidd);
                                   reff.add({
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
                                     'Experience' : femaleExperience.toString()
                                   }).whenComplete(() => print('hogaya firebase mein female ka data update'));
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      print(femaleExperience);
                                      return AfterTrainerFormSubmission(
                                        //personalDetailsMap: personalDetail,
                                      );
                                    }
                                    )
                                );
                              }
                              //print(credentials.userId);

                            }else{
                              Center(child: Text('some error happened, kindly resend the form'),);
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
