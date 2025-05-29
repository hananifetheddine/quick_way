import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "../../resources/theme_manager.dart";

Widget svgPicture(String icon,
    {double? width, double? height, Color? color, bool oppositeColor = true}) {
  return SvgPicture.asset(
    icon,
    height: height,
    width: width,
    color: oppositeColor ? ThemeManager.oppositeColor.withOpacity(0.9) : color,
  );
}
