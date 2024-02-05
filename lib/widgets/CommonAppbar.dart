import 'package:flutter/material.dart';
import 'package:oneclick_webearl_interview_project/widgets/constants.dart';
import 'package:sizer/sizer.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  Widget? leading;
  List<Widget>? actions;
  bool? centerTitle;
  Widget? title;

  CommonAppbar({Key? key, this.leading, this.actions, this.centerTitle, this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: leading ??
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.all(0),
              height: 10,
              width: 10,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                "assets/User_Image.png",
                fit: BoxFit.contain, // or BoxFit.scaleDown
              ),
            ),
        title: title ?? Container(
          height: 17,
          child: Image.asset("assets/Logo_OneClick.png"),
        ),
        centerTitle: centerTitle ?? false,
        actions: actions ?? [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: greyColor)),
            child: Icon(
              Icons.notifications_none_rounded,
              size: 30,
              color: greyColor,
            ),
          )
        ],
        backgroundColor: whiteColor,
        bottomOpacity: 0,
      ),
    );
  }
}
