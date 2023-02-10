import 'package:flutter/material.dart';
import 'package:ghana/pages/settings.dart';
import 'package:ghana/pages/upload.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'aboutuspage.dart';
import 'instructions_page.dart';
import 'space.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //authentication of cpslash scren for when user is sign in or not
  //when user sign in the splash screen does not show
  bool isAuth = false;
  late PageController pageController;
  int pageIndex = 0;

//from old app
  // final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  // List pages = [
  //   const Home(),
  //   //const Messages(),
  //   //
  // ];

  // User? user = FirebaseAuth.instance.currentUser;

  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // bool homeColor = true;
  // bool cartColor = false;
  // bool aboutColor = false;
  // bool contactUsColor = false;
  // bool logOut = false;
  // int currentIndex = 0;

  // void onTap(int index) {
  //   setState(
  //     () {
  //       currentIndex = index;
  //     },
  //   );
  // }

//from old app

  @override
  void initState() {
    super.initState();
    pageController = PageController(

    );
    //detects when the user is sign in
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account!);
    }, onError: (err) {
      print('Error signing in: $err');
    });
    //reauthenticate user when the app is open
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account!);
    }).catchError((err) {
      print('Error signing in: $err');
    });
  }

  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      print('User signed in!: $account');
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        //if authenitcation is false user is then you authentication screen
        isAuth = false;
      });
    }
  }

  //login method
  login() {
    googleSignIn.signIn();
  }

  //logout method
  logout() {
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  //authentication screen
  Scaffold buildAuthScreen() {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Space()      
        ],
        controller: pageController,
        onPageChanged:
         onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
    // return Scaffold(
    //   key: _key,
    //   appBar: [
    //     AppBar(
    //       title: const Text(
    //         "Keep Ghana Clean",
    //         style: TextStyle(color: Colors.black),
    //       ),
    //       centerTitle: true,
    //       elevation: 0.1,
    //       backgroundColor: Color.fromARGB(255, 46, 90, 184),
    //       leading: IconButton(
    //         icon: const Icon(
    //           Icons.menu,
    //           color: Colors.black,
    //         ),
    //         onPressed: () {
    //           _key.currentState?.openDrawer();
    //         },
    //       ),
    //       actions: <Widget>[
    //         IconButton(
    //             onPressed: () {
    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(builder: (context) => Upload()),
    //               );
    //             },
    //             icon: const Icon(
    //               Icons.photo_camera_outlined,
    //               color: Colors.black,
    //             )),
    //         IconButton(
    //             onPressed: () {},
    //             icon: const Icon(
    //               Icons.share,
    //               color: Colors.black,
    //             )),
    //       ],
    //       automaticallyImplyLeading: false,
    //     ),
    //     AppBar(
    //       title: const Text("Profile"),
    //       backgroundColor: Color.fromARGB(255, 46, 90, 184),
    //       actions: <Widget>[
    //         IconButton(
    //           icon: const Icon(
    //             Icons.settings,
    //             color: Colors.white,
    //           ),
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => SettingsPage()),
    //             );
    //           },
    //         )
    //       ],
    //     ),
    //   ][currentIndex],
    //   drawer: _myDrawer(),
    //   body: pages[currentIndex],
    // );

    // return ElevatedButton(
    //   child: Text('Logogut'),
    //   onPressed:logout,
    // );
  }

  // Widget _myDrawer() {
  //   return Drawer(
  //     child: ListView(
  //       children: <Widget>[
  //         UserAccountsDrawerHeader(
  //           decoration:
  //               const BoxDecoration(color: Color.fromARGB(255, 37, 47, 138)),
  //           accountName: Text("name"
  //               // user!.displayName ?? "user name",
  //               // style: const TextStyle(color: Colors.black),
  //               ),
  //           accountEmail: Text("email"
  //               // user!.email!,
  //               // style: const TextStyle(
  //               //   color: Colors.black54,
  //               //   fontWeight: FontWeight.w500,
  //               // ),
  //               ),
  //         ),
  //         ListTile(
  //           selected: homeColor,
  //           onTap: () {
  //             setState(
  //               () {
  //                 homeColor = true;
  //                 cartColor = false;
  //                 aboutColor = false;
  //                 contactUsColor = false;
  //                 logOut = false;
  //               },
  //             );
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => Home()),
  //             );
  //           },
  //           leading: const Icon(Icons.home),
  //           title: const Text("Home"),
  //         ),
  //         ListTile(
  //           selected: cartColor,
  //           onTap: () {
  //             Navigator.pop(context);
  //             setState(
  //               () {
  //                 currentIndex = 1;
  //                 cartColor = true;
  //                 homeColor = false;
  //                 aboutColor = false;
  //                 contactUsColor = false;
  //                 logOut = false;
  //               },
  //             );
  //             // Navigator.push(
  //             //   context,
  //             //   MaterialPageRoute(builder: (context) => const MyStatefulWidget()),
  //             // );
  //           },
  //           leading: const Icon(Icons.topic),
  //           title: const Text("My Coupons"),
  //         ),
  //         ListTile(
  //           selected: aboutColor,
  //           onTap: () {
  //             Navigator.pop(context);
  //             setState(
  //               () {
  //                 aboutColor = true;
  //                 homeColor = false;
  //                 cartColor = false;
  //                 contactUsColor = false;
  //                 logOut = false;
  //               },
  //             );
  //             // Navigator.push(
  //             //   context,
  //             //   MaterialPageRoute(builder: (context) => uploadCars()),
  //             // );
  //           },
  //           leading: const Icon(Icons.location_city_sharp),
  //           title: const Text("Recycle Sites"),
  //         ),
  //         ListTile(
  //           selected: contactUsColor,
  //           onTap: () {
  //             setState(
  //               () {
  //                 contactUsColor = true;
  //                 homeColor = false;
  //                 cartColor = false;
  //                 aboutColor = false;
  //                 logOut = false;
  //               },
  //             );
  //             // Navigator.push(
  //             //   context,
  //             //   MaterialPageRoute(builder: (context) => Profile()),
  //             // );
  //           },
  //           leading: const Icon(Icons.leaderboard_sharp),
  //           title: const Text("League Table"),
  //         ),
  //         ListTile(
  //           selected: contactUsColor,
  //           onTap: () {
  //             setState(
  //               () {
  //                 contactUsColor = true;
  //                 homeColor = false;
  //                 cartColor = false;
  //                 aboutColor = false;
  //                 logOut = false;
  //               },
  //             );
  //             // Navigator.push(
  //             //   context,
  //             //   MaterialPageRoute(builder: (context) => Profile()),
  //             // );
  //           },
  //           leading: const Icon(Icons.redeem_outlined),
  //           title: const Text("Redeem Products"),
  //         ),
  //         ListTile(
  //           selected: contactUsColor,
  //           onTap: () {
  //             setState(
  //               () {
  //                 contactUsColor = true;
  //                 homeColor = false;
  //                 cartColor = false;
  //                 aboutColor = false;
  //                 logOut = false;
  //               },
  //             );
  //             // Navigator.push(
  //             //   context,
  //             //   MaterialPageRoute(builder: (context) => Profile()),
  //             // );
  //           },
  //           leading: const Icon(Icons.support_agent_rounded),
  //           title: const Text("Support Center"),
  //         ),
  //         ListTile(
  //           selected: contactUsColor,
  //           onTap: () {
  //             setState(
  //               () {
  //                 contactUsColor = true;
  //                 homeColor = false;
  //                 cartColor = false;
  //                 aboutColor = false;
  //                 logOut = false;
  //               },
  //             );
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => const InstructionPage()),
  //             );
  //           },
  //           leading: const Icon(Icons.integration_instructions_outlined),
  //           title: const Text("Instructions Page"),
  //         ),
  //         ListTile(
  //           selected: contactUsColor,
  //           onTap: () {
  //             setState(
  //               () {
  //                 contactUsColor = true;
  //                 homeColor = false;
  //                 cartColor = false;
  //                 aboutColor = false;
  //                 logOut = false;
  //               },
  //             );
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => const AboutUsPage()),
  //             );
  //           },
  //           leading: const Icon(Icons.contact_support),
  //           title: const Text("About Us"),
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.logout),
  //           title: const Text("Log out"),
  //           onTap: () async {
  //             logout();
  //             // await _signOut();
  //             // if (_firebaseAuth.currentUser == null) {
  //             //   Navigator.push(
  //             //     context,
  //             //     MaterialPageRoute(builder: (context) => const LoginScreen()),
  //             //   );
  //             // }
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).accentColor.withBlue(344),
              Theme.of(context).primaryColor.withRed(245),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Keep Ghana Clean',
              style: TextStyle(
                fontFamily: "Signatra",
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: login,
              child: Container(
                width: 260.0,
                height: 60.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/google-signin-button.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //building auth screen
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
