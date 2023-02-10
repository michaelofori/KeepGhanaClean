

import 'package:flutter/material.dart';

import '../pages/upload.dart';

AppBar header(context){
  return AppBar(
    title: const Text(
            "Keep Ghana Clean",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Signatra",
              fontSize: 30.0),
          ),
          centerTitle: true,
          elevation: 0.1,
         backgroundColor: Theme.of(context).accentColor,
          //backgroundColor: Colors.tealAccent,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              // _key.currentState?.openDrawer();
            },
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  // context,
                  // MaterialPageRoute(builder: (context) => Upload(),
                  // );
                },
                icon: const Icon(
                  Icons.photo_camera_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                )),
          ],
          automaticallyImplyLeading: false,
  );
}