import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../app/local.dart';
import '../../domain/entities/User/profile.dart';
import '../../domain/entities/toApi/auth/registration.dart';
import '../../domain/entities/user/account.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/utils/enums.dart';
import '../network/api_provider.dart';
import '../network/api_request.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';
import '../network/paths.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(this._networkInfo);

  Future<Either<Failure, void>> refreshToken() async {
    if (await _networkInfo.isConnected) {
      try {
        APIRequestRepresentable apiRequest = APIRequestRepresentable(
          url: AppPaths.refreshToken,
          method: HTTPMethod.post,
          body: {"refreshToken": LocalService.refreshToken},
        );
        var response = await APIProvider.instance.request(apiRequest);
        LocalService.accessToken = response["accessToken"];
        LocalService.refreshToken = response["refreshToken"];
        return const Right(null);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }

  @override
  Future<Either<Failure, Account>> account() async {
    if (await _networkInfo.isConnected) {
      try {
        APIRequestRepresentable apiRequest = APIRequestRepresentable(
          url: AppPaths.getAccount,
          method: HTTPMethod.get,
        );
        var response = await APIProvider.instance.request(apiRequest);
        Account account = Account.fromJson(response["client"]);

        var currentState = LocalService.state;
        LocalService.profile = account.profile;

        if (currentState != account.accountDetails.state) {
          await Get.find<AuthRepositoryImpl>().refreshToken();
        }
        LocalService.state = account.accountDetails.state;

        return Right(account);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }

  @override
  Future<Either<Failure, void>> sendOTP(int phoneNumber) async {
    if (await _networkInfo.isConnected) {
      try {
        final body = {"phoneNumber": phoneNumber};
        APIRequestRepresentable apiRequest = APIRequestRepresentable(
          url: AppPaths.sendOTP,
          method: HTTPMethod.post,
          body: body,
        );
        var response = await APIProvider.instance.request(apiRequest);
        var token = response["token"];
        LocalService.accessToken = token;
        return const Right(null);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }

  @override
  Future<Either<Failure, AccountState>> verifyOTP(
      int phoneNumber, int code, String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final body = {
          "phoneNumber": phoneNumber,
          "code": code,
          "notificationID": token
        };
        APIRequestRepresentable apiRequest = APIRequestRepresentable(
            url: AppPaths.verifyOTP, method: HTTPMethod.post, body: body);
        var response = await APIProvider.instance.request(apiRequest);
        final bool hasAccount = response["hasAccount"];
        AccountState state = AccountState.noAccount;
        if (hasAccount) {
          state = AccountState.getState(
              response["client"]["User"]["Account"]["state"]);
          // update profile in local
          // if (state == AccountState.activated) {
          LocalService.profile = Profile.fromJson(response["client"]);
          //}
          LocalService.state = state;

          LocalService.refreshToken = response["refreshToken"];
        }
        LocalService.accessToken = response["accessToken"];
        return Right(state);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }

  @override
  Future<Either<Failure, void>> signup(Registration registration) async {
    if (await _networkInfo.isConnected) {
      try {
        final body = registration.toJson();
        APIRequestRepresentable apiRequest = APIRequestRepresentable(
            url: AppPaths.signup, method: HTTPMethod.post, body: body);
        var response = await APIProvider.instance.request(apiRequest);
        //change state to candidacy
        LocalService.accessToken = response["accessToken"];
        LocalService.refreshToken = response["refreshToken"];
        LocalService.state = AccountState.activated;

        LocalService.profile = Profile.fromJson(response["client"]);

        return const Right(null);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    if (await _networkInfo.isConnected) {
      var body = {};
      try {
        APIRequestRepresentable apiRequest = APIRequestRepresentable(
          url: AppPaths.logout,
          method: HTTPMethod.post,
          body: body,
        );
        await APIProvider.instance.request(apiRequest);
        LocalService.clear();
        await Get.deleteAll();
        Get.offAllNamed(Routes.welcomeRoute);
        return const Right(null);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }
}
