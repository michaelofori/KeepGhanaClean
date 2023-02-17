import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'onboarding.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: const Onboarding(),
      duration: 4000,
      imageSize: 150,
      imageSrc: 'assets/images/1024.png',
      text: "Keep Ghana Clean",
      textType: TextType.NormalText,
      textStyle: const TextStyle(
        color: Color.fromARGB(255, 42, 23, 207),
        fontSize: 30.0,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );

    return MaterialApp(
      title: 'Splash screen Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: example1,
    );
  }
}
