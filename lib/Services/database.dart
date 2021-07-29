import 'dart:io';
//import 'dart:math';
import 'package:GymApp/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DatabaseMethods{
  static String urll;
  static String urlll ;
  static String urllll ;

  Future<void> addUserInfo(userData) async {
    print(userData);
    Firestore.instance
        .collection("users")
        .document(userData['uid'])
        .setData(userData)
        .catchError((e) {
      print(e.toString());
    }).then((value) {
      print("{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{");

      print("{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{");
    });
  }

  getUserInfo(String email) async {
    return Firestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }

  //PROFILE PICTURE
  Future uploadProfilePicToFirebase(String uid, File image) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('profile_pictures')
        .child(uid + '.jpg');

    var snapshot = await ref.putFile(image).onComplete;
    var downloadUrl = await snapshot.ref.getDownloadURL();
    print(downloadUrl);

    downloadUrl = urll ;

    Firestore.instance
        .collection("users")
        .document(uid)
        .setData({'profile_pic_url' : downloadUrl}, merge: true) ;
        //.setData({'profile_pic_url' : downloadUrl},merge: true);
        //.updateData({"profile_photo_url": downloadUrl});
    // .updateData();
  }
  // Future uploadProfilePicToFirebaseFemale(String uid, File image) async {
  //   final ref = FirebaseStorage.instance
  //       .ref()
  //       .child('profile_pictures')
  //       .child(uid + '.jpg');
  //
  //   var snapshot = await ref.putFile(image).onComplete;
  //   var downloadUrl = await snapshot.ref.getDownloadURL();
  //   print(downloadUrl);
  //
  //   downloadUrl = urlll ;
  //
  //   // Firestore.instance
  //   //     .collection("users")
  //   //     .document(uid)
  //   //     .collection('maleTrainers')
  //   //     .document(uid)
  //   //     .setData({'profile_pic_url_tm' : downloadUrl},merge: true);
  //   // .updateData({"profile_photo_url": downloadUrl});
  //   // .updateData();
  // }

  Future uploadMaleTrainerProfile(String uid, File image) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('male_Trainers')
        .child(uid + '.jpg');

    var snapshot = await ref.putFile(image).onComplete;
    var downloadUrl = await snapshot.ref.getDownloadURL();
    print(downloadUrl);

   // downloadUrl = urlll ;
    downloadUrl = purl ;
    // Firestore.instance
    //     .collection("users")
    //     .document(uid)
    //     .collection('maleTrainers')
    //     .document(uid)
    //     .setData({'profile_pic_url_tm' : downloadUrl},merge: true);
    // .updateData({"profile_photo_url": downloadUrl});
    // .updateData();
  }

  Future uploadFemaleTrainerProfile(String uid, File image) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('female_Trainers')
        .child(uid + '.jpg');

    var snapshot = await ref.putFile(image).onComplete;
    var downloadUrl = await snapshot.ref.getDownloadURL();
    print(downloadUrl);

    downloadUrl = urllll ;

    // Firestore.instance
    //     .collection("users")
    //     .document(uid)
    //     .collection('maleTrainers')
    //     .document(uid)
    //     .setData({'profile_pic_url_tm' : downloadUrl},merge: true);
    // .updateData({"profile_photo_url": downloadUrl});
    // .updateData();
  }

  Future<void> addTrainerMaleInfo (name, uid, uidd) async {
    Firestore.instance
        .collection("users")
        .document(uid)
        .collection('maleTrainers')
        .document(uidd).updateData({
         "Male Trainer\'s Info": name.toString()
    });
  }

  Future<void> addTrainerFemaleInfo (name, uid,uidd) async {
    Firestore.instance
        .collection("users")
        .document(uid).collection('femaleTrainers')
        .document(uidd).updateData({
         "Female Trainer\'s Info": name.toString()
    });
  }

}

