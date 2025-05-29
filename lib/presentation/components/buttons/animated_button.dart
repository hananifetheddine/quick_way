import 'package:flutter/material.dart';
import 'package:quick_way/presentation/utils/enums.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

import '../../resources/font_manager.dart';
import '../../resources/theme_manager.dart';

RoundedLoadingButton animatedButton({
  required String title,
  required VoidCallback? onTap,
  required RoundedLoadingButtonController controller,
  int height = 40,
  int width = 100,
}) {
  return RoundedLoadingButton(
    resetAfterDuration: false,
    successColor: ThemeManager.primaryColor,
    height: height.sp,
    width: width.w,
    color: ThemeManager.primaryColor,
    disabledColor: ThemeManager.primaryColor.withOpacity(0.6),
    elevation: 0,
    borderRadius: 7.sp,
    controller: controller,
    onPressed: onTap,
    child: Text(title,
        style: TextStyle(
            color: Colors.white.withOpacity(onTap == null ? 0.4 : 1),
            fontWeight: FontWeightManager.semiBold,
            fontSize: 12.sp)),
  );
}

Widget actionsTripButton(
    {required String title,
    required VoidCallback? onTap,
    required RoundedLoadingButtonController controller,
    required MatchState state,
    Color? textColor,
    Color? color,
    int height = 40,
    int width = 100,
    int fontSize = 12}) {
  return RoundedLoadingButton(
    resetAfterDuration: false,
    successColor: ThemeManager.primaryColor,
    height: height.sp,
    width: width.w,
    color: const Color(0xfff5f5f5),
    disabledColor: ThemeManager.primaryColor.withOpacity(0.6),
    elevation: 0,
    borderRadius: 7.sp,
    controller: controller,
    onPressed: onTap,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(state.icon),
        SizedBox(width: 3.w),
        Text(
          title,
          style: TextStyle(
            color:
                textColor ?? Colors.white.withOpacity(onTap == null ? 0.4 : 1),
            fontWeight: FontWeightManager.semiBold,
            fontSize: fontSize.sp,
          ),
        ),
      ],
    ),
  );
}
