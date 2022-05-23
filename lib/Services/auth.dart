import 'package:GymApp/shared/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String> googleSignIn() async {
    try{
      final GoogleSignInAccount googleSignInAccount = await _googleSignIn
          .signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
          .authentication;
      final AuthCredential authCredential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.accessToken,
          accessToken: googleSignInAuthentication.idToken);
      final AuthResult userCredential = await _auth.signInWithCredential(
          authCredential
      );
      final FirebaseUser user = userCredential.user;
      print(user.displayName);
      print(user.email);
      assert(user.displayName != null);
      assert(user.email != null);

      final User currentUser = _auth.currentUser as User;
      assert(currentUser.uid == user.uid);

      return 'Error occured';
  } catch (error) {
  print(error.toString());
  return null;
  }
      // final UserCredential userCredential = await _auth.signInWithCredential(authCredential);
      // final FirebaseUser userCredential = (await _auth.signInWithCredential(authCredential)).user;
      // final User user = userCredential.i
  }

  // //sign in with google
  // signInWithGoogle() async {
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //
  //   final AuthCredential credential = GoogleAuthProvider.getCredential(
  //       idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  //
  //    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user ;
  // }

  //Create user obj based on FirebaseUser where we will only be storing the user uid

  // after running the application we shouldn't see the fireabse user uid instead we should be seeing our custom made userr & if u run it with print(result.uid) then we will be getting the resulted uid
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream which will detect authentication changes
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(
        _userFromFirebaseUser); //mapping will provide us the stream of our custom users and not the firebase users
  } //map((FirebaseUser userr)=> _userFromFirebaseUser(userr))
    //so when we use this we will be setting up a stream for auth changes listening for auth changes & whenever an auth change occurs we get back a value in the stream . that value is either gonna be user object based on our user class if the auth changes refuses sigining in or it wll be a null value if the user signs out

  //sign in anom

  //get UID from database
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }

  //to display username from database
  Future<FirebaseUser> getCurrentUser() async {
    return await _auth.currentUser();
  }

  // Future uploadPic(BuildContext context) async {
  //   String filename = basename(_image.path);
  //   StorageReference firebaseStorageReeference = FirebaseStorage.instance.reference().child(filename);
  //   StorageUploadTask uploadTask = firebaseStorageReeference.putfile(_image);
  //   StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete ;
  // }

  //register with email and password
  Future<User> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = userCredential.user;
      // print(user.uid);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //reset the password

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}