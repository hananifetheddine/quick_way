import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../resources/styles_manager.dart';
import '../../resources/theme_manager.dart';
import '../buttons/simple_button.dart';

showLocationPermission() async {
  return await showGeneralDialog(
    context: Get.context!,
    barrierDismissible: false,
    barrierLabel:
        MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return Builder(
        builder: (context) {
          return Center(
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.sp),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 2.h),
                    Text(
                      'Location Permission',
                      style: getBoldStyle(fontSize: 20),
                    ),
                    SizedBox(height: 2.h),
                    //TODO:ADD ANIMATION
                    //Container(
                    //    decoration: const BoxDecoration(
                    //        shape: BoxShape.circle, color: Colors.white),
                    //    child: Lottie.asset(AnimationAssets.locationAnimation,
                    //        height: 150.sp)),
                    // SizedBox(height: 2.h),
                    Text(
                      "Wassla needs access to your location while you're using the app to ensure precise and efficient delivery to your current location",
                      style: getLightStyle(
                          color: ThemeManager.secondaryColor, fontSize: 10.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 2.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        button(
                          title: "Next",
                          onTap: () => Get.back(result: true),
                          width: 50,
                          height: 30,
                          fontSize: 10,
                          shadow: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                  ],
                ).paddingSymmetric(horizontal: 4.w, vertical: 2.h),
              ),
            ),
          );
        },
      );
    },
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: widget,
        ),
      );
    },
  );
}
