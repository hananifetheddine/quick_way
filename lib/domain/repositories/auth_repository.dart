import 'package:dartz/dartz.dart';
import '../../data/network/error_handler.dart';
import '../../presentation/utils/enums.dart';
import '../entities/toApi/auth/registration.dart';
import '../entities/user/account.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> sendOTP(int phoneNumber);

  Future<Either<Failure, AccountState>> verifyOTP(
      int phoneNumber, int code, String token);

  Future<Either<Failure, void>> signup(Registration registration);

  Future<Either<Failure, void>> logOut();

  Future<Either<Failure, Account>> account();
}
