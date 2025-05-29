import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget messageSuggestion(String suggestion) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.sp),
      border: Border.fromBorderSide(
        BorderSide(color: Colors.grey.withOpacity(0.7), width: 1.sp),
      ),
    ),
    child: Text(suggestion),
  );
}
