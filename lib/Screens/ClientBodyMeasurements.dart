import 'package:GymApp/Services/database.dart';
import 'package:GymApp/Widgets/customInput.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Trainers/trainersForm2.dart';
import 'Trainers/trainersForm3.dart';

class ClientBodyMeasurements extends StatefulWidget {
  const ClientBodyMeasurements({Key key}) : super(key: key);

  @override
  _ClientBodyMeasurementsState createState() => _ClientBodyMeasurementsState();
}

class _ClientBodyMeasurementsState extends State<ClientBodyMeasurements> {

  final GlobalKey<FormState> _formKeyy = GlobalKey<FormState>();
  DatabaseMethods db = DatabaseMethods();

  var height = TextEditingController();
  var weight = TextEditingController();
  var neck = TextEditingController();
  var chest = TextEditingController();
  var arms = TextEditingController();
  var forearms = TextEditingController();
  var waist = TextEditingController();
  var thighs = TextEditingController();
  var calves = TextEditingController();

  // var selectedGender = 'Female';
  // var selectedDate = '06';
  // var selectedMonth = '05';
  // var selectedYear = '1998';
  //
  // var certificateSelectedDate = '09';
  // var certificateSelectedMonth = '07';
  // var certificateSelectedYear = '1999';
  // final List<String> genderList = ['Male', 'Female'];


  // PickedFile imageFile;
  // final ImagePicker _picker = new ImagePicker();

  // DropdownButton<String> androidDropdown() {
  //   List<DropdownMenuItem<String>> codes = [];
  //   for (String gender in genderList) {
  //     codes.add(
  //       DropdownMenuItem(
  //         child: Text(
  //           gender,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.ptSans(
  //             fontWeight: FontWeight.w400,
  //             fontSize: 16,
  //             color: Color(0xFF263238),
  //           ),
  //         ),
  //         value: gender,
  //       ),
  //     );
  //   }
  //
  //   return DropdownButton<String>(
  //     isExpanded: true,
  //     dropdownColor: Colors.white,
  //     iconEnabledColor: Color(0xFF263238),
  //     value: selectedGender,
  //     items: codes,
  //     onChanged: (value) {
  //       setState(
  //             () {
  //           selectedGender = value.toString();
  //         },
  //       );
  //     },
  //   );
  // }
  //
  // List giveYears() {
  //   List<String> years = [];
  //   for (int i = 1980; i < 2021; i++) {
  //     years.add(i.toString());
  //   }
  //   return years;
  // }
  //
  // List giveMonths() {
  //   List<String> month = [];
  //   for (int i = 1; i < 13; i++) {
  //     if (i < 10) {
  //       month.add('0' + i.toString());
  //     } else {
  //       month.add(i.toString());
  //     }
  //   }
  //   return month;
  // }
  //
  // List giveDate() {
  //   List<String> date = [];
  //   for (int i = 1; i < 32; i++) {
  //     if (i < 10) {
  //       date.add('0' + i.toString());
  //     } else {
  //       date.add(i.toString());
  //     }
  //   }
  //   return date;
  // }
  //
  // DropdownButton<String> androidDropdownDate() {
  //   List<DropdownMenuItem<String>> dates = [];
  //   for (String date in giveDate()) {
  //     dates.add(
  //       DropdownMenuItem(
  //         child: Text(
  //           date,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.rubik(
  //             fontWeight: FontWeight.w500,
  //             fontSize: 14,
  //             color: Color(0xFF263238),
  //           ),
  //         ),
  //         value: date,
  //       ),
  //     );
  //   }
  //
  //   return DropdownButton<String>(
  //     isExpanded: true,
  //     dropdownColor: Colors.white,
  //     iconEnabledColor: Color(0xFF263238),
  //     value: selectedDate,
  //     items: dates,
  //     onChanged: (value) {
  //       setState(
  //             () {
  //           selectedDate = value.toString();
  //         },
  //       );
  //     },
  //   );
  // }
  //
  // DropdownButton<String> androidDropdownMonth() {
  //   List<DropdownMenuItem<String>> months = [];
  //   for (String month in giveMonths()) {
  //     months.add(
  //       DropdownMenuItem(
  //         child: Text(
  //           month,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.rubik(
  //             fontWeight: FontWeight.w500,
  //             fontSize: 14,
  //             color: Color(0xFF263238),
  //           ),
  //         ),
  //         value: month,
  //       ),
  //     );
  //   }
  //
  //   return DropdownButton<String>(
  //     isExpanded: true,
  //     dropdownColor: Colors.white,
  //     iconEnabledColor: Color(0xFF263238),
  //     value: selectedMonth,
  //     items: months,
  //     onChanged: (value) {
  //       setState(
  //             () {
  //           selectedMonth = value.toString();
  //         },
  //       );
  //     },
  //   );
  // }
  //
  // DropdownButton<String> androidDropdownYear() {
  //   List<DropdownMenuItem<String>> years = [];
  //   for (String year in giveYears()) {
  //     years.add(
  //       DropdownMenuItem(
  //         child: Text(
  //           year,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.rubik(
  //             fontWeight: FontWeight.w500,
  //             fontSize: 14,
  //             color: Color(0xFF263238),
  //           ),
  //         ),
  //         value: year,
  //       ),
  //     );
  //   }
  //
  //   return DropdownButton<String>(
  //     isExpanded: true,
  //     dropdownColor: Colors.white,
  //     iconEnabledColor: Color(0xFF263238),
  //     value: selectedYear,
  //     items: years,
  //     onChanged: (value) {
  //       setState(
  //             () {
  //           selectedYear = value.toString();
  //         },
  //       );
  //     },
  //   );
  // }
  //
  // DropdownButton<String> certificationDropdownDate() {
  //   List<DropdownMenuItem<String>> dates = [];
  //   for (String date in giveDate()) {
  //     dates.add(
  //       DropdownMenuItem(
  //         child: Text(
  //           date,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.rubik(
  //             fontWeight: FontWeight.w500,
  //             fontSize: 14,
  //             color: Color(0xFF263238),
  //           ),
  //         ),
  //         value: date,
  //       ),
  //     );
  //   }
  //
  //   return DropdownButton<String>(
  //     isExpanded: true,
  //     dropdownColor: Colors.white,
  //     iconEnabledColor: Color(0xFF263238),
  //     value: certificateSelectedDate,
  //     items: dates,
  //     onChanged: (value) {
  //       setState(
  //             () {
  //           certificateSelectedDate = value.toString();
  //         },
  //       );
  //     },
  //   );
  // }
  //
  // DropdownButton<String> certificationDropdownMonth() {
  //   List<DropdownMenuItem<String>> months = [];
  //   for (String month in giveMonths()) {
  //     months.add(
  //       DropdownMenuItem(
  //         child: Text(
  //           month,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.rubik(
  //             fontWeight: FontWeight.w500,
  //             fontSize: 14,
  //             color: Color(0xFF263238),
  //           ),
  //         ),
  //         value: month,
  //       ),
  //     );
  //   }
  //
  //   return DropdownButton<String>(
  //     isExpanded: true,
  //     dropdownColor: Colors.white,
  //     iconEnabledColor: Color(0xFF263238),
  //     value: certificateSelectedMonth,
  //     items: months,
  //     onChanged: (value) {
  //       setState(
  //             () {
  //           certificateSelectedMonth = value.toString();
  //         },
  //       );
  //     },
  //   );
  // }
  //
  // DropdownButton<String> certificationDropdownYear() {
  //   List<DropdownMenuItem<String>> years = [];
  //   for (String year in giveYears()) {
  //     years.add(
  //       DropdownMenuItem(
  //         child: Text(
  //           year,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.rubik(
  //             fontWeight: FontWeight.w500,
  //             fontSize: 14,
  //             color: Color(0xFF263238),
  //           ),
  //         ),
  //         value: year,
  //       ),
  //     );
  //   }
  //
  //   return DropdownButton<String>(
  //     isExpanded: true,
  //     dropdownColor: Colors.white,
  //     iconEnabledColor: Color(0xFF263238),
  //     value: certificateSelectedYear,
  //     items: years,
  //     onChanged: (value) {
  //       setState(
  //             () {
  //           certificateSelectedYear = value.toString();
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.arrow_back),
        //   color: Colors.black,
        // ),
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: _formKeyy,
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
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image(
                                image: AssetImage('assets/Hide.png'),
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ),
                          Text(
                            'Body & Weight',
                            style: GoogleFonts.rubik(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF263238),
                            ),
                          ),
                          Text(
                            'Measurements',
                            style: GoogleFonts.rubik(
                              fontSize: 22,
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
                        label: 'Height',
                        isObscurred: false,
                        controller: height,
                        validation: 'height',
                      ),
                      CustomInputField(
                        label: 'Weight',
                        isObscurred: false,
                        controller: weight,
                        validation: 'weight',
                      ),
                      CustomInputField(
                        label: 'Neck',
                        isObscurred: false,
                        controller: neck,
                        validation: 'neck',
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 42,
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Gender',
                      //         style: GoogleFonts.rubik(
                      //           fontWeight: FontWeight.w500,
                      //           fontSize: 14,
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         height: 12,
                      //       ),
                      //       Container(
                      //           alignment: Alignment.center,
                      //           width: MediaQuery.of(context).size.width,
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             border: Border.all(
                      //               color: Color(0xffff5a5f),
                      //               width: 2,
                      //             ),
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(8),
                      //             ),
                      //           ),
                      //           child: Padding(
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 16.0),
                      //             child: androidDropdown(),
                      //           )),
                      //       SizedBox(
                      //         height: 24,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 42,
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Date of Birth',
                      //         style: GoogleFonts.rubik(
                      //           fontWeight: FontWeight.w500,
                      //           fontSize: 14,
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         height: 12,
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Expanded(
                      //             child: Container(
                      //               alignment: Alignment.center,
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 border: Border.all(
                      //                   color: Color(0xffff5a5f),
                      //                   width: 2,
                      //                 ),
                      //                 borderRadius: BorderRadius.all(
                      //                   Radius.circular(8),
                      //                 ),
                      //               ),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.symmetric(
                      //                     horizontal: 8.0),
                      //                 child: androidDropdownDate(),
                      //               ),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 15,
                      //           ),
                      //           Expanded(
                      //             child: Container(
                      //               alignment: Alignment.center,
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 border: Border.all(
                      //                   color: Color(0xffff5a5f),
                      //                   width: 2,
                      //                 ),
                      //                 borderRadius: BorderRadius.all(
                      //                   Radius.circular(8),
                      //                 ),
                      //               ),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.symmetric(
                      //                     horizontal: 8.0),
                      //                 child: androidDropdownMonth(),
                      //               ),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 15,
                      //           ),
                      //           Expanded(
                      //             child: Container(
                      //               alignment: Alignment.center,
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 border: Border.all(
                      //                   color: Color(0xffff5a5f),
                      //                   width: 2,
                      //                 ),
                      //                 borderRadius: BorderRadius.all(
                      //                   Radius.circular(8),
                      //                 ),
                      //               ),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.symmetric(
                      //                     horizontal: 8.0),
                      //                 child: androidDropdownYear(),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: 24,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      CustomInputField(
                        label: 'Chest',
                        isObscurred: false,
                        controller: chest,
                        validation: 'chest',
                      ),

                      CustomInputField(
                        label: 'Arms',
                        isObscurred: false,
                        controller: arms,
                        validation: 'arms',
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 42,
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Date of Certifications',
                      //         style: GoogleFonts.rubik(
                      //           fontWeight: FontWeight.w500,
                      //           fontSize: 14,
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         height: 12,
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Expanded(
                      //             child: Container(
                      //               alignment: Alignment.center,
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 border: Border.all(
                      //                   color: Color(0xffff5a5f),
                      //                   width: 2,
                      //                 ),
                      //                 borderRadius: BorderRadius.all(
                      //                   Radius.circular(8),
                      //                 ),
                      //               ),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.symmetric(
                      //                     horizontal: 8.0),
                      //                 child: certificationDropdownDate(),
                      //               ),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 15,
                      //           ),
                      //           Expanded(
                      //             child: Container(
                      //               alignment: Alignment.center,
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 border: Border.all(
                      //                   color: Color(0xffff5a5f),
                      //                   width: 2,
                      //                 ),
                      //                 borderRadius: BorderRadius.all(
                      //                   Radius.circular(8),
                      //                 ),
                      //               ),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.symmetric(
                      //                     horizontal: 8.0),
                      //                 child: certificationDropdownMonth(),
                      //               ),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 15,
                      //           ),
                      //           Expanded(
                      //             child: Container(
                      //               alignment: Alignment.center,
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 border: Border.all(
                      //                   color: Color(0xffff5a5f),
                      //                   width: 2,
                      //                 ),
                      //                 borderRadius: BorderRadius.all(
                      //                   Radius.circular(8),
                      //                 ),
                      //               ),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.symmetric(
                      //                     horizontal: 8.0),
                      //                 child: certificationDropdownYear(),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: 24,
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      CustomInputField(
                        label: 'Forearms',
                        isObscurred: false,
                        controller: forearms,
                        validation: 'forearms',
                      ),

                      CustomInputField(
                        label: 'Waist',
                        isObscurred: false,
                        controller: waist,
                        validation: 'waist',
                      ),

                      CustomInputField(
                        label: 'Thighs',
                        isObscurred: false,
                        controller: thighs,
                        validation: 'Thighs',
                      ),

                      CustomInputField(
                        label: 'Calves',
                        isObscurred: false,
                        controller: calves,
                        validation: 'Calves',
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42.0,
                          vertical: 10,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (_formKeyy.currentState.validate()) {
                              Map<String, String> personalDetails = {
                                'Height': height.text.toString(),
                                'Weight': weight.text.toString(),
                                'Neck': neck.text.toString(),
                                'Chest': chest.text.toString(),
                                'Arms': arms.text.toString(),
                                'Forearms': forearms.text.toString(),
                                'Waist': waist.text.toString(),
                                'Thighs': thighs.text.toString(),
                                'Calves': calves.text.toString(),
                              };
                              //   // if(selectedGender != 'Female') {
                              //   //   // db.addTrainerMaleInfo({
                              //   //   //   'First Name': firstName.text.toString(),
                              //   //   //   'Last Name': lastName.text.toString(),
                              //   //   //   'Address': address.text.toString(),
                              //   //   //   'Gender': selectedGender.toString(),
                              //   //   //   'DOB': selectedDate +
                              //   //   //       ' ' +
                              //   //   //       selectedMonth +
                              //   //   //       ' ' +
                              //   //   //       selectedYear,
                              //   //   //   'LinkedIn Profile':linkedin.text.toString(),
                              //   //   //   'Certifications': certifications.text.toString(),
                              //   //   //   'Date of Certifications' : certificateSelectedDate +
                              //   //   //       ' ' +
                              //   //   //       certificateSelectedMonth +
                              //   //   //       ' ' +
                              //   //   //       certificateSelectedYear,
                              //   //   //   'Achievements' : achievements.text.toString(),
                              //   //   // }, uid,uidd);}
                              //   //   ref.add({
                              //   //     'First Name': firstName.text.toString(),
                              //   //       'Last Name': lastName.text.toString(),
                              //   //       'Address': address.text.toString(),
                              //   //       'Gender': selectedGender.toString(),
                              //   //       'DOB': selectedDate +
                              //   //           ' ' +
                              //   //           selectedMonth +
                              //   //           ' ' +
                              //   //           selectedYear,
                              //   //       'LinkedIn Profile':linkedin.text.toString(),
                              //   //       'Certifications': certifications.text.toString(),
                              //   //       'Date of Certifications' : certificateSelectedDate +
                              //   //           ' ' +
                              //   //           certificateSelectedMonth +
                              //   //           ' ' +
                              //   //           certificateSelectedYear,
                              //   //       'Achievements' : achievements.text.toString(),
                              //   //   }).whenComplete(() => print('Hogaya male'));
                              //   // }
                              //   // else {
                              //   //   // db.addTrainerFemaleInfo({
                              //   //   //   'First Name': firstName.text.toString(),
                              //   //   //   'Last Name': lastName.text.toString(),
                              //   //   //   'Address': address.text.toString(),
                              //   //   //   'Gender': selectedGender.toString(),
                              //   //   //   'DOB': selectedDate +
                              //   //   //       ' ' +
                              //   //   //       selectedMonth +
                              //   //   //       ' ' +
                              //   //   //       selectedYear,
                              //   //   //   'LinkedIn Profile':linkedin.text.toString(),
                              //   //   //   'Certifications': certifications.text.toString(),
                              //   //   //   'Date of Certifications' : certificateSelectedDate +
                              //   //   //       ' ' +
                              //   //   //       certificateSelectedMonth +
                              //   //   //       ' ' +
                              //   //   //       certificateSelectedYear,
                              //   //   //   'Achievements' : achievements.text.toString(),
                              //   //   // }, uid,uidd);
                              //   //   reff.add({
                              //   //     'First Name': firstName.text.toString(),
                              //   //     'Last Name': lastName.text.toString(),
                              //   //     'Address': address.text.toString(),
                              //   //     'Gender': selectedGender.toString(),
                              //   //     'DOB': selectedDate +
                              //   //         ' ' +
                              //   //         selectedMonth +
                              //   //         ' ' +
                              //   //         selectedYear,
                              //   //     'LinkedIn Profile':linkedin.text.toString(),
                              //   //     'Certifications': certifications.text.toString(),
                              //   //     'Date of Certifications' : certificateSelectedDate +
                              //   //         ' ' +
                              //   //         certificateSelectedMonth +
                              //   //         ' ' +
                              //   //         certificateSelectedYear,
                              //   //     'Achievements' : achievements.text.toString(),
                              //   //   }).whenComplete(() => print('Hogaya Female'));
                              //   // }
                              //   print(firstName);
                              //   if(selectedGender != 'Female'){
                              //     Navigator.push((context),
                              //         MaterialPageRoute(builder: (context){
                              //           return TrainersForm2(
                              //               firstName,lastName,address,selectedGender,
                              //               selectedDate,selectedMonth,selectedYear,
                              //               linkedin,certifications,certificateSelectedDate,
                              //               certificateSelectedMonth,certificateSelectedYear,
                              //               achievements
                              //           );
                              //         }));
                              //   }else {
                              //     Navigator.push((context),
                              //         MaterialPageRoute(builder: (context){
                              //           return TrainersForm3(
                              //               firstName,lastName,address,selectedGender,
                              //               selectedDate,selectedMonth,selectedYear,
                              //               linkedin,certifications,certificateSelectedDate,
                              //               certificateSelectedMonth,certificateSelectedYear,
                              //               achievements
                              //           );
                              //         }));
                              //   }
                              //   // Navigator.push(context,
                              //   //     MaterialPageRoute(builder: (context) {
                              //   //       print(certificateSelectedYear);
                              //   //       return TrainersForm2(
                              //   //         //personalDetailsMap: personalDetail,
                              //   //       );
                              //   //     }));
                              //   //print(credentials.userId);
                              // }
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
