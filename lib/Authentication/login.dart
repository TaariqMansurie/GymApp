import 'package:GymApp/Authentication/forgot_password.dart';
import 'package:GymApp/Authentication/register.dart';
import 'package:GymApp/Screens/admin_home.dart';
import 'package:GymApp/Screens/userhome.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/Widgets/custom_password_field.dart';
import 'package:GymApp/helper/helper_functions.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserSignIn extends StatefulWidget {
  final Function toggleView;
  UserSignIn({this.toggleView});

  @override
  _UserSignInState createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  AuthService authentication =  AuthService();

  final AuthService _auth = AuthService();
 // final GoogleSignIn _googleSignIn = GoogleSignIn();

  final _formKey = GlobalKey<FormState>();

  //udemy2
  //final GoogleSignIn googleSignIn = new GoogleSignIn();

  bool isLoading = false;
  String error = '';

  DocumentReference docref = Firestore.instance
      .collection('admins')
      .document('1TilCrxUBPfuXZiAtWUkN26fGRe2');

  CollectionReference ref = Firestore.instance
      .collection('admins') ;

  //
  // var selectedGender = '-';
  //
  // final List<String> genderList = ['-','Male', 'Female'];
  //
  // DropdownButtonFormField<String> androidDropdown() {
  //   List<DropdownMenuItem<String>> codes = [];
  //   for (String gender in genderList) {
  //     codes.add(
  //       DropdownMenuItem(
  //         child: Text(
  //           gender,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.montserrat(
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
  //   return DropdownButtonFormField<String>(
  //     isExpanded: true,
  //     dropdownColor: Colors.white,
  //     iconEnabledColor: Color(0xFF263238),
  //     value: selectedGender,
  //     items: codes,
  //     onChanged: (value2) {
  //       setState(
  //             () {
  //           selectedGender = value2.toString();
  //         },
  //       );
  //     },
  //       // validator: (val){
  //       //   if (val == '-'){
  //       //     return error ;
  //       //   }else {
  //       //     return selectedGender;
  //       //   }
  //       // },
  //   );
  // }

  // var selectedRole = '-';
  // final List<String> selectedRoleList = ['-','User', 'Admin'];
  //
  // DropdownButtonFormField<String> androidRoleDropdown() {
  //   List<DropdownMenuItem<String>> codes = [];
  //   for (String role in selectedRoleList) {
  //     codes.add(
  //       DropdownMenuItem(
  //         child: Text(
  //           role,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.montserrat(
  //             fontWeight: FontWeight.w400,
  //             fontSize: 16,
  //             color: Color(0xFF263238),
  //           ),
  //         ),
  //         value: role,
  //       ),
  //     );
  //   }
  //
  //   return DropdownButtonFormField<String>(
  //     isExpanded: true,
  //     dropdownColor: Colors.white,
  //     iconEnabledColor: Color(0xFF263238),
  //     value: selectedRole,
  //     items: codes,
  //     onChanged: (value) {
  //       setState(
  //             () {
  //           selectedRole = value.toString();
  //         },
  //       );
  //     },
  //     // validator: (val){
  //     //   if (val == '-'){
  //     //     return error ;
  //     //   }else {
  //     //     return selectedRole ;
  //     //   }
  //     // },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: Text(
          'Sign In to Fitnezz Den',style: TextStyle(
            color: Color(0xffffc400)
        ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        automaticallyImplyLeading: true,
      ),
      body: isLoading ?  Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : StreamBuilder<QuerySnapshot>(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // final aEmail = snapshot.data.documents[index].data['aEmail'];
          // final aPass = snapshot.data.documents[index].data['aPassword'];
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      width: 120.0,
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[100],
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: emailEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                        textInputDecoration1.copyWith(hintText: 'Enter Email Id',/*icon: Icon(Icons.person)*/
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red[900]),
                            borderRadius: BorderRadius.circular(15.0),gapPadding: 50.0
                        ),),
                        validator: (val) =>
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val)
                            ? null
                            : "Please Enter Correct Email",
                        // onChanged: (val) {
                        //   setState(() => email =val);
                        // },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[100],
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      height: 55,
                      child: PasswordInputField(
                        icon: FontAwesomeIcons.key,
                        controller: passwordEditingController,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Color(0xffffc400)
                                ),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    ButtonTheme(
                        minWidth: 300,
                        child: SizedBox(
                          height: 30.0,
                          width: 300,
                        )),
                    ElevatedButton(
                      style : ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                        child: Center(
                          child: Text(
                            'Log in',
                            style: TextStyle(color: Color(0xffffc400)),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            //dynamic userCredential = await _auth.signInWithEmailAndPassword(email, password);
                            dynamic userCredential = signIn();
                            setState(() {
                              isLoading = false;
                            });

                            if (userCredential == null) {
                              setState(() {
                                error = 'Could not sign in with those credentials';
                              });
                            } else {
                              return UserHome();
                            }
                          }
                        }),
                    SizedBox(height: 10.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account? ",
                          style: TextStyle(
                            color: Colors.black
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "Sign up now",
                            style: TextStyle(
                                color: Color(0xffffc400),
                                fontSize: 16,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

     final  aemail =  await docref.get().then((value) {
       return value.data['aEmail'];
     });
     final  apass =  await docref.get().then((value) {
       return value.data['aPassword'];
     });

     // final aEmail = await ref.where('aEmail',isEqualTo: emailEditingController.text) ;
     // final aPass = await ref.where('aPass',isEqualTo: passwordEditingController.text);
     //
     // final aEmaill = await ref.snapshots().forEach((element) {
     //   // element.docuts[];
     //  return element.documents.where((element) => element['aEmail'] == "${emailEditingController.text.toString()}");
     // });
     //  final aPasss = await ref.snapshots().forEach((element) {
     //    // element.docuts[];
     //   return element.documents.where((element) => element['aPass'] == "${passwordEditingController.text.toString()}");
     //  });

      await _auth
          .signInWithEmailAndPassword(
          emailEditingController.text, passwordEditingController.text)
          .then((result) async {
        if (result != null) {
          QuerySnapshot userInfoSnapshot =
          await DatabaseMethods().getUserInfo(emailEditingController.text);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.documents[0].data["userName"]);
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.documents[0].data["userEmail"]);
          HelperFunctions.saveUserIDSharedPreference(
              userInfoSnapshot.documents[0].data["id"]);

          if(emailEditingController.text == aemail && passwordEditingController.text == apass){
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => AdminHome()));
            Fluttertoast.showToast(msg: 'Admin has logged in !',
                textColor: Color(0xffffc400),
                backgroundColor: Colors.black,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER
            );
            setState(() {
              isLoading = false;
            });
          }else{
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => UserHome()));
            Fluttertoast.showToast(msg: 'User has logged in !',
                textColor: Color(0xfffcc400),
                backgroundColor: Colors.black,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER
            );
            setState(() {
              isLoading = false;
            });
          }
          setState(() {
            isLoading = false;
          });
          // Navigator.pop(context);
          // Navigator.pop(context);
        }
      });
    }
  }

}
