import 'package:flutter/material.dart';
import 'package:coupon_uikit/coupon_uikit.dart';

import 'vertical_coupon_example.dart';
class rewardScreen extends StatefulWidget {
  const rewardScreen({super.key});

  @override
  State<rewardScreen> createState() => _rewardScreenState();
}

class _rewardScreenState extends State<rewardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Points",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Signatra",
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Column(
        children: [
          Row(
            children: const [
              SizedBox(
                height: 50, 
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Progress",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
              VerticalCouponExample(),
              SizedBox(height: 14),
          // ProgessBanner(
          //   items: items
          // )
        ],
      ),
    );
  }
}
