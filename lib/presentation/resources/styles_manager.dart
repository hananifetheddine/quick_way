import 'package:flutter/material.dart';
import 'package:quick_way/presentation/resources/theme_manager.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color? color,
    TextDecoration? decoration) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: decoration);
}

// light style

TextStyle getLightStyle(
    {double? fontSize,
    Color? color,
    subTitle = false,
    TextDecoration? decoration}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.light,
      subTitle ? ThemeManager.secondaryColor : color, decoration);
}

// regular style

TextStyle getRegularStyle(
    {double? fontSize,
    Color? color,
    subTitle = false,
    TextDecoration? decoration}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.regular,
      subTitle ? ThemeManager.secondaryColor : color, decoration);
}

// medium style

TextStyle getMediumStyle(
    {double? fontSize,
    Color? color,
    subTitle = false,
    TextDecoration? decoration}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.medium,
      subTitle ? ThemeManager.secondaryColor : color, decoration);
}
// semibold style

TextStyle getSemiBoldStyle(
    {double? fontSize,
    Color? color,
    subTitle = false,
    TextDecoration? decoration}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.semiBold,
      subTitle ? ThemeManager.secondaryColor : color, decoration);
}

// bold style

TextStyle getBoldStyle(
    {double? fontSize,
    Color? color,
    subTitle = false,
    TextDecoration? decoration}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.bold,
      subTitle ? ThemeManager.secondaryColor : color, decoration);
}
