import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keepghanaclean/Components/google_sign_in.dart';
import '../main.dart';

class GoogleSignIn extends StatefulWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  State<GoogleSignIn> createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(
            255, 238, 232, 232), primary: const Color.fromARGB(
            255, 193, 204, 214),
        maximumSize:
            const Size(double.infinity, 50),
      ),
      icon: const FaIcon(FontAwesomeIcons.google,
          color: Colors.red),
      label: const Text('Sign Up with Google'),
      onPressed: () async {
        googleLogin().then((value){
          if (value) {// if the sign in was successful
          Navigator.pushReplacement( context, MaterialPageRoute(builder: (context)=> const MyStatefulWidget()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("We couldn't sign you in")));
          }
        });
      },
    );
  }
}