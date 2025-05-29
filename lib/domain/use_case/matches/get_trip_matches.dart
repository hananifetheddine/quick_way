import 'package:dartz/dartz.dart';
import 'package:quick_way/domain/entities/Trip/trip.dart';
import 'package:quick_way/domain/repositories/match_repository.dart';

import '../../../data/network/error_handler.dart';
import '../../entities/match/match.dart';
import '../base_usecase.dart';

class GetTripMatchesUseCase implements BaseUseCase<String, List<MatchOfPackage>> {
  final MatchRepository _repository;

  GetTripMatchesUseCase(this._repository);

  @override
  Future<Either<Failure, List<MatchOfPackage>>> execute(String id) async {
    return await _repository.getTripsMatchs(id);
  }
}
