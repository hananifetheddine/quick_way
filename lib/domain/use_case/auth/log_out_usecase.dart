import 'package:dartz/dartz.dart';

import '../../../data/network/error_handler.dart';
import '../../repositories/auth_repository.dart';
import '../base_usecase.dart';

class LogOutUseCase implements BaseUseCaseNoParams<void> {
  final AuthRepository _repository;

  LogOutUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute() async {
    return await _repository.logOut();
  }
}
