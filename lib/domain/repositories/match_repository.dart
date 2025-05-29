import 'package:dartz/dartz.dart';

import '../../data/network/error_handler.dart';
import '../entities/match/match.dart';

abstract class MatchRepository {
  Future<Either<Failure, List<MatchOfPackage>>> getTripsMatchs(
      String idPackage);
  Future<Either<Failure, void>> updateState(
      String idPackage, String idTrip, String state);
}
