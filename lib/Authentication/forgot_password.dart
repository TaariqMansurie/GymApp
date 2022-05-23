import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {


  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailreset = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Color(0xffffc400)
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                'Enter Your Email',
                style: TextStyle(fontSize: 30, color: Colors.blueGrey),
              ),
              TextFormField(
                controller: emailreset,

                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.blueGrey,
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                  child: Text('Send Email'),
                  onPressed: () async{
                    if(emailreset.text != null){
                      try {
                        _auth.sendPasswordResetEmail(email: emailreset.text).whenComplete(() {
                          Navigator.pop(context);
                        });
                      } catch (e) {
                        print(e);
                        Fluttertoast.showToast(
                            msg: "please enter your email !",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR,
                            backgroundColor: Colors.black,
                            textColor: Color(0xffffc400));
                      }
                    }else{
                      Fluttertoast.showToast(
                          msg: "please enter your email !",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          backgroundColor: Colors.black,
                          textColor: Color(0xffffc400));
                    }
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }
}