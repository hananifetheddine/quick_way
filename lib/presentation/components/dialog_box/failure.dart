import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../data/network/error_handler.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import 'base.dart';

showFailure({VoidCallback? tap, required Failure failure}) {
  showBaseAnimatedDialogBox(
    widget: Builder(
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                failure.message,
                style: getBoldStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                failure.description ?? "",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const SizedBox(width: 8),
              TextButton(
                onPressed: Get.back,
                child: Text(
                  AppStrings.okayButton,
                  style: getMediumStyle(),
                ),
              ),
            ],
          ),
        );
        /*
          AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            failure.message,
            style: getSemiBoldStyle(fontSize: 12.sp),
            textAlign: TextAlign.center,
          ),
          content: Text(
            failure.description ?? "",
            style: getMediumStyle(fontSize: 10.sp),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: Get.back,
                child: Text(
                  AppStrings.okayButton,
                  style: getMediumStyle(),
                ),
              ),
            ),
          ],
        );
         */
      },
    ),
  );
}
