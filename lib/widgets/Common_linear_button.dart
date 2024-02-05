import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'common_text_view.dart';

class CommonLinearButton extends StatefulWidget {
  String text;
  double? height;
  double? width;
  Color? textColor;
  Function()? onTap;
  Color? btnUperSideColor;
  Color? btnLowerSideColor;
  BorderRadiusGeometry? borderRadius;
  EdgeInsetsGeometry? marging;

  CommonLinearButton(
      {Key? key,
      required this.text,
      this.marging,
      this.height,
      this.onTap,
        this.btnUperSideColor,
        this.btnLowerSideColor,
      this.width,
      this.textColor,
      this.borderRadius})
      : super(key: key);

  @override
  State<CommonLinearButton> createState() => _CommonLinearButtonState();
}

class _CommonLinearButtonState extends State<CommonLinearButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: widget.marging ?? EdgeInsets.only(top: 4.h, bottom: 5.h),
        height: widget.height ?? 6.h,
        width: widget.width ?? 40.w,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.btnUperSideColor ?? Color(0xFFc2e7cc), // Start color
                widget.btnLowerSideColor ?? Color(0xFF9dcfd0), // End color
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(40)),
        alignment: Alignment.center,
        child: CommonTextView(
          widget.text,
          color: widget.textColor ?? Colors.black,
        ),
      ),
    );
  }
}
