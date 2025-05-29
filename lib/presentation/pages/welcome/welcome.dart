import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../components/decoration/card.dart';
import '../../components/text_fields/phone_number.dart';
import '../../resources/assets_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: Image.asset(ImageAssets.welcome, fit: BoxFit.cover)),
            SizedBox(height: 15.h)
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: radiusTopCard(
            margin: EdgeInsets.zero,
            radius: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 1.h),
                Text(
                  "QuickWay, toujours à vos côtés",
                  style: getBoldStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  "La rapidité au cœur de votre tranquillité.",
                  style: getSemiBoldStyle(
                    subTitle: true,
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Hero(
                  tag: "input_login",
                  child: InputPhoneNumberAuth(
                    readOnly: true,
                    tap: () => Get.toNamed(Routes.loginRoute),
                  ),
                ),
                SizedBox(height: 1.h),
              ],
            ).paddingSymmetric(vertical: 2.h, horizontal: 4.w),
          ),
        )
      ],
    )));
  }
}
