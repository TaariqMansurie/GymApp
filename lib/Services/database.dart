import 'dart:io';
import 'dart:math';
import 'package:GymApp/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods{

  Future uploadImagesToFirebase( File pickedImage) async {
    final reff = FirebaseStorage.instance
        .ref()
        .child('admins')
        .child('1TilCrxUBPfuXZiAtWUkN26fGRe2')
        .child('images')
        .child(DateTime.now().millisecondsSinceEpoch.toString() + '.jpg');

    var snapshott = await reff.putFile(pickedImage).onComplete;
    var downloadUrll = await snapshott.ref.getDownloadURL();
    print(downloadUrll);

    await Firestore.instance.collection("admins").document('1TilCrxUBPfuXZiAtWUkN26fGRe2').updateData({
      "image_photo_url": FieldValue.arrayUnion([downloadUrll])
    });
  }

  Future<void> updateUserSessions(session, uid) async {
    Firestore.instance.collection("users").document(uid).updateData({
      "sessions": FieldValue.arrayUnion([session])
    });
  }

  searchByName (String searchField) {
    return Firestore.instance
        .collection('admins')
        .where('aName', isEqualTo: searchField)
        .getDocuments();
  }
  //
  // searchByEmail (String searchField,String userEmail) {
  //   return Firestore.instance
  //       .collection('users')
  //       .where(userEmail, isEqualTo: searchField)
  //       .getDocuments();
  // }

  static Future<DocumentSnapshot> searchByUID(String uid) {
    return Firestore.instance.collection('users').document(uid).get();
  }

  getChats(String chatRoomId) async {
    return await Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy('time', descending: false)
        .snapshots();
  }

  Future<void> addMessage(String chatRoomId, chatMessageData) {
    // chatMessageData = messageMap ,,, this is addConversationMessages
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserChats(String itIsMyName) async {
    return await Firestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    Firestore.instance
        .collection('chatRoom')
        .document(chatRoomId)
        .setData(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

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

    profileurl = downloadUrl ;

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
        .child('${DateTime.now()}.jpg');

    var snapshot = await ref.putFile(image).onComplete;
    var downloadUrl = await snapshot.ref.getDownloadURL();
    print(downloadUrl);

    maleTrainerUrl = downloadUrl ;
    print(maleTrainerUrl);
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
        .child('${DateTime.now()}.jpg');

    var snapshot = await ref.putFile(image).onComplete;
    var downloadUrll = await snapshot.ref.getDownloadURL();
    print(downloadUrll);

    femaleTrainerUrl = downloadUrll ;
    print(femaleTrainerUrl);

  }

  Future uploadFirstPicture(String uid, File image) async {
    var rng = new Random();
    String randomName = "";
    for (var i = 0; i < 100; i++) {
      print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
      //generate
    }

    final ref = FirebaseStorage.instance
        .ref()
        .child('blogs')
        .child(randomName + '.jpg');

    var snapshot = await ref.putFile(image).onComplete;
    var downloadUrlll = await snapshot.ref.getDownloadURL();
    print(downloadUrlll);


    firstPhotoUrl = downloadUrlll ;
    print(firstPhotoUrl);

  }

  Future uploadSecondPicture(String uid, File image) async {
    var rng = new Random();
    String randomName = "";
    for (var i = 101; i < 200; i++) {
      randomName += rng.nextInt(200).toString();
      //generate
    }
    final ref = FirebaseStorage.instance
        .ref()
        .child('blogs')
        .child(randomName + '.jpg');

    var snapshot = await ref.putFile(image).onComplete;
    var downloadUrllll = await snapshot.ref.getDownloadURL();
    print(downloadUrllll);

    secondPhotoUrl = downloadUrllll ;
    print(secondPhotoUrl);

  }

  Future uploadTrainerProfileForTrial(String uid, File image) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('trials')
        .child('${DateTime.now()}.jpg');

    var snapshot = await ref.putFile(image).onComplete;
    var downloadUrlllll = await snapshot.ref.getDownloadURL();
    print(downloadUrlllll);

    trialFormUrl = downloadUrlllll ;
    print(trialFormUrl);

  }


  // Future<void> addTrainerMaleInfo (name, uid, uidd) async {
  //   Firestore.instance
  //       .collection("users")
  //       .document(uid)
  //       .collection('maleTrainers')
  //       .document(uidd).updateData({
  //        "Male Trainer\'s Info": name.toString()
  //   });
  // }
  //
  // Future<void> addTrainerFemaleInfo (name, uid,uidd) async {
  //   Firestore.instance
  //       .collection("users")
  //       .document(uid).collection('femaleTrainers')
  //       .document(uidd).updateData({
  //        "Female Trainer\'s Info": name.toString()
  //   });
  // }

}

