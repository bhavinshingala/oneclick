import 'package:flutter/material.dart';

class OtherScreens extends StatefulWidget {
  const OtherScreens({Key? key}) : super(key: key);

  @override
  State<OtherScreens> createState() => _OtherScreensState();
}

class _OtherScreensState extends State<OtherScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This Screen Is Currently Not Available"),),
    );
  }
}
