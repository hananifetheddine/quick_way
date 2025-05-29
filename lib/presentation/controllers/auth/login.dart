import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../data/network/error_handler.dart';
import '../../../domain/use_case/auth/send_otp_usecase.dart';
import '../../../domain/use_case/auth/verify_otp_uscase.dart';
import '../../components/default_widgets/snack_bar.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../services/notification.dart';
import '../../utils/enums.dart';

class LoginController extends GetxController {
  LoginController(
      this._sendOTPUseCase, this._verifyOTPUseCase, this._notificationService);

  @override
  void onInit() {
    super.onInit();
    showKeyboard();
  }

  final SendOTPUseCase _sendOTPUseCase;
  final VerifyOTPUseCase _verifyOTPUseCase;
  final NotificationService _notificationService;

  final phoneNumberController = TextEditingController();
  final codeController = TextEditingController();
  final RoundedLoadingButtonController buttonController =
      RoundedLoadingButtonController();

  late WebViewController webController;
  final enable = false.obs;
  int phoneNumber = 0;
  int code = 0;
  RegExp nineDigitRegExp = RegExp(r'^\d{9}$');

  onChangePhoneNumber(String? value) {
    if (value!.isNotEmpty && value[0] == "0") phoneNumberController.clear();
    enable.value = nineDigitRegExp.hasMatch(value);
  }

  void onChangeCode(String value) => value.length == 6 ? verifyCode() : null;

  sendCode({bool resend = false}) async {
    phoneNumber = int.parse(phoneNumberController.text);
    //init counter
    startTimer();
    var response = await _sendOTPUseCase.execute(phoneNumber);
    response.fold((l) {
      snackBarDetailsModel(snack: SnackCase.error, subTitle: l.message);
    }, (_) {
      codeController.clear();
      if (!resend) {
        Get.toNamed(Routes.verifyOTPRoute);
      }
      snackBarDetailsModel(
        snack: SnackCase.success,
        subTitle: AppStrings.codeSent,
      );
    });
    if (!resend) {
      buttonController.stop();
    }
  }

  verifyCode() async {
    code = int.parse(codeController.text);
    String notificationToken =
        await _notificationService.getTokenNotification();
    if (notificationToken.isEmpty) {
      snackBarDetailsModel(
          snack: SnackCase.error, subTitle: Failure.defaultError.message);
      return;
    }
    var response = await _verifyOTPUseCase
        .execute(Tuple3(phoneNumber, code, notificationToken));
    response.fold((error) {
      snackBarDetailsModel(snack: SnackCase.error, subTitle: error.message);
    }, (state) {
      if (state == AccountState.noAccount) {
        Get.toNamed(Routes.registerRoute,
            arguments: {"phoneNumber": phoneNumber});
      } else {
        Get.offAllNamed(Routes.splashRoute);
      }
    });
  }

  FocusNode focusNode = FocusNode();

  void showKeyboard() => Future.delayed(
      const Duration(milliseconds: 400), () => focusNode.requestFocus());

  //timer
  final int _start = 59;

  RxInt currentCount = 59.obs;

  void startTimer() {
    currentCount.value = _start;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentCount > 0) {
        currentCount.value--;
      } else {
        timer.cancel();
      }
    });
  }

  get counting => currentCount.value != 0;

  @override
  void dispose() {
    codeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
