import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/auth/login.dart';
import 'package:sizer/sizer.dart';

import '../../../components/buttons/animated_button.dart';
import '../../../components/default_widgets/go_back.dart';
import '../../../components/text_fields/phone_number.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/styles_manager.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3.h),
          goBack(),
          SizedBox(height: 2.h),
          Text(
            "Entrez votre numéro de téléphone",
            textAlign: TextAlign.center,
            style: getBoldStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 1.h),
          Text(
            "Veuillez entrer votre numéro de téléphone. Vous recevrez un code de vérification.",
            style: getMediumStyle(fontSize: 11.sp, subTitle: true),
          ),
          SizedBox(height: 4.h),
          Hero(
            tag: "input_login",
            child: InputPhoneNumberAuth(
              readOnly: false,
              textEditingController: controller.phoneNumberController,
              change: controller.onChangePhoneNumber,
              focusNode: controller.focusNode,
            ),
          ),
          const Spacer(),
          Obx(
            () => animatedButton(
              title: "Suivant",
              onTap: controller.enable.isTrue ? controller.sendCode : null,
              controller: controller.buttonController,
            ),
          ),
          SizedBox(height: 3.h)
        ],
      ).paddingSymmetric(horizontal: 4.w),
    ));
  }
}
