import 'package:dartz/dartz.dart';
import '../../data/network/error_handler.dart';
import '../entities/map/geometry.dart';
import '../entities/map/place/place_details.dart';
import '../entities/map/place/prediction.dart';
import '../entities/map/routes/polyline.dart';

abstract class MapRepository {
  Future<Either<Failure, List<Prediction>>> autoComplete(
      String value, String token);

  Future<Either<Failure, PlaceDetails>> placeById(String value, String token);

  Future<Either<Failure, Polyline>> polyline(
      Geometry userLocation, Geometry packageLocation, List<String> wayPoints);
}
