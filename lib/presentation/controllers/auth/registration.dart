import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/utils/date.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../domain/entities/toApi/auth/registration.dart';
import '../../../domain/use_case/auth/signup_usecase.dart';
import '../../components/default_widgets/snack_bar.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../services/notification.dart';
import '../../utils/enums.dart';
import '../../utils/reg_exp.dart';

class RegistrationController extends GetxController {
  var enable = false.obs;
  var focusNode = FocusNode();
  late final int phoneNumber;

  RegistrationController(this._signupUseCase, this._notificationService);

  final SignupUseCase _signupUseCase;
  final NotificationService _notificationService;

  @override
  void onInit() {
    super.onInit();
    phoneNumber = Get.arguments["phoneNumber"] ?? 0;
  }

  registration() async {
    var notification = await _notificationService.getTokenNotification();
    Registration registration = Registration(
      phoneNumber: phoneNumber,
      notificationID: notification,
      firstName: firstNameController.text,
      familyName: familyNameController.text,
      birthDate: dateController.text,
      gender: gender.value,
      email: emailController.text,
    );

    var res = await _signupUseCase.execute(registration);
    res.fold(
        (error) => snackBarDetailsModel(
            snack: SnackCase.error, subTitle: error.message),
        (_) => Get.offAllNamed(Routes.homeRoute));
    buttonController.stop();
  }

  var buttonController = RoundedLoadingButtonController();

  // UI
  var formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final validatorFirstName = ValidationBuilder()
      .required()
      .regExp(RegExpConfirmation.alphabeticRegExp, AppStrings.validFirstName)
      .maxLength(20)
      .minLength(3)
      .build();

  final validatorFamilyName = ValidationBuilder()
      .required()
      .regExp(RegExpConfirmation.alphabeticRegExp, AppStrings.validFamilyName)
      .maxLength(20)
      .minLength(3)
      .build();

  final validatorEmail = ValidationBuilder().required().email().build();
  final validatorDate = ValidationBuilder().required().build();

  onSelectDate(DateTime date) => dateController.text = date.toStringFormat();

  Rx<String> gender = Gender.male.name.obs;

  void onChangeGender(String? value) => gender.value = value ?? "";
}
