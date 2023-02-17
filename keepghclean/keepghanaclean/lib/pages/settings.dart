import 'package:flutter/material.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keepghanaclean/pages/instructions_page.dart';
import 'package:keepghanaclean/pages/login_or_register_page.dart';
import 'aboutuspage.dart';


final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

_signOut() async {
  await _firebaseAuth.signOut();
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color.fromARGB(255, 46, 90, 184),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //Log out
        children: [
          ListTile(
            leading: const Icon(CarbonIcons.enterprise),
            title: const Text("About Us"),
            onTap: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutUsPage()),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(CarbonIcons.information),
            title: const Text("Instructions"),
            onTap: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InstructionPage()),
                );
              }
            },
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log out"),
            onTap: () async {
              await _signOut();
              if (_firebaseAuth.currentUser == null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginOrRegisterPage()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}