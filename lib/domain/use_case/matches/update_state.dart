import 'package:dartz/dartz.dart';
import 'package:quick_way/domain/repositories/match_repository.dart';

import '../../../data/network/error_handler.dart';
import '../base_usecase.dart';

class UpdateMatchStateUseCase
    implements BaseUseCase<Tuple3<String, String, String>, void> {
  final MatchRepository _repository;

  UpdateMatchStateUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(
      Tuple3<String, String, String> params) async {
    return await _repository.updateState(
        params.value1, params.value2, params.value3);
  }
}
