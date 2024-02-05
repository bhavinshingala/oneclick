import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color lightTealColor = Color(0xff4da7ad);
Color darkTealColor = Color(0xff00818a);
Color whiteColor = Color(0xffffffff);
Color backgroundColor = Color(0xffffffff);
Color greyColor = Color(0xffdadada);
Color redColor = Color(0xfffb594f);
Color greenColor = Color(0xff74cc7e);
Color indicatorColor = Color(0xff80c0c4);

const String baseUrl = "";

///multiple textfield validation:
void showSnackBarWithTitleAndText(String title, String message) {
  Get.snackbar(title, message,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent  /*.withOpacity(0.5)*/,
      animationDuration: Duration(milliseconds: 500),
      duration: Duration(seconds: 2));
}
