import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/main.dart';
import 'package:quick_way/presentation/components/default_widgets/svg.dart';
import 'package:quick_way/presentation/resources/styles_manager.dart';
import 'package:quick_way/presentation/resources/theme_manager.dart';
import 'package:sizer/sizer.dart';

import '../../../components/utils.dart';
import '../../../resources/assets_manager.dart';

Widget appBarHome() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Quick way",
        style: getBoldStyle(fontSize: 15.sp, color: ThemeManager.primaryColor),
      ),
      SizedBox(width: 2.w),
      svgPicture(LogoAssets.svgLogo, oppositeColor: false, height: 20.sp),
      const Spacer(),
      Row(
        children: [
          SizedBox(
            width: 4.w,
          ),
          iconContainerModel(icon: IconAssets.notificationIcon, onTap: null),
        ],
      )
    ],
  ).paddingSymmetric(horizontal: 4.w);
}
