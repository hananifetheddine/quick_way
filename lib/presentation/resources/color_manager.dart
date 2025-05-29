import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0XFF1C354D);
  static Color secondaryColor = const Color(0xff6B7280);
  static var shadowColor = Colors.grey.withOpacity(0.2);
  static Color fillInputColor = const Color(0XFFF3F4F8);
  static var hardShadowColor = Colors.grey.withOpacity(0.6);

  //static Color backgroundColor = Colors.grey.withOpacity(0.1);
  static Color backgroundColor = Colors.white;
  static Color backgroundScaffoldColor = Colors.white;
  static var tertiary = Colors.grey.withOpacity(0.1);

  static Color baseShimmerColor = Colors.grey[300]!;
  static Color highlightColor = Colors.grey[100]!;

//static Color primary = const Color(0xffED9728);
//static Color darkGrey = const Color(0xff525252);
//static Color grey = const Color(0xff737477);
//static Color lightGrey = const Color(0xff9E9E9E);
//static Color black = const Color(0xff000000);//
}

class ColorManagerDark {
  static Color primary = const Color(0XFF1C354D);
  static Color secondaryColor = const Color(0xff979797);
  static Color tertiary = const Color(0xff979797).withOpacity(0.7);
  static Color backgroundColor = const Color(0XFF1e1e20);
  static Color backgroundScaffoldColor = const Color(0xff1B1B1B);
  static Color fillInputColor = const Color(0xff25282d); //Color(0XFF222327);
  static Color textColor = const Color(0xffF7F9F9); //Color(0XFF222327);
  static Color softBackground = const Color(0xff25282d);
  static Color shadowColor = Colors.black12;

  static Color baseShimmerColor = Colors.grey[700]!;
  static Color highlightColor = Colors.grey[500]!;
}
