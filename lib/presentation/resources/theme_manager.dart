import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_way/presentation/resources/styles_manager.dart';
import 'package:quick_way/presentation/resources/values_manager.dart';
import 'package:sizer/sizer.dart';

import '../../app/local.dart';
import '../utils/enums.dart';
import 'color_manager.dart';
import 'font_manager.dart';

class ThemeManager {
  static ThemeData darkTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManagerDark.fillInputColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.2.h),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.borderInput),
          borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.borderInput),
          borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.borderInput),
          borderSide: BorderSide.none),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.borderInput),
          borderSide: BorderSide.none),
      hintStyle: getRegularStyle(color: ColorManagerDark.secondaryColor),
      labelStyle: getRegularStyle(color: ColorManagerDark.tertiary),
    ),
    //progressIndicatorTheme: ProgressIndicatorThemeData(
    //    linearTrackColor: ColorManagerDark.backgroundColor),
    expansionTileTheme: const ExpansionTileThemeData(
      collapsedTextColor: Colors.white,
      textColor: Colors.white,
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
    ),
    listTileTheme: ListTileThemeData(
        titleTextStyle: const TextStyle(color: Colors.white),
        subtitleTextStyle: TextStyle(
            color: const Color(0xff6B7280),
            fontSize: 11.sp,
            fontWeight: FontWeightManager.medium)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: ColorManagerDark.secondaryColor,
        selectedItemColor: ColorManagerDark.primary,
        elevation: 0,
        backgroundColor: ColorManagerDark.backgroundScaffoldColor),
    cardColor: const Color(0XFF24252a),
    cardTheme: CardTheme(
        surfaceTintColor: ColorManagerDark.backgroundColor,
        elevation: 5,
        shadowColor: ColorManagerDark.shadowColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.sp))),
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorManagerDark.backgroundScaffoldColor,
        titleTextStyle: getRegularStyle(fontSize: 12.sp)),
    textTheme: GoogleFonts.poppinsTextTheme()
        .apply(bodyColor: ColorManagerDark.textColor),
    scaffoldBackgroundColor: ColorManagerDark.backgroundScaffoldColor,
    brightness: Brightness.dark,
    primaryColor: const Color(0xffAE0E18),
    colorScheme: ColorScheme(
      primary: ColorManagerDark.primary,
      onPrimary: Colors.black,
      secondary: ColorManagerDark.secondaryColor,
      onSecondary: ColorManagerDark.secondaryColor,
      tertiary: ColorManagerDark.tertiary,
      background: ColorManagerDark.backgroundColor,
      brightness: Brightness.dark,
      error: Colors.red,
      onError: Colors.red,
      onBackground: ColorManagerDark.backgroundColor,
      surface: ColorManagerDark.backgroundColor,
      onSurface: Colors.white,
      shadow: ColorManagerDark.shadowColor,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    expansionTileTheme: const ExpansionTileThemeData(
      collapsedTextColor: Colors.black,
      textColor: Colors.black,
      iconColor: Colors.black,
      collapsedIconColor: Colors.black,
    ),
    listTileTheme: const ListTileThemeData(),
    radioTheme: const RadioThemeData(),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.fillInputColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.2.h),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.borderInput),
          borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.borderInput),
          borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.borderInput),
          borderSide: BorderSide.none),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.borderInput),
          borderSide: BorderSide.none),
      hintStyle:
          getRegularStyle(fontSize: 12.sp, color: ColorManager.secondaryColor),
      labelStyle: getRegularStyle(color: ColorManager.secondaryColor),
    ),
    datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: ColorManager.shadowColor),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    cardColor: Colors.white,
    dividerTheme: DividerThemeData(
      color: ColorManager.secondaryColor.withOpacity(0.5),
    ),
    dialogBackgroundColor: Colors.white,
    dialogTheme: const DialogTheme(
      surfaceTintColor: Colors.white,
      //backgroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
        surfaceTintColor: ColorManager.backgroundColor,
        elevation: 5,
        margin: EdgeInsets.zero,
        shadowColor: ColorManager.backgroundColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.sp))),
    dividerColor: ColorManager.secondaryColor,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorManager.backgroundScaffoldColor,
        titleTextStyle: getRegularStyle(color: Colors.black)),
    iconTheme: const IconThemeData(color: Colors.black),
    // iconButtonTheme: IconButtonThemeData(
    //   style: IconButton.styleFrom(
    //     shadowColor: Colors.grey.withOpacity(0.3), elevation: 3)),
    textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: ColorManager.primary,
    colorScheme: ColorScheme(
      background: ColorManager.backgroundColor,
      brightness: Brightness.light,
      primary: ColorManager.primary,
      onPrimary: Colors.white,
      secondary: ColorManager.secondaryColor,
      onSecondary: const Color(0XFF707070),
      tertiary: ColorManager.tertiary,
      error: Colors.red,
      onError: Colors.red,
      onBackground: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      shadow: ColorManager.shadowColor,
    ),
  );

  static ThemeMode getThemeMode() => LocalService.theme.toThemeMode();

  static setTheme(ThemeDisplay theme) {
    Get.changeThemeMode(theme.toThemeMode());
    LocalService.theme = theme;
  }

  static bool isThemeDark() {
    if (getThemeMode() == ThemeMode.system) {
      var brightness = Get.mediaQuery.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return getThemeMode() == ThemeMode.dark;
    }
  }

  static Color get primaryColor => Theme.of(Get.context!).colorScheme.primary;

  static Color get secondaryColor =>
      Theme.of(Get.context!).colorScheme.secondary;

  static Color get tertiaryColor => Theme.of(Get.context!).colorScheme.tertiary;

  static Color get backgroundColor =>
      Theme.of(Get.context!).colorScheme.background;

  static Color greenColor() => const Color(0xff425B59);

  static Color greenSecondColor() => const Color(0xff00a273);

  static Color backScaffoldGroundColor() =>
      Theme.of(Get.context!).scaffoldBackgroundColor;

  static Color get oppositeColor => isThemeDark() ? Colors.white : Colors.black;

  static Color get softShadowColor => Theme.of(Get.context!).colorScheme.shadow;

  static Color get hardShadowColor => isThemeDark()
      ? ColorManagerDark.softBackground
      : ColorManager.hardShadowColor;

  static Color get baseShimmerColor => isThemeDark()
      ? ColorManagerDark.baseShimmerColor
      : ColorManager.baseShimmerColor;

  static Color get highlightColor => isThemeDark()
      ? ColorManagerDark.highlightColor
      : ColorManager.highlightColor;

  static Color get shadowButtonColor => Colors.grey.withOpacity(0.3);

  static Color svgIconColor() =>
      isThemeDark() ? const Color(0xff6B7280) : Colors.black;

  static linearGradient() => const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color(0xffC84E89),
          Color(0xffF15F79),
        ],
      );
}
