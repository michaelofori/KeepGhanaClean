import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //google sign in
  signInWithGoogle() async {
    //begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

  //obtain auth details from request
  final GoogleSignInAuthentication gAuth = await gUser!.authentication;

  //create a new credential for user
  final credential = GoogleAuthProvider.credential(
    accessToken: gAuth.accessToken,
    idToken: gAuth.idToken,
  );

  // getProfileImage(){
  //   if(FirebaseAuth.instance.currentUser?.photoURL != null){
  //     return Image.network(FirebaseAuth.instance.currentUser?.photoURL, height: 100, width: 100);
  //   }else {
  //     return Icon(Icons.account_circle, size: 100);
  //   }

  // }

  

  //final sign in
  return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}