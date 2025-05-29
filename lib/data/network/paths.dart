import '../../app/constants.dart';

class AppPaths {
  static const String sendOTP = "${Constants.baseUrl}/common/auth/otp";
  static const String verifyOTP = "${Constants.baseUrl}/client/auth/login";
  static const String signup = "${Constants.baseUrl}/client/auth/signup";
  static const String logout = "${Constants.baseUrl}/client/auth/logout";
  static const String getAccount = "${Constants.baseUrl}/client/auth/account";
  static const String refreshToken = "${Constants.baseUrl}/common/auth/refresh";

  //
  static const String package = "${Constants.baseUrl}/client/packages";

  //chat
  static const String chats = "${Constants.baseUrl}/client/chats";
  static var ioChat = "${Constants.ioUrl}/chat";

  //match
  static String tripsMatchs(String id) =>
      "${Constants.baseUrl}/client/matchs/packages/$id";
  //state
  static String stateMatch(String packageId, String matchId) =>
      "${Constants.baseUrl}/client/packages/$packageId/matchs/$matchId";

  static String privacyPolicy = "${Constants.baseUrl}/privacy-policy";
}
