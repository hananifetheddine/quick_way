import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'base.dart';
/*
void showDialogForceLogOut() {
  showBaseAnimatedDialogBox(
    barrierDismissible: false,
    widget: Builder(
      builder: (BuildContext context) {
        final controller = Get.find<SettingsController>();
        return Material(
          type: MaterialType.transparency,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Session expired",
                style: getBoldStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Please log in again to continue.",
                style: getMediumStyle(subTitle: true, fontSize: 12.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 2.h),
              TextButton(
                onPressed: controller.forceLogOut,
                child: Text(
                  "Okay",
                  style: getMediumStyle(fontSize: 12.sp),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
*/
