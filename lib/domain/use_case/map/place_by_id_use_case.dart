import 'package:dartz/dartz.dart';
import '../../../data/network/error_handler.dart';
import '../../entities/map/place/place_details.dart';
import '../../repositories/map_repository.dart';
import '../base_usecase.dart';

class PlaceByIdUseCase
    implements BaseUseCase<Tuple2<String, String>, PlaceDetails> {
  final MapRepository _repository;

  PlaceByIdUseCase(this._repository);

  @override
  Future<Either<Failure, PlaceDetails>> execute(
      Tuple2<String, String> params) async {
    return await _repository.placeById(params.value1, params.value2);
  }
}
