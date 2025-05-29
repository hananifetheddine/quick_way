import 'package:get/get.dart';

import '../../main.dart';
import 'app_exceptions.dart';

class ErrorHandler {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    logger.i(error);
    logger.i(error is AppException);
    if (error is AppException) {
      failure = error.failure;
    } else {
      failure = Failure.defaultError;
    }
  }
}

enum Failure {
  defaultError(ResponseMessage.defaultError),
  noInternet(ResponseMessage.noInternet),
  sendOTPError(ResponseMessage.sendOTPError),
  wrongOTPError(ResponseMessage.wrongOTPError),
  dataError(ResponseMessage.dataError),
  alreadyAccountExist(ResponseMessage.alreadyAccountExistError),
  noServiceFound(
    ResponseMessage.noServiceFoundError,
    description: ResponseDesc.noServiceFoundError,
    buttonText: ButtonText.noServiceFoundError,
  ),
  noCourierFound(
    ResponseMessage.noCourierFoundError,
    description: ResponseDesc.noDeliveryFoundError,
  ),

  // to handle cancel on request
  cancelRequestError(ResponseMessage.cancelRequestError),
  requestAlreadyAcceptedError(ResponseMessage.requestAlreadyAcceptedError),

  noPromoCodeFound(ResponseMessage.noPromoCodeFoundError),
  noFailure("");

  final String message;
  final String? description;

  final String buttonText;

  const Failure(this.message, {this.description, this.buttonText = ""});
}

class ResponseMessage {
  static const String tokenExpired = "token expired";
  static const String defaultError = "Something went wrong";
  static const String noInternet = "Check your connection and try again";
  static const String sendOTPError = "Failed sending code";
  static const String dataError = "Verify the data";
  static const String alreadyAccountExistError =
      "The account with the provided phone Number exist";
  static const String noServiceFoundError = "Service unavailable";
  static const String noServiceFoundDescError = "Service unavailable";

  static const String noPromoCodeFoundError = "no promo code found";
  static const String noCourierFoundError = "no courier found";
  static const String cancelRequestError = "you have canceled the request";
  static const String requestAlreadyAcceptedError =
      "a courier accepted your request";
  static const String wrongOTPError = "the code you provided is wrong";
}

class ResponseDesc {
  static const String noServiceFoundError =
      "Sorry, our service aren't available in the addresses you entered, please check your location and try again";
  static const String noDeliveryFoundError =
      "We could not find a delivery for you, please try again after a faw minutes";
}

class ButtonText {
  static const String noServiceFoundError = "Check locations";
}

String getTranslatedMessage(String failureMessage) {
  return failureMessage.tr;
}
