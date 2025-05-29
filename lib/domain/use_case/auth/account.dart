import 'package:dartz/dartz.dart';

import '../../../data/network/error_handler.dart';
import '../../entities/user/account.dart';
import '../../repositories/auth_repository.dart';
import '../base_usecase.dart';

class GetAccountUseCase implements BaseUseCaseNoParams<Account> {
  final AuthRepository _repository;

  GetAccountUseCase(this._repository);

  @override
  Future<Either<Failure, Account>> execute() async {
    return await _repository.account();
  }
}
