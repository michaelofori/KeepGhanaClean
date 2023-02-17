import 'package:flutter/material.dart';
import 'package:ghana/pages/home.dart';
import '../pages/upload.dart';

AppBar header(context, {bool isAppTitle = false, required String titleText}) {
  return AppBar(
    title: Text(
      isAppTitle ? "Keep Ghana Clean" : titleText,
      style: TextStyle(
        color: Colors.black,
        fontFamily: isAppTitle ? "Signatra" : "",
        fontSize: isAppTitle ? 30.0 : 20.0,
      ),
    ),
    centerTitle: true,
    elevation: 0.1,
    backgroundColor: Theme.of(context).accentColor,
    //backgroundColor: Colors.tealAccent,
    leading: IconButton(
      icon: const Icon(
        Icons.menu,
        color: Color.fromARGB(255, 138, 23, 23),
      ),
      onPressed: () {
           const Drawer();
      },
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Upload(),
            ),
          );
        },
        icon: const Icon(
          Icons.photo_camera_outlined,
          color: Colors.black,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.share,
          color: Colors.black,
        ),
      ),
    ],
    automaticallyImplyLeading: false,
  );
  
}

class appBarHeader extends StatefulWidget{


  
   @override
  Widget build(context, {bool isAppTitle = false, required String titleText}) {
    return AppBar(
    title: Text(
      isAppTitle ? "Keep Ghana Clean" : titleText,
      style: TextStyle(
        color: Colors.black,
        fontFamily: isAppTitle ? "Signatra" : "",
        fontSize: isAppTitle ? 30.0 : 20.0,
      ),
    ),
    centerTitle: true,
    elevation: 0.1,
    backgroundColor: Theme.of(context).accentColor,
    //backgroundColor: Colors.tealAccent,
    leading: IconButton(
      icon: const Icon(
        Icons.menu,
        color: Color.fromARGB(255, 138, 23, 23),
      ),
      onPressed: () {
           const Drawer();
      },
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Upload(),
            ),
          );
        },
        icon: const Icon(
          Icons.photo_camera_outlined,
          color: Colors.black,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.share,
          color: Colors.black,
        ),
      ),
    ],
    automaticallyImplyLeading: false,
  );


  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
