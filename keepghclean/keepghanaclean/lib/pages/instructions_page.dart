import 'package:flutter/material.dart';
import '../Components/app_title.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? headline6 = Theme.of(context).textTheme.headline6;
    TextStyle? bodyText1 = Theme.of(context).textTheme.bodyText1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 46, 90, 184),
        title: const Text(
          "F A Q s",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Signatra",
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.1,
        //backgroundColor: Theme.of(context).accentColor,
        // title: const AppBarTitle(
        //   leadingTitle: 'FAQs',
        // ),
        actions: const [
          Icon(
            Icons.ac_unit,
            color: Colors.transparent,
          ),
          Icon(
            Icons.ac_unit,
            color: Colors.transparent,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How to find a location center',
                style: headline6,
              ),
              Text(
                'Go to the recycle sites page from the app navigation bar. Type the name of the prefered recycle site or view the recycle the sites closet via the full screen maps page.',
                style: bodyText1,
              ),
              const Divider(
                height: 16,
                thickness: 5,
                color: Color.fromARGB(255, 51, 76, 122),
              ),
              Text(
                'How to redem tokens',
                style: headline6,
              ),
              Text(
                'Go the the rewards screen from the navigation bar. Your current points would be displayed. Select the voucher you would like to redem.',
                style: bodyText1,
              ),
              const Divider(
                height: 16,
                thickness: 5,
                color: Color.fromARGB(255, 51, 76, 122),
              ),
              Text(
                'How to upload feed',
                style: headline6,
              ),
              Text(
                'Click on the camera icon on the app bar. Select "Camera" or "Galary" to upload an image. ',
                style: bodyText1,
              ),
              const Divider(
                height: 16,
                thickness: 5,
                color: Color.fromARGB(255, 51, 76, 122),
              ),
              Text(
                'How to track steps',
                style: headline6,
              ),
              Text(
                'Click on the the step activity tracker. The application would automatically track your steps.',
                style: bodyText1,
              ),
              const Divider(
                height: 16,
                thickness: 5,
                color: Color.fromARGB(255, 51, 76, 122),
              ),
              Text(
                'How to set timer.',
                style: headline6,
              ),
              Text(
                'CLick on the timer activity card. You can scroll the timer to slect the time and tap start.',
                style: bodyText1,
              ),
              const Divider(
                height: 16,
                thickness: 5,
                color: Color.fromARGB(255, 51, 76, 122),
              ), 
            ],
          ),
        ),
      ),
    );
  }
}
