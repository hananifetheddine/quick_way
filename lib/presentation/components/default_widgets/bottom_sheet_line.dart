import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../resources/assets_manager.dart';
import '../../resources/theme_manager.dart';

Widget bottomSheetLine({Color? color}) {
  return Center(
    child: SvgPicture.asset(
      IconAssets.lineBottomSheetIcon,
      color: color ?? ThemeManager.secondaryColor.withOpacity(0.5),
    ).paddingSymmetric(horizontal: 2.h),
  );
}
