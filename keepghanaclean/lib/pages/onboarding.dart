
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keepghanaclean/pages/login_screen.dart';
import 'package:onboarding_screen/onboarding_screen.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

     return OnBoardingScreen(
      label: const Text(
        'Get Started',
        key: Key('get_started'),
      ),

      /// This function works when you will complete `OnBoarding`
      function: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => LoginScreen(),
          ),
        );
      },

      /// This [mySlides] must not be more than 5.
      mySlides: [
   _SliderModel(
      imageAssetPath: SvgPicture.asset('assets/icons/on1.svg',
      width: size.width * 0.8,
      height: size.height *0.5,
      fit: BoxFit.fitHeight,
      ),
      title: 'Ease',
      desc: 'Stress free platform to search for cars',
    ), 
  //  _SliderModel(
  //     imageAssetPath: Image.asset(
  //       'assets/icons/on1.svg',
  //       scale: 2,
  //     ),
  //      title: 'Recycle',
  //     desc: 'Lets Save the Planet',
  //     minTitleFontSize: 10,
  //     descStyle: const TextStyle(
  //       fontSize: 12,
  //       fontWeight: FontWeight.w400,
  //       color: Colors.black,
  //     ),
  //     titleStyle: const TextStyle(
  //       fontSize: 20,
  //       fontWeight: FontWeight.w400,
  //       color: Colors.black,
  //     ),
  //   ),
     _SliderModel(
      imageAssetPath: Image.asset(
        'assets/icons/on2.svg',
        scale: 2,
      ),
       title: 'Recycle',
      desc: 'Lets Save the Planet',
      minTitleFontSize: 10,
      descStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: SvgPicture.asset('assets/icons/on3.svg',
      width: size.width * 0.8,
      height: size.height *0.5,
      fit: BoxFit.fitHeight,
      ),
      title: 'Ease',
      desc: 'Stress free platform to search for cars',
    ),
     _SliderModel(
      imageAssetPath: Image.asset(
        'assets/icons/on4.svg',
        scale: 2,
      ),
       title: 'Recycle',
      desc: 'Lets Save the Planet',
      minTitleFontSize: 10,
      descStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: SvgPicture.asset('assets/icons/on5.svg',
      width: size.width * 0.8,
      height: size.height *0.5,
      fit: BoxFit.fitHeight,
      ),
      title: 'Ease',
      desc: 'Stress free platform to search for cars',
    ),
  
  
   
   
  ],
      controller: _controller,
      slideIndex: 0,
      statusBarColor: Colors.white,
      indicators: Indicators.cool,
      skipPosition: SkipPosition.bottomRight,
      skipDecoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      skipStyle: TextStyle(color: Colors.white),

      pageIndicatorColorList: [
        Colors.yellow,
        Colors.green,
        Colors.red,
        Colors.yellow,
        Colors.blue
      ],
    );
  }
    

  
 

}

class _SliderModel {
  const _SliderModel({
    this.imageAssetPath,
    this.title = "title",
    this.desc = "title",
    this.miniDescFontSize = 12.0,
    this.minTitleFontSize = 15.0,
    this.descStyle,
    this.titleStyle,
  });

  final Widget? imageAssetPath;
  final String title;
  final TextStyle? titleStyle;
  final double minTitleFontSize;
  final String desc;
  final TextStyle? descStyle;
  final double miniDescFontSize;
}