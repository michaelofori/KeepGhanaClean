import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keepghanaclean/components/post_tile.dart';
import '../activity/activivty.dart';
import '../activity/timer.dart';
import '../model/user_model.dart';
import '../widgets/activity_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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

 

  //final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.grey[300],
  //     appBar: AppBar(
  //       backgroundColor: Colors.grey[900],
  //       actions: [
  //         IconButton(
  //           onPressed: signUserOut,
  //           icon: Icon(Icons.logout),
  //         )
  //       ],
  //     ),
  //     body: Center(
  //       child: Text(
  //         "LOGGED IN AS: " + user.email!,
  //         style: TextStyle(fontSize: 20),
  //       ),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height ,
        child: FutureBuilder<List<Map>>(
          initialData: const [
            {
              "distance" : 0,
              "time" : 0,
            },
            {}
          ],
          future: Future.wait([
            Future.delayed(Duration(seconds: 3), ()=> {'distance' : 400, 'time':12}),
            Future.delayed(Duration(seconds: 6), ()=> {}),
          ]),
          builder: ((context, snapshot) => Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: <Widget>[
            // const SizedBox(
            //   height: 10,
            // ),
            ActivityCard(
              image: "assets/images/run.gif",
              bottomValue: 20,
              topValue: snapshot.data!.first["distance"],
              type: GoalType.distance,
              onTopTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const activityWalk()),
                  );
              },
            ),
            ActivityCard(
              image: "assets/images/c2.gif",
              bottomValue: 50,
              topValue: snapshot.data!.first["time"],
              color: const Color.fromARGB(255, 26, 90, 185),
              type: GoalType.time,
               onTopTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const timer()),
                  );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "TRENDS FOR YOU",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: ListView.builder( //TODO fix height issue (card)
                scrollDirection: Axis.horizontal,
               itemBuilder: (context,index) => PostTile(),
              ),
            ),
        
             SizedBox(height: size.height * 0.05)
        
          ],
        ))
        ),
      ),
    );
  }

 
}
