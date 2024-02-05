import 'package:flutter/material.dart';
import 'package:oneclick_webearl_interview_project/widgets/constants.dart';
import 'package:sizer/sizer.dart';


class CommonTextView extends StatelessWidget {
  String text;
  Color? color;
  double? fontSize;
  TextAlign? textAlign;
  String? fontFamily;
  int? maxLine;
  FontWeight? fontWeight;
  TextOverflow? textOverflow;
  TextDecoration? textDecoration;

  CommonTextView(this.text,
      {Key? key,
      this.fontSize,
      this.fontFamily,
      this.color,
      this.textAlign,
        this.textDecoration,
      this.maxLine,
        this.textOverflow,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine ?? 2,
      overflow: textOverflow ?? TextOverflow.clip,
      style: TextStyle(
          fontSize: fontSize ?? 10.sp,
          fontFamily: fontFamily,
          color: color ?? greyColor,
          decoration: textDecoration,
          fontWeight: fontWeight ?? FontWeight.bold),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
