import 'package:flutter/material.dart';
import 'package:oneclick_webearl_interview_project/widgets/bottom_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp( Sizer(
    builder: (context, orientation, deviceType) {
      return const MyApp();
    },
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'oneclick',
      home: BottomScreen(),
    );
  }
}
