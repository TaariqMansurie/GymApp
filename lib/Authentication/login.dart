import 'package:GymApp/Authentication/register.dart';
import 'package:GymApp/Screens/userhome.dart';
import 'package:GymApp/Services/auth.dart';
import 'package:GymApp/Services/database.dart';
import 'package:GymApp/helper/helper_functions.dart';
import 'package:GymApp/shared/OrDivider.dart';
import 'package:GymApp/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  final AuthService _auth = AuthService();
 // final GoogleSignIn _googleSignIn = GoogleSignIn();

  final _formKey = GlobalKey<FormState>();
  //udemy2
  //final GoogleSignIn googleSignIn = new GoogleSignIn();


  bool isLoading = false;

  String error = '';

  //text field State
  String email = '';
  String password = '';

  //bool isLoading = false;
  // bool isLoggedIn = false;
  // FirebaseUser currentUser;

  signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

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

          Navigator.pop(context);
          Navigator.pop(context);
        } else {
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
    }
  }

  //sign in with google

  // signInWithGoogle() async {
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   final GoogleSignIn googleSignIn = new GoogleSignIn();
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.getCredential(
  //       idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

  //   final FirebaseUser user = (await FirebaseAuth.instance.signInWithCredential(credential)).user ;
  // }

// ek aur method google sign in ki




  // Future<FirebaseUser> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //
  //   // Create a new credential
  //   final AuthCredential credential = GoogleAuthProvider.getCredential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   return ((await FirebaseAuth.instance.signInWithCredential(credential)).user);
  //
  // }

/*
Future <Userr> signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = await FirebaseAuth.instance.signInWithCredential(credential);

    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print(user.uid);

   // return Future.value(true);
  }

}
*/


  //yash ki method

  // Future<Userr> signInWithhGoogle() async {
  //   try {
  //     final googleuser = await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //     await googleuser.authentication;
  //     final AuthCredential credentials = GoogleAuthProvider.getCredential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);
  //     final AuthResult authResult =
  //      await FirebaseAuth.instance.signInWithCredential(credentials);
  //     final FirebaseUser user = authResult.user;
  //     print(user.displayName);
  //    await Firestore.instance.collection(user);

  //     return _userfromfirebase(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  //udemy 2
  // Future <FirebaseUser> gSignIn() async {
  //   GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  //   GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  //   FirebaseUser user = await _auth.signInWithGoogle(
  //     idToken:googleSignInAuthentication.idToken,
  //     accessToken: googleSignInAuthentication.accessToken
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        elevation: 0.0,
        title: Text('Sign in to Fit Mumbai'),
        /* actions: <Widget>[
          FlatButton.icon(
            icon : Icon(Icons.person),
            label : Text('Register'),
            onPressed: () => widget.toggleView ,
            ),
        ],*/
      ),
    //  drawer: UserNavigationDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 120.0,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage(
                  //         'assets/assets/logo.png'),
                  //     fit: BoxFit.fill,
                  //   ),
                  //   shape: BoxShape.circle,
                  // ),
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: emailEditingController,
                    decoration:
                    textInputDecoration1.copyWith(hintText: 'Enter Email Id',icon: Icon(Icons.person),focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red[900]),
                      borderRadius: BorderRadius.circular(15.0),
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
                TextFormField(
                  controller: passwordEditingController,
                  decoration:
                  textInputDecoration1.copyWith(hintText: 'Enter Password',icon: FaIcon(FontAwesomeIcons.key,size: 20,),focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[900]),
                    borderRadius: BorderRadius.circular(15.0),
                  ),),
                  validator: (val) =>
                  val.length < 6 ? 'Enter a correct Password' : null,
                  obscureText: true,
                  // onChanged: (val) {
                  //   setState(() => password =val);
                  // },
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ForgotPassword()));
                      },
                      child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            "Forgot Password?",
                            style: simpleTextStyle(),
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
                RaisedButton(
                    color: Colors.deepPurple[500],
                    child: Text(
                      'Log in',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        //dynamic userCredential = await _auth.signInWithEmailAndPassword(email, password);
                        dynamic userCredential = signIn();

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
                      style: normalTextStyle(),
                    ),
                    InkWell(
                      child: Text(
                        "Sign up now",
                        style: TextStyle(
                            color: Colors.deepPurple[200],
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
                OrDivider(),
                SizedBox(
                  height: 10,
                ),
                // ButtonTheme(
                //   minWidth: 200.0,
                //   hoverColor: Colors.blue[200],
                //   child: RaisedButton(
                //     child: Text(' Sign In With Google'),
                //     color: Colors.blue[800],
                //     hoverColor: Colors.blue[200],
                //     elevation: 5,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(40)),
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => signInWithGoogle()),
                //       );
                //     },
                //   ),
                // ),
                MaterialButton(padding: EdgeInsets.zero,
                  onPressed: ()  {
                    // await signInWithGoogle() ??
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => UserHome()));
                  },
                  child: Image(image: AssetImage('assets/googlesignin.png'),
                    width : 200.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
