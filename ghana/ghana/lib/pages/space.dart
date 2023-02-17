

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ghana/components/progress.dart';
import '../widgets/activity_card.dart';
import '../widgets/header.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class Space extends StatefulWidget {
  const Space({super.key});

  @override
  State<Space> createState() => _SpaceState();
}

class _SpaceState extends State<Space> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true, titleText: ''),
    
    );

    // appBar: header(context, isAppTitle: true, titleText: '' );
    // return Column(
    //   children: <Widget>[
    //     // const SizedBox(
    //     //   height: 10,
    //     // ),
    //     // appBarHeader(),
    //     ActivityCard(
    //       image: "assets/images/run.gif",
    //       bottomValue: 20,
    //       topValue: 100,
    //       type: GoalType.distance,
    //       onTopTap: () {
    //         //  Navigator.push(
    //         //     context,
    //         //     MaterialPageRoute(builder: (context) => const activityWalk()),
    //         //   );
    //       },
    //     ),
    //     ActivityCard(
    //       image: "assets/images/c2.gif",
    //       bottomValue: 50,
    //       topValue: 20,
    //       color: const Color.fromARGB(255, 26, 90, 185),
    //       type: GoalType.time,
    //       onTopTap: () {
    //         //  Navigator.push(
    //         //     context,
    //         //     MaterialPageRoute(builder: (context) => const timer()),
    //         //   );
    //       },
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: const [
    //           Text(
    //             "TRENDS FOR YOU",
    //             style: TextStyle(
    //               color: Colors.black,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
