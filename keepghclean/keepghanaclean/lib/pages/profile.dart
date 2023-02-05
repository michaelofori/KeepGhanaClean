import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keepghanaclean/pages/login_or_register_page.dart';
import '../model/user_model.dart';
import 'settings.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
  
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
  
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 150,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.png"),
                  radius: 70.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(
                    
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                user!.displayName ?? "user name",
                // "${loggedInUser.firstName} ${loggedInUser.secondName}",
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(user!.email!,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 15,
              ),
              // ActionChip(
              //   label: Text("Logout"),
              //   onPressed: () {
              //     logout(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginOrRegisterPage()));
  }
}