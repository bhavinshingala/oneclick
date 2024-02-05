import 'package:flutter/material.dart';

import 'constants.dart';
import '../screens/home_screen.dart';
import '../screens/other_screens.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          OtherScreens(),
          OtherScreens(),
          OtherScreens(),
          OtherScreens(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes the shadow position
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomNavigationBarItem('assets/home.png', 0),
            bottomNavigationBarItem('assets/briefcase.png', 1),
            bottomNavigationBarItem('assets/database.png', 2),
            bottomNavigationBarItem('assets/News.png', 3),
            bottomNavigationBarItem('assets/More.png', 4),
          ],
        ),
      ),
    );
  }

  Widget bottomNavigationBarItem(String imagePath, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: 24,
              height: 24,
              color: _selectedIndex == index ? darkTealColor : lightTealColor,
            ),
            if (_selectedIndex == index)
              Container(
                margin: EdgeInsets.only(top: 2),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: darkTealColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
