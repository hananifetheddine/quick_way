import 'error_handler.dart';

class AppException implements Exception {
  Failure failure;

  AppException(this.failure);
}

class GeneralException extends AppException {
  GeneralException() : super(Failure.defaultError);
}

//send otp
class SendOTPException extends AppException {
  SendOTPException() : super(Failure.sendOTPError);
}

//login
class WrongOTPException extends AppException {
  WrongOTPException() : super(Failure.wrongOTPError);
}

//signup
class AccountExistException extends AppException {
  AccountExistException() : super(Failure.alreadyAccountExist);
}

//wrong data provided
class DataException extends AppException {
  DataException() : super(Failure.dataError);
}

//no service for now
class NoServiceException extends AppException {
  NoServiceException() : super(Failure.noServiceFound);
}

//no delivery found
class NoDeliveryException extends AppException {
  NoDeliveryException() : super(Failure.noCourierFound);
}

//cancel on request
class CancelRequestException extends AppException {
  CancelRequestException() : super(Failure.cancelRequestError);
}

//already accepted
class AlreadyAcceptedException extends AppException {
  AlreadyAcceptedException() : super(Failure.requestAlreadyAcceptedError);
}

//no promoCode
class NoPromoCodeException extends AppException {
  NoPromoCodeException() : super(Failure.noPromoCodeFound);
}
