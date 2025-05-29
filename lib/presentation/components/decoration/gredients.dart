import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget blackWhiteGradient({bool radius = true}) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: radius
          ? BorderRadius.only(
              bottomLeft: Radius.circular(8.sp),
              bottomRight: Radius.circular(8.sp))
          : null,
      gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.0),
            Colors.black.withOpacity(0.7),
            Colors.black
          ],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          stops: const [0.6, 0.8, 1]),
    ),
  );
}
