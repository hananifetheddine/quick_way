import 'dart:async';

import 'package:get/get.dart';
import 'package:quick_way/data/network/paths.dart';

import '../../app/local.dart';
import '../../main.dart';
import '../repositories/auth_repository.dart';
import 'api_request.dart';
import 'error_handler.dart';
import 'error_helper.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  Future request(APIRequestRepresentable request,
      {bool requestHttp = true}) async {
    var headers = {"x-access-token": LocalService.accessToken};
    if (requestHttp) headers['Content-Type'] = "application/json";
    _client.timeout = const Duration(seconds: 25);

    if (request.url == AppPaths.logout) {
      request.body['refreshToken'] = LocalService.refreshToken;
    }

    final response = await _client.request(
      request.url,
      request.method.string,
      headers: {...?request.headers, ...headers},
      query: request.query,
      body: request.body,
    );
    logger.i(request.url);
    logger.i(response.statusCode);
    logger.i(response.body);
    String message = response.body?["message"] ?? "";
    if (response.statusCode == 200) return response.body;

    if (request.url == AppPaths.refreshToken) {
      //showDialogForceLogOut();
    } else if (response.statusCode == 401 &&
        message == ResponseMessage.tokenExpired &&
        ![AppPaths.sendOTP, AppPaths.signup].contains(request.url)) {
      bool tokenRefreshed = await refreshToken();
      if (tokenRefreshed) {
        return this.request(request, requestHttp: requestHttp);
      }
    }

    throw ErrorHelper.handle(request.url, response.statusCode ?? 0, message);
  }

  static Completer<bool> _tokenRefreshCompleter = Completer<bool>();
  static bool isRefreshingToken = false;

  static Future<bool> refreshToken() async {
    bool tokenRefreshSuccessful = false;
    if (isRefreshingToken) {
      return await _tokenRefreshCompleter.future;
    } else {
      isRefreshingToken = true;
      try {
        var res = await Get.find<AuthRepositoryImpl>().refreshToken();
        res.fold((l) => tokenRefreshSuccessful = false,
            (r) => tokenRefreshSuccessful = true);
      } finally {
        isRefreshingToken = false;
        _tokenRefreshCompleter.complete(tokenRefreshSuccessful);
        _tokenRefreshCompleter = Completer<bool>();
      }
      return tokenRefreshSuccessful;
    }
  }
}
