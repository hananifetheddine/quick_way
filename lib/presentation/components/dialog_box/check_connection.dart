import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import 'base.dart';

showCheckConnection(VoidCallback onTryAgain) {
  showBaseAnimatedDialogBox(
    center: false,
    widget: Builder(
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 1.5.h),
              Text(AppStrings.connectionFailed,
                  style: getSemiBoldStyle(fontSize: 14.sp)),
              SizedBox(height: 1.5.h),
              Lottie.asset(AnimationAssets.noInternetAnimation, height: 100.sp),
              SizedBox(height: 1.5.h),
              Text(
                AppStrings.conTryAgain,
                style: getMediumStyle(subTitle: true, fontSize: 10.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 3.h),
              TextButton(
                onPressed: onTryAgain,
                child: Text(
                  AppStrings.tryAgain,
                  style: getSemiBoldStyle(fontSize: 12.sp),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
