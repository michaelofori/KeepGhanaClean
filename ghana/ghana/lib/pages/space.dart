import 'package:flutter/material.dart';

import '../widgets/header.dart';

class Space extends StatefulWidget {
  const Space({super.key});

  @override
  State<Space> createState() => _SpaceState();
}

class _SpaceState extends State<Space> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: header(context),
     );
  }
}