import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../resources/styles_manager.dart';

showConnectionSnack() {
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    backgroundColor: const Color(0xffCB0000),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
    margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h),
    dismissDirection: DismissDirection.vertical,
    content: Row(
      children: [
        const Icon(Icons.warning_amber_rounded, color: Colors.white),
        SizedBox(width: 5.w),
        Text(
          "Check your connection",
          style: getSemiBoldStyle(fontSize: 11.sp, color: Colors.white),
        ),
      ],
    ),
    duration: const Duration(days: 1),
  ));
}

hideConnectionSnack() {
  ScaffoldMessenger.of(Get.context!).clearSnackBars();
}
