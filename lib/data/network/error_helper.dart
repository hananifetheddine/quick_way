import 'package:get/get.dart';
import 'package:quick_way/data/network/paths.dart';
import 'app_exceptions.dart';

class ErrorHelper {
  static AppException handle(String url, int? statusCode, String? message) {
    if (statusCode == null || message == null) {
      return GeneralException();
    }

    /*if (statusCode == 403) {
      if (message.contains("account is deactivated")) {
        Get.offAllNamed(Routes.deactivatedRoute);
      }
    }*/

    if (statusCode == 422) {
      return DataException();
    }

    if (url == AppPaths.sendOTP) {
      if (statusCode == 500) {
        return SendOTPException();
      }
    }

    //log in
    if (url == AppPaths.verifyOTP) {
      if (statusCode == 401) {
        return WrongOTPException();
      }
    }

    //sign up
    if (url == AppPaths.signup) {
      if (statusCode == 409) {
        return AccountExistException();
      }
    }

    if (url.contains("promo")) {
      if (statusCode == 404) {
        return NoPromoCodeException();
      }
      if (statusCode == 403) {
        return NoPromoCodeException();
      }
    }

    if (url.contains("cancel") && url.contains("request")) {
      if (statusCode == 409) {
        return AlreadyAcceptedException();
      }
    }

    if (url.contains("promo")) {
      if ([404, 403].contains(statusCode)) {
        return NoPromoCodeException();
      }
    }

    return GeneralException();
  }
}
