import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../components/buttons/animated_button.dart';
import '../../../components/default_widgets/go_back.dart';
import '../../../components/text_fields/date_field.dart';
import '../../../components/text_fields/default_text_field.dart';
import '../../../components/text_fields/drop_down_text_field.dart';
import '../../../controllers/auth/registration.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/constants_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../utils/enums.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.paddingPages),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 3.h),
                goBack(),
                SizedBox(height: 2.h),
                Text(
                  "Bienvenue chez QuickWay !",
                  style: getBoldStyle(fontSize: 17.sp),
                ),
                SizedBox(height: 1.h),
                Text(
                  "Bienvenue chez Wassla, quelques étapes seulement et vous faites partie de nous.",
                  style: getMediumStyle(fontSize: 11.sp, subTitle: true),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                DefaultInput(
                  hintText: "Email",
                  icon: IconAssets.emailIcon,
                  controller: controller.emailController,
                  validate: controller.validatorEmail,
                  autoFocus: true,
                ),
                SizedBox(height: 3.h),
                DefaultInput(
                  hintText: "Prénom",
                  icon: IconAssets.personIcon,
                  controller: controller.firstNameController,
                  validate: controller.validatorFirstName,
                ),
                SizedBox(height: 3.h),
                DefaultInput(
                  hintText: "Nom",
                  icon: IconAssets.peopleIcon,
                  controller: controller.familyNameController,
                  validate: controller.validatorFamilyName,
                ),
                SizedBox(height: 3.h),
                InputDateComponent(
                  initialDate: AppConstants.initialDate,
                  firstDate: AppConstants.firstDate,
                  hintText: "Date de naissance",
                  lastDate: AppConstants.lastDate,
                  controller: controller.dateController,
                  onSelect: controller.onSelectDate,
                  validate: controller.validatorDate,
                  mode: CupertinoDatePickerMode.date,
                ),
                SizedBox(height: 3.h),
                InputDropDown<String>(
                  values: Gender.values.map((e) => e.name).toList(),
                  hint: AppStrings.genderHint,
                  onChanged: controller.onChangeGender,
                  value: controller.gender,
                ),
                SizedBox(height: 5.h),
                animatedButton(
                  title: "S'inscrire",
                  onTap: controller.registration,
                  controller: controller.buttonController,
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
