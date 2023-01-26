import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    return Container(
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(height: 10,),
        //  Container(
        //     margin: EdgeInsets.symmetric(
        //       // horizontal: getProportionateScreenWidth(20),
        //     ),
        //     height: 150,
        //     width: 350,
        //     decoration: BoxDecoration(
        //       color: Color.fromARGB(255, 39, 100, 150),
        //     // alignment: Alignment.center,
        //     borderRadius: BorderRadius.circular(20)
        //     ),
        //      child: Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 10),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text ("Total Distance Walked" ,
        //         style: TextStyle(
        //           color: Colors.black,
        //         ),
        //         ),
        //         Text("Set Goal")
        //       ],
        //     ),
        //     ),
            
        //   ),

          ActivityCard(
            image: "assets/images/on1.jpg",
            bottomValue: 20,
            topValue: 100,
            type: GoalType.distance,
            onTopTap: (){
              
            },
          ),

          
          ActivityCard(
            
            image: "assets/images/on1.jpg",
            bottomValue: 50,
            topValue: 20,
            color: Colors.red,
            type: GoalType.time,
          ),
          





          //  Container(
          //   margin: EdgeInsets.symmetric(
          //     // horizontal: getProportionateScreenWidth(20),
          //   ),
          //   height: 150,
          //   width: 350,
          //   decoration: BoxDecoration(
          //     color: Color.fromARGB(255, 39, 100, 150),
          //   // alignment: Alignment.center,
          //   borderRadius: BorderRadius.circular(20)
          //   ),
          //   child: Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text ("Total Time Spent" ,
          //       style: TextStyle(
          //         color: Colors.black,
          //       ),
          //       ),
          //       Text("Set Goal")
          //     ],
          //   ),
          //   ),
          // ),



          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text ("TRENDS FOR YOU" ,
                style: TextStyle(
                  color: Colors.black,
                ),
                ),
             
              ],
            ),
            ),
            CarouselSlider(
              items: [
        
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage('https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage('https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage('https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage('https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage('https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
  
          ],
              
            //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
          ),
        ],
      ),
      
    );
     body: ListView(
        children: [
        
        ],
      );
      
     
    
  }
}



class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
