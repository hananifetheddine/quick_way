import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../resources/styles_manager.dart';
import '../../resources/theme_manager.dart';

Widget button(
        {required String title,
        required VoidCallback? onTap,
        int height = 40,
        int width = 100,
        int fontSize = 13,
        bool shadow = true}) =>
    InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height.sp,
        width: width.w,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: shadow ? 8 : 0,
          shadowColor: shadow ? ThemeManager.shadowButtonColor : null,
          color: ThemeManager.primaryColor.withOpacity(1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.sp)),
          child: Center(
            child: Text(title,
                style: getSemiBoldStyle(
                    color: Colors.white.withOpacity(onTap == null ? 0.4 : 1),
                    fontSize: fontSize.sp)),
          ),
        ),
      ),
    );
