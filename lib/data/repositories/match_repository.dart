import 'package:dartz/dartz.dart';
import 'package:quick_way/data/network/error_handler.dart';
import 'package:quick_way/domain/entities/Trip/trip.dart';
import 'package:quick_way/domain/repositories/match_repository.dart';

import '../../domain/entities/match/match.dart';
import '../network/api_provider.dart';
import '../network/api_request.dart';
import '../network/network_info.dart';
import '../network/paths.dart';

class MatchRepositoryImpl implements MatchRepository {
  final NetworkInfo _networkInfo;

  MatchRepositoryImpl(this._networkInfo);

  @override
  Future<Either<Failure, List<MatchOfPackage>>> getTripsMatchs(
      String idPackage) async {
    if (await _networkInfo.isConnected) {
      try {
        APIRequestRepresentable apiRequest = APIRequestRepresentable(
          url: AppPaths.tripsMatchs(idPackage),
          method: HTTPMethod.get,
        );
        var res =
            await APIProvider.instance.request(apiRequest, requestHttp: false);
        List<MatchOfPackage> matchs = res["matchs"]
            .map<MatchOfPackage>((e) => MatchOfPackage.fromJson(e))
            .toList();
        return Right(matchs);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }

  @override
  Future<Either<Failure, void>> updateState(
      String idPackage, String idMatch, String state) async {
    if (await _networkInfo.isConnected) {
      try {
        APIRequestRepresentable apiRequest = APIRequestRepresentable(
          url: AppPaths.stateMatch(idPackage, idMatch),
          method: HTTPMethod.post,
          body: {"state": state},
        );
        await APIProvider.instance.request(apiRequest, requestHttp: false);

        return const Right(null);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }
}
