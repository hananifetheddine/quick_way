import 'package:dartz/dartz.dart';

import '../../../data/network/error_handler.dart';
import '../../repositories/auth_repository.dart';
import '../base_usecase.dart';

class SendOTPUseCase implements BaseUseCase<int, void> {
  final AuthRepository _repository;

  SendOTPUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(int phoneNumber) async {
    return await _repository.sendOTP(phoneNumber);
  }
}
