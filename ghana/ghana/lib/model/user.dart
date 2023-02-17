import 'package:cloud_firestore/cloud_firestore.dart';


class Users{

  final String uid;
  final String profileName;
  final String userName;
  final String url;
  final String email;
 

  Users({
    required this.uid,
    required this.profileName,
    required this.userName,
    required this.url,
    required this.email,
    
  });

    Map<String, dynamic> toMap() {
    return {
      'id': uid,
      'profileName': profileName,
      'userName': userName,
      'url': url,
      'email': email   
    };
  }

  factory Users.fromMap(Map<String, dynamic> data) {
    return Users(
        uid: data["uid"],
        profileName: data["profileName"],
        userName: data["userName"],
        url: data["url"],
        email: data["email"]
    );  
  }


}