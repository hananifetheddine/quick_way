import 'package:dartz/dartz.dart';
import '../../../data/network/error_handler.dart';
import '../../entities/toApi/auth/registration.dart';
import '../../repositories/auth_repository.dart';
import '../base_usecase.dart';

class SignupUseCase implements BaseUseCase<Registration, void> {
  final AuthRepository _repository;

  SignupUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(Registration registration) async {
    return await _repository.signup(registration);
  }
}
