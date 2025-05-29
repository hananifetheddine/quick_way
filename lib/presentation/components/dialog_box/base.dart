import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<dynamic> showBaseAnimatedDialogBox(
    {required Widget widget,
    barrierDismissible = true,
    bool center = true}) async {
  return await showGeneralDialog(
    context: Get.context!,
    barrierDismissible: barrierDismissible,
    barrierLabel:
        MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.sp),
            ),
            child: widget.paddingSymmetric(horizontal: 4.w, vertical: 2.h),
          ),
          SizedBox(height: center ? 0 : 10.h),
        ],
      ));
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
