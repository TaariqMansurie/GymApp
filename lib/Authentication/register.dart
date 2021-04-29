import 'package:GymApp/Screens/userhome.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/helper/helper_functions.dart';
import 'package:GymApp/shared/OrDivider.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:flutter/material.dart';

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

//final TextEditingController confirmpassword = TextEditingController();

  //text field State
  String email = '';
  String password = '';
  String confirmpassword = '';
  String gender = '';
  String username = '';
  String error = '';

//textEditingControllers

  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController genderEditingController = new TextEditingController();

  singUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      _auth
          .registerWithEmailAndPassword(
          emailEditingController.text, passwordEditingController.text)
          .then((result) async {
        if (result != null) {
          Map<String, String> userDataMap = {
            "userName": usernameEditingController.text,
            "userEmail": emailEditingController.text,
            "uid": result.uid,
          };

          HelperFunctions.saveUserEmailSharedPreference(
              emailEditingController.text);
          HelperFunctions.saveUserNameSharedPreference(
              usernameEditingController.text);
          print(userDataMap);
          await databaseMethods.addUserInfo(userDataMap);

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
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        elevation: 0.0,
        title: Text('Sign Up to Fit Mumbai'),
        /* actions: <Widget>[
          FlatButton.icon(
            icon : Icon(Icons.person),
            label : Text('Sign In'),
            onPressed: () => widget.toggleView(),
            ),
        ],*/
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
                  TextFormField(
                    controller: emailEditingController,
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
                    validator: (val) => val.isEmpty || val.length < 3
                        ? 'Enter a Username 3+ characters '
                        : null,
                    //  onChanged: (val) {
                    //   setState(() => username =val);
                    //  },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: passwordEditingController,
                    decoration: textInputDecoration1.copyWith(
                        hintText: 'Enter Password'),
                    validator: (val) => val.length < 6
                        ? 'Enter a Password 6+ chars long'
                        : null,
                    obscureText: true,
                    // onChanged: (val) {
                    //   setState(() => password =val);
                    //  },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration1.copyWith(
                        hintText: 'Confirm Your Password'),
                    validator: (val) {
                      if (val.isEmpty) return 'Empty';
                      if (val != confirmpassword)
                        return 'Passwords do not match';
                      return null;
                    },
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => confirmpassword = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: genderEditingController,
                    decoration: textInputDecoration1.copyWith(
                        hintText: 'Enter your Gender'),
                    onChanged: (val) {
                      setState(() => gender = val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                      color: Colors.deepPurple[500],
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),

                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await singUp();
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
                        style: simpleTextStyle(),
                      ),
                      InkWell(
                        child: Text(
                          "Login now",
                          style: TextStyle(
                              color: Colors.deepPurple[200],
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
}
