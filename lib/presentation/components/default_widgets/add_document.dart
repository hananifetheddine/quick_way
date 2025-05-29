import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/components/default_widgets/svg.dart';
import 'package:sizer/sizer.dart';

import '../../pages/base_view/pic.dart';
import '../../resources/assets_manager.dart';

typedef VoidCallbackRxString = void Function(RxString);

Widget document({
  required RxString path,
  double height = 9,
  required VoidCallbackRxString tapNoPic,
  required VoidCallbackRxString tapDeletePic,
}) {
  return Obx(
    () => path.value.isEmpty
        ? InkWell(
            onTap: () => tapNoPic(path),
            child: svgPicture(
              IconAssets.addPicIcon,
              height: height.h,
              oppositeColor: false,
            ),
          )
        : InkWell(
            onTap: () => Get.to(
              () => PicViewWidget(
                path: path,
                tapDeletePic: tapDeletePic,
                tapNoPic: tapNoPic,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.sp),
              child: Image.file(
                File(path.value),
                fit: BoxFit.cover,
                height: 75.sp,
                width: 75.sp,
              ),
            ),
          ),
  );
}

/*
Widget multiDocument(
    {required Rx<String> path, bool square = false, double height = 9}) {
  final controller = Get.find<CandidacyController>();
  return Obx(
    () => InkWell(
        onTap: () => controller.takeMultiPictures(),
        child: SvgPicture.asset(
          square ? IconAssets.addPicIconSquare : IconAssets.addPicIcon,
          height: height.h,
          width: 100.w,
        )),
  );
}*/
