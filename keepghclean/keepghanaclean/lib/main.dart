import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:keepghanaclean/pages/aboutuspage.dart';
import 'package:keepghanaclean/pages/home_page.dart';
import 'package:keepghanaclean/pages/instructions_page.dart';
import 'package:keepghanaclean/pages/login_screen.dart';
import 'package:keepghanaclean/pages/settings.dart';
import 'package:keepghanaclean/pages/splash.dart';
import 'package:keepghanaclean/pages/upload.dart';
import 'firebase_options.dart';
import 'model/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Splash());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Keep Ghana Clean';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
      );
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

List pages = [
    HomePage(),
  ];

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  bool homeColor = true;
  bool cartColor = false;
  bool aboutColor = false;
  bool contactUsColor = false;
  bool logOut = false;
  int currentIndex = 0;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


   _signOut() async {
    await _firebaseAuth.signOut();
  }

   void onTap(int index) {
    setState(
      () {
        currentIndex = index;
      },
    );
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: [
        AppBar(
          title: const Text(
            "Keep Ghana Clean",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.1,
          backgroundColor: Color.fromARGB(255, 46, 90, 184),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              _key.currentState?.openDrawer();
            },
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Upload()),
                  );
                },
                icon: const Icon(
                  Icons.photo_camera_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                )),
          ],
          automaticallyImplyLeading: false,
        ),
        AppBar(
          title: const Text("Profile"),
          backgroundColor: Color.fromARGB(255, 46, 90, 184),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            )
          ],
        ),
      ][currentIndex],
      drawer: _myDrawer(),
       body: pages[currentIndex],
      
    );
  }

   Widget _myDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 37, 47, 138)),

            accountName: Text(
              user!.displayName ?? "user name",
              style: const TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              user!.email!,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(
                () {
                  homeColor = true;
                  cartColor = false;
                  aboutColor = false;
                  contactUsColor = false;
                  logOut = false;
                },
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyStatefulWidget()),
              );
            },
            leading: const Icon(Icons.home),
            title: const Text("Home"),
          ),
          ListTile(
            selected: cartColor,
            onTap: () {
              Navigator.pop(context);
              setState(
                () {
                  currentIndex = 1;
                  cartColor = true;
                  homeColor = false;
                  aboutColor = false;
                  contactUsColor = false;
                  logOut = false;
                },
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const MyStatefulWidget()),
              // );
            },
            leading: const Icon(Icons.topic),
            title: const Text("My Coupons"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              Navigator.pop(context);
              setState(
                () {
                  aboutColor = true;
                  homeColor = false;
                  cartColor = false;
                  contactUsColor = false;
                  logOut = false;
                },
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => uploadCars()),
              // );
            },
            leading: const Icon(Icons.location_city_sharp),
            title: const Text("Recycle Sites"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(
                () {
                  contactUsColor = true;
                  homeColor = false;
                  cartColor = false;
                  aboutColor = false;
                  logOut = false;
                },
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Profile()),
              // );
            },
            leading: const Icon(Icons.leaderboard_sharp),
            title: const Text("League Table"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(
                () {
                  contactUsColor = true;
                  homeColor = false;
                  cartColor = false;
                  aboutColor = false;
                  logOut = false;
                },
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Profile()),
              // );
            },
            leading: const Icon(Icons.redeem_outlined),
            title: const Text("Redeem Products"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(
                () {
                  contactUsColor = true;
                  homeColor = false;
                  cartColor = false;
                  aboutColor = false;
                  logOut = false;
                },
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Profile()),
              // );
            },
            leading: const Icon(Icons.support_agent_rounded),
            title: const Text("Support Center"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(
                () {
                  contactUsColor = true;
                  homeColor = false;
                  cartColor = false;
                  aboutColor = false;
                  logOut = false;
                },
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InstructionPage()),
              );
            },
            leading: const Icon(Icons.integration_instructions_outlined),
            title: const Text("Instructions Page"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(
                () {
                  contactUsColor = true;
                  homeColor = false;
                  cartColor = false;
                  aboutColor = false;
                  logOut = false;
                },
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()),
              );
            },
            leading: const Icon(Icons.contact_support),
            title: const Text("About Us"),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log out"),
            onTap: () async {
              await _signOut();
              if (_firebaseAuth.currentUser == null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
    );
  }


}
