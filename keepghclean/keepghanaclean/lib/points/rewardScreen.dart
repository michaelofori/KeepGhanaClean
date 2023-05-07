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
       backgroundColor: Color.fromARGB(255, 153, 159, 167),   
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  Align(
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
              const SizedBox(height: 14),
              const VerticalCouponExample(),
              const SizedBox(height: 14),
              ListTile(
                shape: RoundedRectangleBorder(
                  //<-- SEE HERE
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 85, 106, 165),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset("assets/logo/voda.png"),
                  ),
                ),
                title: const Text(
                  'Vodafone Voucher',
                ),
                subtitle: const Text('Data for browsing'),
                trailing: const Icon(Icons.more_vert),
              ),
              const SizedBox(height: 14),
              ListTile(
                shape: RoundedRectangleBorder(
                  //<-- SEE HERE
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 85, 106, 165),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset("assets/logo/mtn.png"),
                  ),
                ),
                title: const Text(
                  'Mtn Voucher',
                ),
                subtitle: const Text('Data for browsing'),
                trailing: const Icon(Icons.more_vert),
              ),
              const SizedBox(height: 14),
              ListTile(
                shape: RoundedRectangleBorder(
                  //<-- SEE HERE
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 85, 106, 165),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset("assets/logo/total.png"),
                  ),
                ),
                title: const Text(
                  'Total Ghana shopping Voucher',
                ),
                subtitle: const Text('Redem for an item in any store.'),
                trailing: const Icon(Icons.more_vert),
              ),
              const SizedBox(height: 14),
              ListTile(
                shape: RoundedRectangleBorder(
                  //<-- SEE HERE
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 85, 106, 165),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset("assets/logo/shop.png"),
                  ),
                ),
                title: const Text(
                  'Shoprite Ghana',
                ),
                subtitle: const Text('Redem for an item in any store.'),
                trailing: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
