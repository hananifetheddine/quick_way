import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../data/network/error_handler.dart';
import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key, required this.failure, this.buttonTap});

  final Failure failure;
  final VoidCallback? buttonTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(_asset(failure), height: 100.sp),
          SizedBox(height: 2.h),
          Text(
            failure.message,
            style: getSemiBoldStyle(),
          ),
          SizedBox(height: 1.h),
          Text(
            failure.description ?? "",
            style: getMediumStyle(subTitle: true, fontSize: 9.sp),
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: 7.w),
          SizedBox(height: 2.h),
          Visibility(
              visible: failure.buttonText.isNotEmpty,
              child: OutlinedButton(
                onPressed: buttonTap,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                child: Text(
                  failure.buttonText,
                  style: getMediumStyle(color: Colors.red, fontSize: 11.sp),
                ),
              )),
        ],
      ),
    );
  }
}

String _asset(Failure failure) {
  if (failure == Failure.noInternet) {
    return AnimationAssets.noInternetAnimation;
  }

  if (failure == Failure.defaultError) {
    return AnimationAssets.wentWrongAnimation;
  }

  if (failure == Failure.noServiceFound) {
    return AnimationAssets.noServiceFound;
  }

  return "";
}
