import 'package:dartz/dartz.dart';
import '../../../data/network/error_handler.dart';
import '../../../presentation/utils/enums.dart';
import '../../repositories/auth_repository.dart';
import '../base_usecase.dart';

class VerifyOTPUseCase implements BaseUseCase<Tuple3, AccountState> {
  final AuthRepository _repository;

  VerifyOTPUseCase(this._repository);

  @override
  Future<Either<Failure, AccountState>> execute(Tuple3 params) async {
    return await _repository.verifyOTP(
        params.value1, params.value2, params.value3);
  }
}
