import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget radiusTopCard(
    {required Widget child,
    int radius = 10,
    Color? color,
    EdgeInsets? margin}) {
  return SizedBox(
    width: 100.w,
    child: Card(
      color: color,
      margin: margin ?? EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular((radius).sp),
            topRight: Radius.circular((radius).sp)),
      ),
      child: child,
    ),
  );
}

Widget radiusCard(
    {required Widget child,
    bool elevation = false,
    int radius = 10,
    double shadow = 6,
    EdgeInsets? margin,
    Color? color}) {
  return Card(
    margin: margin,
    color: color,
    elevation: elevation ? shadow : 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius.sp),
    ),
    child: child,
  );
}

Widget circleCard(
    {required Widget child,
    bool elevation = false,
    Color? color,
    EdgeInsets? margin}) {
  return Card(
    margin: margin,
    color: color,
    elevation: elevation ? 6 : 0,
    shape: const CircleBorder(),
    child: child,
  );
}
