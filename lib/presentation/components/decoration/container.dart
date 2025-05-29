import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../resources/theme_manager.dart';

Widget line() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 3.w),
    decoration: BoxDecoration(
        color: ThemeManager.secondaryColor,
        borderRadius: BorderRadius.circular(4.sp)),
    height: 2.sp,
  );
}
