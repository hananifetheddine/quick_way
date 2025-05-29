import 'package:dartz/dartz.dart';

import '../../../data/network/error_handler.dart';
import '../../entities/map/place/prediction.dart';
import '../../repositories/map_repository.dart';
import '../base_usecase.dart';

class AutoCompleteUseCase
    implements BaseUseCase<Tuple2<String, String>, List<Prediction>> {
  final MapRepository _repository;

  AutoCompleteUseCase(this._repository);

  @override
  Future<Either<Failure, List<Prediction>>> execute(
      Tuple2<String, String> params) async {
    return await _repository.autoComplete(params.value1, params.value2);
  }
}
