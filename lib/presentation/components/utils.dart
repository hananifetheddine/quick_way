import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../resources/theme_manager.dart';
import 'default_widgets/svg.dart';

Widget iconContainerModel({required String icon, required onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10.sp),
      height: 38.sp,
      width: 38.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.sp),
        color: ThemeManager.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.0),
            spreadRadius: 2,
            blurRadius: 9,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: svgPicture(icon),
    ),
  );
}

Widget iconBox(
    {String? icon,
    required double iconSize,
    shadow = false,
    Color? color,
    IconData? iconData,
    bool svg = true}) {
  return Container(
    padding: EdgeInsets.all(6.sp),
    decoration: BoxDecoration(
      border: Border.all(
          color: ThemeManager.oppositeColor.withOpacity(0.7), width: 0.5.sp),
      borderRadius: BorderRadius.circular(3.sp),
      color: color ?? ThemeManager.backgroundColor,
      boxShadow: shadow
          ? [
              BoxShadow(
                color: ThemeManager.tertiaryColor,
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 6), // changes position of shadow
              ),
            ]
          : null,
    ),
    child: svg
        ? svgPicture(
            icon ?? "",
            height: iconSize.sp,
            width: iconSize.sp,
          )
        : Icon(
            iconData,
            size: iconSize.sp,
          ),
  );
}

Widget iconCircle({
  String icon = "",
  int size = 19,
  Color? color,
  bool shadow = false,
  iconData = Icons.arrow_back_rounded,
}) {
  return Container(
    padding: EdgeInsets.all((size - 6).sp),
    decoration: BoxDecoration(
      color: color ?? ThemeManager.backgroundColor,
      shape: BoxShape.circle,
      boxShadow: shadow
          ? [
              BoxShadow(
                color: ThemeManager.tertiaryColor,
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 6), // changes position of shadow
              ),
            ]
          : null,
    ),
    child: Visibility(
        visible: icon.isNotEmpty,
        replacement: Icon(iconData, size: size.sp),
        child: SvgPicture.asset(
          icon,
          height: size.sp,
          width: size.sp,
        )),
  );
}
