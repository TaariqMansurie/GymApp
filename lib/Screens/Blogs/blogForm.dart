import 'dart:async';
import 'dart:io';
import 'package:GymApp/Screens/Trainers/afterFormSubmission2.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/Widgets/customInput.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:GymApp/shared/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BlogForm extends StatefulWidget {
  const BlogForm({Key key}) : super(key: key);

  @override
  _BlogFormState createState() => _BlogFormState();
}

class _BlogFormState extends State<BlogForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DatabaseMethods db = DatabaseMethods();

  var title = TextEditingController();
  var firstpara = TextEditingController();
  var secondpara = TextEditingController();
  var thirdpara = TextEditingController();
  var fourthpara = TextEditingController();

  PickedFile imageFile;
  PickedFile imageFile2;
  final ImagePicker _picker = new ImagePicker();

  bool isUploading = false ;


  Widget bottomSheet(String uid,String uidd) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Choose your First Photo',
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

  Widget bottomSheet2(String uid,String uidd) {
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
            'Choose your Second Photo',
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
                    takePhoto2(ImageSource.camera, uid);
                  },
                  icon: Icon(Icons.camera),
                  label: Text('Camera')),
              TextButton.icon(
                  onPressed: () {
                    takePhoto2(ImageSource.gallery, uid);
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
    DatabaseMethods().uploadFirstPicture(uid, File(pickedFile.path));
  }

  void takePhoto2(ImageSource source, String uid) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      imageFile2 = pickedFile;
    });
    DatabaseMethods().uploadSecondPicture(uid, File(pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {

    var uid = Provider.of<User>(context).uid;
    var uidd = Provider.of<User>(context).uidd;

    DocumentReference reff = Firestore.instance
        .collection('blogs')
        .document('mqLhM5i0uPwBDOSaMtkf');

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
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
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
                            'Blogs        ',
                            style: GoogleFonts.rubik(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF263238),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Text(
                              '       Updation',
                              style: GoogleFonts.rubik(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF263238),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/gifs/a.png'),
                      height: 141,
                      width: 126,
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
                      CustomInputField(
                        label: 'Title',
                        isObscurred: false,
                        controller: title,
                        validation: 'Title',
                        maxLines: 5,
                      ),

                      CustomInputField(
                        label: '1st Paragraph',
                        isObscurred: false,
                        controller: firstpara,
                        validation: 'firstpara',
                        maxLines: 5,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose your first photo :-',
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

                          ],
                        ),
                      ),

                      CustomInputField(
                        label: '2nd Paragraph',
                        isObscurred: false,
                        controller: secondpara,
                        validation: 'secondpara',
                        maxLines: 5,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose your second photo :-',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Center(
                              child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: imageFile2 == null
                                      ? AssetImage('assets/apple.png')
                                      : FileImage(File(imageFile2.path))
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
                                    builder: ((builder) => bottomSheet2(uid,uidd)),
                                  );
                                },
                              ),
                              alignment: Alignment(0.015, 0.0),
                            ),
                            SizedBox(height: 20,),

                          ],
                        ),
                      ),

                      CustomInputField(
                        label: '3rd Paragraph',
                        isObscurred: false,
                        controller: thirdpara,
                        maxLines: 5,
                        validation: 'thirdpara',
                      ),

                      CustomInputField(
                        label: '4th Paragraph',
                        isObscurred: false,
                        controller: fourthpara,
                        maxLines: 5,
                        validation: 'fourthpara',
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42.0,
                          vertical: 10,
                        ),
                        child: isUploading ? CircularProgressIndicator():GestureDetector(
                          onTap: () {
                            setState(() {
                              isUploading = true ;
                            });
                            if (_formKey.currentState.validate()) {
                              Map<String, String> blogDetail = {
                                'Title' : title.text.toString(),
                                'firstpara': firstpara.text.toString(),
                                'secondpara': secondpara.text.toString(),
                                'thirdpara': thirdpara.toString(),
                                'fourthpara': fourthpara.text.toString(),
                                'First Picture': firstPhotoUrl.toString(),
                                'Second Picture': secondPhotoUrl.toString(),
                              };
                              print(firstpara);
                              print(blogDetail);
                              // if (_formKey.currentState.validate()) {
                              //   Map<String, String> personalDetail = {
                              //     'Experience': femaleExperience.toString(),
                              //     'profile_pic_url_tf': purll.toString(),
                              //   };
                                if(imageFile != null && imageFile2 !=null){
                                  reff.setData({
                                    'Title' : title.text.toString(),
                                    'First Para': firstpara.text.toString(),
                                    'Second Para': secondpara.text.toString(),
                                    'Third Para': thirdpara.text.toString(),
                                    'Fourth Para': fourthpara.text.toString(),
                                    'First Picture':firstPhotoUrl.toString(),
                                    'Second Picture': secondPhotoUrl.toString(),
                                    // 'release_date': Timestamp.now().toDate(),
                                  },merge: false).whenComplete(() {
                                    Timer(
                                        Duration(seconds: 6),
                                            () {
                                          setState(() {
                                            isUploading = false ;
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
                                              builder: (context) => AfterTrainerFormSubmission2(),
                                            ));});
                                  });
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) {
                                  //       return AfterTrainerFormSubmission2();
                                  //      }
                                  //     )
                                  // );
                                }
                              }else{
                                Fluttertoast.showToast(
                                    msg: 'some error happened, kindly resend the form, Also check the pictures',
                                    backgroundColor: Colors.deepPurple[400],
                                    textColor: Colors.black,
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER

                                );
                              }
                              // if(selectedGender != 'Female'){
                              //   Navigator.push((context),
                              //       MaterialPageRoute(builder: (context){
                              //         return TrainersForm2(
                              //             firstName,lastName,selectedGender,
                              //             certifications,specialization,certificateSelectedDate,
                              //             certificateSelectedMonth,certificateSelectedYear,
                              //             achievements
                              //         );
                              //       }));
                              // } else {
                              //   Navigator.push((context),
                              //       MaterialPageRoute(builder: (context){
                              //         return TrainersForm3(
                              //             firstName,lastName,selectedGender,
                              //             certifications,specialization,certificateSelectedDate,
                              //             certificateSelectedMonth,certificateSelectedYear,
                              //             achievements
                              //         );
                              //       }));
                              // }


                              //   Navigator.push((context),
                              //       MaterialPageRoute(builder: (context){
                              //         return AfterTrainerFormSubmission();
                              //       }));
                               },
                          child:  Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
