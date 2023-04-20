import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keepghanaclean/pages/aboutuspage.dart';
import 'package:keepghanaclean/pages/home_page.dart';
import 'package:keepghanaclean/pages/instructions_page.dart';
import 'package:keepghanaclean/pages/league_table.dart';
import 'package:keepghanaclean/pages/location_sites.dart';
import 'package:keepghanaclean/pages/login_screen.dart';
import 'package:keepghanaclean/pages/settings.dart';
import 'package:keepghanaclean/pages/splash.dart';
import 'package:keepghanaclean/pages/upload.dart';
import 'package:keepghanaclean/points/rewardScreen.dart';
import 'firebase_options.dart';
import 'model/user_model.dart';
import 'news/viewsnews/homepage.dart';

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
          fontFamily: "Signatra",
          primarySwatch: Colors.blue,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.teal),
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

  List<bool> _pageColors = List.generate(10, (index) => index == 0);

  int currentIndex = 0;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void _setPage(BuildContext context, int pageNumber) {
    setState(() {
      _pageColors = List.generate(_pageColors.length, (index) => false);
      _pageColors[pageNumber] = true;
    });
    Navigator.pop(context);
  }

  Future<void> _signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: [
        AppBar(
          title: const Text(
            "Keep Ghana Clean",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Signatra",
              fontSize: 30.0,
            ),
          ),
          centerTitle: true,
          elevation: 0.1,
          backgroundColor: Theme.of(context).accentColor,
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
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                ListTile(
                                    title: Text("Camera"),
                                    onTap: () async {
                                      ImagePicker()
                                          .pickImage(source: ImageSource.camera)
                                          .then((image) {
                                        Navigator.pop(context, image);
                                      });
                                    }),
                                ListTile(
                                    title: Text("Gallery"),
                                    onTap: () async {
                                      ImagePicker()
                                          .pickImage(
                                              source: ImageSource.gallery)
                                          .then((image) {
                                        Navigator.pop(context, image);
                                      });
                                    }),
                              ]))).then((result) {
                    if (result != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Upload(image: result)),
                      );
                    }
                  });

                  // print("image selectyed from $result");
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
      body: HomePage(),
    );
  }

  Widget _myDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 37, 47, 138)),
            currentAccountPicture: CircleAvatar(
              radius: 50.0,
              // primarySwatch: Colors.blue,
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(user!.photoURL!),
              // backgroundImage:

              // NetworkImage("http://tineye.com/images/widgets/mona.jpg"),
            ),
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
            selected: _pageColors[0],
            onTap: () {
              // setState(
              //   () {
              //     homeColor = true;
              //     cartColor = false;
              //     aboutColor = false;
              //     contactUsColor = false;
              //     logOut = false;
              //   },
              // );

              _setPage(context, 0);
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
            selected: _pageColors[1],
            onTap: () {
              _setPage(context, 1);
              // Navigator.pop(context);
              // setState(
              //   () {
              //     currentIndex = 1;
              //     cartColor = true;
              //     homeColor = false;
              //     aboutColor = false;
              //     contactUsColor = false;
              //     logOut = false;
              // },
              // );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const MyStatefulWidget()),
              // );
            },
            leading: const Icon(Icons.topic),
            title: const Text("My Coupons"),
          ),
          ListTile(
            selected: _pageColors[2],
            onTap: () {
              _setPage(context, 2);
              // Navigator.pop(context);
              // setState(
              //   () {
              //     aboutColor = true;
              //     homeColor = false;
              //     cartColor = false;
              //     contactUsColor = false;
              //     logOut = false;
              //   },
              // );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RecycleSites()),
              );
            },
            leading: const Icon(Icons.location_city_sharp),
            title: const Text("Recycle Sites"),
          ),
          ListTile(
            selected: _pageColors[3],
            onTap: () {
              _setPage(context, 3);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LeagueTable()),
                // MaterialPageRoute(builder: (context) => const HomePAge2()),
              );
            },
            leading: const Icon(Icons.leaderboard_sharp),
            title: const Text("League Table"),
          ),
          ListTile(
            selected: _pageColors[4],
            onTap: () {
              _setPage(context, 4);

              Navigator.push(
                context,
              //  MaterialPageRoute(builder: (context) => LeagueTable()),
                 MaterialPageRoute(builder: (context) => NewsPage()),
              );
            },
            leading: const Icon(Icons.newspaper_outlined),
            title: const Text("News"),
          ),
          ListTile(
            selected: _pageColors[5],
            onTap: () {
              _setPage(context, 5);

              Navigator.push(
                context,
                //  MaterialPageRoute(builder: (context) => UserScreen()),
                MaterialPageRoute(builder: (context) => const rewardScreen()),
              );
            },
            leading: const Icon(Icons.redeem_outlined),
            title: const Text("Redeem Products"),
          ),
          ListTile(
            selected: _pageColors[6],
            onTap: () {
              _setPage(context, 6);

              // Navigator.push(
              //   context,
              //   // MaterialPageRoute(builder: (context) => const HomeScreen(title: 'Waste Classifier')),
              // );
            },
            leading: const Icon(Icons.support_agent_rounded),
            title: const Text("Support Center"),
          ),
          ListTile(
            selected: _pageColors[7],
            onTap: () {
              _setPage(context, 7);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InstructionPage()),
              );
            },
            leading: const Icon(Icons.integration_instructions_outlined),
            title: const Text("Instructions Page"),
          ),
          ListTile(
            selected: _pageColors[8],
            onTap: () {
              _setPage(context, 8);
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
