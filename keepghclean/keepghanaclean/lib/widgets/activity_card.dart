import 'package:flutter/material.dart';

enum GoalType {
  time,
  distance,
}

class ActivityCard extends StatelessWidget {
  final double height;
  final double width;
  // final double distance;
  final String image;
  final Color color;
  final int topValue;
  final int bottomValue;
  final Function()? onTopTap;
  final Function()? onBottomTap;
  final GoalType type;
  ActivityCard(
      {this.height = 150,
      this.width = 350,
      // required this.distance,
      required this.image,
      required this.topValue,
      required this.bottomValue,
      this.onBottomTap,
      this.color = Colors.blue,
      this.onTopTap,
      this.type = GoalType.distance,
      super.key});

  final Map<String, String> label_unit = {
    "time spent": "min",
    "distance walked": "steps"
  };

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(
          // horizontal: getProportionateScreenWidth(20),
          ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          // Top section
          InkWell(
            onTap: onTopTap,
            child: Container(
              height: height * 0.73,
              width: 350,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: color.withAlpha(180),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12))),
              child: Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "$topValue ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: label_unit.values.elementAt(type.index),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                          )
                        ],
                      ),
                    ),

                    // Icon(Icons.image),
                     Image.asset(
                      image,
                      height: height * 0.7,
                      width: 90,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),
            ),
          ),

          // Bottom Section
          InkWell(
            onTap: onBottomTap,
            child: Container(
              height: height * 0.26,
              width: width,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(12))),
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total ${label_unit.keys.elementAt(type.index)}"),
                  const Text("Set Goal")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
