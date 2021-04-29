class User {
  String displayName;
  final String uid;
  final String profilePhoto;
  final String title ;
  final String description ;
  final DateTime dateTime ;

  User({
    this.uid,
    this.profilePhoto,
    this.title,
    this.description,
    this.dateTime
  });
}