// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:expandable/expandable.dart';
// import '../components/coins_cup.dart';
// import '../components/reward_cup.dart';
// import '../constants/app_properties.dart';
// import '../constants/size_config.dart';
// import '../controllers/tips_notifier.dart';
// import '../model/Item.dart';

// class RewardsScreen extends StatefulWidget {
//   //static String routeName = "/rewards_screen";
//   final List<Item> items;
//   const RewardsScreen({Key? key, required this.items}) : super(key: key);

//   @override
//   _RewardsScreenState createState() => _RewardsScreenState();
// }

// class _RewardsScreenState extends State<RewardsScreen> {
//   late String title;
//   final String lorelEpsum = 'This is great product ...';
//   late ExpandableController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = ExpandableController();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     TipsNotifier tipsNotifier = Provider.of<TipsNotifier>(context);
//     var tip = tipsNotifier.getRandomTip();
//     int? totalPoints =
//         widget.items.fold(0, (sum, item) => (item.count * item.points) + sum!);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         bottomOpacity: 0.0,
//         elevation: 0.0,
//       ),
//       backgroundColor: white,
//       body: SafeArea(
//           child: SingleChildScrollView(
//               child: Column(children: [
//         SizedBox(height: getProportionateScreenHeight(5)),
//         totalPoints! > 0
//             ? RewardCup(items: widget.items)
//             : const Center(
//                 child: Text(""),
//               ),
//         SizedBox(height: getProportionateScreenHeight(10)),
//         CoinsCup(items: widget.items),
//         SizedBox(height: getProportionateScreenHeight(10)),
//         ListView(
//           shrinkWrap: true,
//           primary: false,
//           children: [buildCard(tip.name, tip.tips)],
//         )
//       ]))),
//     );
//   }

//   Widget buildCard(String title, List<String> _tips) => Padding(
//       padding: const EdgeInsets.all(20),
//       child: Card(
//         clipBehavior: Clip.antiAlias,
//         child: Container(
//             decoration: BoxDecoration(
//               color: const Color(0xff69c0dc),
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(3, 3), // changes position of shadow
//                 ),
//                 BoxShadow(
//                   color: Colors.white,
//                   offset: const Offset(0.0, 0.0),
//                   blurRadius: 0.0,
//                   spreadRadius: 0.0,
//                 ),
//               ],
//             ),
//             child: Column(children: <Widget>[
//               ExpandablePanel(
//                   controller: controller,
//                   theme: ExpandableThemeData(
//                       tapBodyToCollapse: true,
//                       tapBodyToExpand: true,
//                       iconColor: Colors.white),
//                   header: Padding(
//                     padding: EdgeInsets.fromLTRB(10, 10, 20,
//                         20), //apply padding to LTRB, L:Left, T:Top, R:Right, B:Bottom
//                     child: Text("Tips for managing $title waste",
//                         style: TextStyle(
//                             fontSize: getProportionateScreenWidth(16),
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                   collapsed: Text(
//                     _tips[0] + " " + _tips[1],
//                     style: TextStyle(
//                       fontSize: getProportionateScreenWidth(14),
//                       color: Colors.white,
//                     ),
//                     softWrap: true,
//                     maxLines: 6,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   expanded: Column(
//                       children: _tips.map((strone) {
//                     return Row(children: [
//                       Text(
//                         "\u2022",
//                         style: TextStyle(
//                           fontSize: getProportionateScreenWidth(16),
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ), //bullet text
//                       SizedBox(
//                           width: 8, height: 5), //space between bullet and text
//                       Expanded(
//                         child: Text(
//                           "$strone \n",
//                           style: TextStyle(
//                               fontSize: getProportionateScreenWidth(14),
//                               color: Colors.white),
//                         ), //text
//                       ),
//                     ]);
//                   }).toList()),
//                   builder: (_, collapsed, expanded) => Padding(
//                       padding: EdgeInsets.all(10).copyWith(top: 0),
//                       child: Expandable(
//                         collapsed: collapsed,
//                         expanded: expanded,
//                       )))
//             ])),
//       ));
// }
