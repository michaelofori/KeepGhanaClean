import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class timer extends StatefulWidget {
  const timer({super.key});

  @override
  State<timer> createState() => _activityWalkState();
}

class _activityWalkState extends State<timer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Tracker"),
        centerTitle: true,
      ),
    );
  }
}
