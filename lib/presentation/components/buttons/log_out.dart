import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../resources/styles_manager.dart';
import '../../resources/theme_manager.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key, required this.logOut});
  final VoidCallback logOut;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: logOut,
        style: TextButton.styleFrom(
            backgroundColor: ThemeManager.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.sp),
            )),
        child: Text(
          "Log out",
          style:
              getBoldStyle(fontSize: 11.sp, color: ThemeManager.oppositeColor),
        ));
  }
}
