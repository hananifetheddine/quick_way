import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../../components/default_widgets/go_back.dart';
import '../../../controllers/auth/login.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/theme_manager.dart';
import '../../../resources/values_manager.dart';

class VerifyOTPView extends GetView<LoginController> {
  const VerifyOTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.paddingPages),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.h),
              goBack(),
              SizedBox(height: 2.h),
              Text(
                "Code envoyé",
                style: getBoldStyle(fontSize: 19.sp),
              ),
              SizedBox(height: 1.h),
              Text(
                "Nous avons envoyé un code. Entrez-le pour vérifier votre numéro de téléphone : 0${controller.phoneNumber}",
                style: getMediumStyle(fontSize: 11.sp, subTitle: true),
              ),
              SizedBox(height: 4.h),
              PinCodeTextField(
                backgroundColor: Colors.transparent,
                autoDisposeControllers: false,
                controller: controller.codeController,
                onSubmitted: (s) {},
                enablePinAutofill: true,
                autovalidateMode: AutovalidateMode.disabled,
                appContext: context,
                length: 6,
                textStyle: getMediumStyle(fontSize: 17.sp),
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                cursorColor: ThemeManager.oppositeColor,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                autoFocus: true,
                keyboardType: TextInputType.number,
                cursorWidth: 0.4.w,
                pastedTextStyle: getMediumStyle(),
                pinTheme: PinTheme(
                  borderWidth: 1.sp,
                  selectedFillColor: ThemeManager.backgroundColor,
                  selectedColor: ThemeManager.primaryColor,
                  activeColor: ThemeManager.primaryColor,
                  inactiveColor: ThemeManager.tertiaryColor,
                  activeFillColor: ThemeManager.backgroundColor,
                  inactiveFillColor: ThemeManager.backgroundColor,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(7.sp),
                  fieldHeight: 45.sp,
                  fieldWidth: 34.sp,
                ),
                onChanged: controller.onChangeCode,
              ),
              Obx(
                () => SizedBox(
                  height: 7.h,
                  child: Center(
                    child: Visibility(
                      visible: controller.counting,
                      replacement: TextButton(
                        onPressed: () => controller.sendCode(resend: true),
                        child: Text(
                          "Reenvoyer",
                          style: getRegularStyle(fontSize: 12.sp),
                        ),
                      ),
                      child: Text(
                        "Réenvoyer après ${controller.currentCount.value}",
                        style: getRegularStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
