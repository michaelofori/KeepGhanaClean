import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keepghanaclean/activity/activivty.dart';
import 'package:keepghanaclean/activity/timer.dart';
import 'package:keepghanaclean/widgets/activity_card.dart';
import '../model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // const SizedBox(
        //   height: 10,
        // ),
        ActivityCard(
          image: "assets/images/run.gif",
          bottomValue: 20,
          topValue: 100,
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
          topValue: 20,
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
      ],
    );
  }
}
