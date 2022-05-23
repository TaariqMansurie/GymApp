class User {
  String displayName;
  final String uid;
  final String uidd;
  final String profilePhoto;
  final String title ;
  final String description ;
  final DateTime dateTime ;

  User({
    this.uid,
    this.uidd ,
    this.profilePhoto,
    this.title,
    this.description,
    this.dateTime
  });
}

class MaleTrainer{
  String uid ;
  String profilePhoto;
  String title ;
  String age;
  String certifications ;
  String name;

  MaleTrainer({
    this.uid,
    this.profilePhoto,
    this.title,
    this.age,
    this.certifications,
    this.name,
  });
}

class FemaleTrainer{
  String uid ;
  String profilePhoto;
  String title ;
  String age;
  String certifications ;
  String name;

  FemaleTrainer({
    this.uid,
    this.profilePhoto,
    this.title,
    this.age,
    this.certifications,
    this.name,
  });
}