import 'package:GymApp/Screens/userhome.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/Widgets/custom_password_field.dart';
import 'package:GymApp/helper/helper_functions.dart';
import 'package:GymApp/shared/OrDivider.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  HelperFunctions helperFunctions = new HelperFunctions();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;


  String _error;


  bool tikstate = false;
  bool outsideornot = false;

  final _authh =FirebaseAuth.instance ;

//final TextEditingController confirmpassword = TextEditingController();

  //text field State
  String email = '';
  String password = '';
  String confirmpassword = '';
 // String gender = '';
  String username = '';
  String error = '';


//textEditingControllers

  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController confirmPasswordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController genderEditingController = new TextEditingController();
  var selectedGender = 'Male';
  final List<String> genderList = ['Male', 'Female'];

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
  checkall(){
    if(_formKey.currentState.validate()){
      return true;
    }else{
      return false;
    }

  }

  singUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      _auth
          .registerWithEmailAndPassword(
          emailEditingController.text, passwordEditingController.text)
          .then((result) async {
        if (result != null && selectedGender != null) {
          Map<String, String> userDataMap = {
            "userName": usernameEditingController.text,
            "userEmail": emailEditingController.text,
            "uid": result.uid,
            'gender': selectedGender.toUpperCase().toString(),
          };
          HelperFunctions.saveUserEmailSharedPreference(
              emailEditingController.text);
          HelperFunctions.saveUserNameSharedPreference(
              usernameEditingController.text);
          HelperFunctions.saveUserIDSharedPreference(
              result.uid);

          print(userDataMap);
          await databaseMethods.addUserInfo(userDataMap);
          //
          // if(selectedGender != 'Female'){
          //   Navigator.pushReplacement(
          //       context, MaterialPageRoute(builder: (context) => MaleUserHome()));
          // }else{
          //   Navigator.pushReplacement(
          //       context, MaterialPageRoute(builder: (context) => FemaleUserHome()));
          // }
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => UserHome()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: Text(
          'Sign Up to Fitnezz Den',style: TextStyle(
            color: Color(0xffffc400)
        ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color(0xffffc400)
        ),
        automaticallyImplyLeading: true,
      ),
     // drawer: RegisterNavigationDrawer(),
      body: isLoading
          ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
          : Container(
        child: SingleChildScrollView(
          child: Container(
            padding:
            EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  alertBox(),
                  TextFormField(
                    controller: emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: textInputDecoration1.copyWith(
                        hintText: 'Enter Email Id'),
                    validator: (val) => val.isEmpty
                        ? 'Enter an valid email address'
                        : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: usernameEditingController,
                    decoration: textInputDecoration1.copyWith(
                        hintText: 'Enter a Username'),
                    validator: (val) => val.isEmpty || val.length < 4
                        ? 'Enter a Username 4+ characters '
                        : null,
                  ),
                  SizedBox(height: 20.0),

                  PasswordInputField(
                    icon: FontAwesomeIcons.key,
                    controller: passwordEditingController,
                  ),
                  SizedBox(height: 20.0),

                  PasswordInputField2(
                    icon: FontAwesomeIcons.key,
                    controller: confirmPasswordEditingController,
                  ),

                  SizedBox(height: 20.0),


                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
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
                                color: Colors.red[900],
                                width: 1,
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
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary : Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(color: Color(0xffffc400)),
                        ),
                      ),
                      onPressed: () async {
                      final val =checkall() ;
                        if (confirmPasswordEditingController.text ==
                            passwordEditingController.text) {
                          print(emailEditingController.text);
                          print(passwordEditingController.text);
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            await singUp();
                            setState(() {
                              isLoading = false;
                            });
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: "'Passwords don\'t match.Check Again",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.SNACKBAR,
                              backgroundColor: Colors.deepPurple[100],
                              textColor: Colors.black);
                        }
                      }),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(
                        color: Colors.redAccent, fontSize: 14.0),
                  ),
                  OrDivider(),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color:Colors.black
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "Login now",
                          style: TextStyle(
                              color: Color(0xffffc400),
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserSignIn()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget alertBox(){
    if(_error != null){
      return Row(
        children: [
          Expanded(
            child: Center(
              child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.warning_rounded, color: Colors.red,),
                      Text("$_error",textAlign: TextAlign.center, style: TextStyle(color: Colors.black54),)
                    ],
                  )
              ),
            ),
          ),
        ],
      );
    }else{
      return SizedBox(
        height: 20,
      );
    }

  }}
