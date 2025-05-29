import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../data/network/error_handler.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';

void snackBarDetailsModel(
    {String? title,
    String? subTitle,
    required SnackCase snack,
    snackPosition = SnackPosition.TOP,
    IconData? icon,
    Color? color}) {
  Get.snackbar(
    title ?? snack.title(),
    subTitle ?? snack.subTitle(),
    titleText: Text(
      title ?? snack.title(),
      style: getSemiBoldStyle(color: Colors.white),
    ),
    messageText: Text(
      subTitle != null
          ? (snack == SnackCase.error
              ? getTranslatedMessage(subTitle)
              : subTitle)
          : snack.subTitle(),
      style: getRegularStyle(color: Colors.white),
    ),
    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
    margin: EdgeInsets.all(15.sp),
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    colorText: Colors.white,
    backgroundColor: color ?? snack.color(),
    icon: Icon(
      icon ?? snack.icon(),
      color: Colors.white,
    ),
    snackPosition: snackPosition,
  );
}

enum SnackCase { error, success }

extension SnackCaseExtension on SnackCase {
  String title() {
    return switch (this) {
      SnackCase.error => AppStrings.errorSnack,
      SnackCase.success => AppStrings.successSnack
    };
  }

  String subTitle() {
    return switch (this) {
      SnackCase.error => AppStrings.errorSnackSubTitle,
      SnackCase.success => AppStrings.successSnackSubTitle
    };
  }

  Color color() {
    return switch (this) {
      SnackCase.error => Colors.red,
      SnackCase.success => Colors.green
    };
  }

  IconData icon() {
    return switch (this) {
      SnackCase.error => Icons.warning,
      SnackCase.success => Icons.done
    };
  }
}
