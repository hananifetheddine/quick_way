import 'package:dartz/dartz.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart' as web_service;
import 'package:quick_way/data/extensions/map/predicition.dart';
import 'package:quick_way/data/extensions/map/routes.dart';
import 'package:quick_way/data/extensions/map/web_service.dart';

import '../../app/constants.dart';
import '../../domain/entities/map/geometry.dart';
import '../../domain/entities/map/place/place_details.dart';
import '../../domain/entities/map/place/prediction.dart';
import '../../domain/entities/map/routes/polyline.dart';
import '../../domain/repositories/map_repository.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class MapRepositoryImpl extends GetxService implements MapRepository {
  final NetworkInfo _networkInfo;
  late final web_service.GoogleMapsPlaces places;

  MapRepositoryImpl(this._networkInfo);

  @override
  void onInit() async {
    places = web_service.GoogleMapsPlaces(
      apiKey: Constants.apiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    super.onInit();
  }

  @override
  Future<Either<Failure, List<Prediction>>> autoComplete(
      String value, String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final res = await places.autocomplete(
          value,
          language: "fr",
          sessionToken: token,
          location: web_service.Location(lat: 2.3522, lng: 48.8566),
          components: [
            web_service.Component(web_service.Component.country, "fr")
          ],
        );
        if (res.errorMessage == null) {
          List<Prediction> predictions = res.predictions
              .map((prediction) => prediction.toPrediction())
              .toList();
          return Right(predictions);
        }
        return const Left(Failure.defaultError);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }

  @override
  Future<Either<Failure, PlaceDetails>> placeById(
      String id, String token) async {
    if (await _networkInfo.isConnected) {
      try {
        var res = await places.getDetailsByPlaceId(id,
            fields: ["formatted_address", "geometry", "name", "place_id"],
            sessionToken: token);
        if (res.status == "OK") {
          return Right(res.result.toPlaceDetails());
        }
        return const Left(Failure.defaultError);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }

  @override
  Future<Either<Failure, Polyline>> polyline(Geometry userLocation,
      Geometry packageLocation, List<String> wayPoints) async {
    if (await _networkInfo.isConnected) {
      try {
        PolylinePoints polylinePoints = PolylinePoints();
        var res = await polylinePoints.getRouteBetweenCoordinates(
            googleApiKey: Constants.apiKey,
            request: PolylineRequest(
                avoidFerries: false,
                origin: PointLatLng(userLocation.lat, userLocation.long),
                destination:
                    PointLatLng(packageLocation.lat, packageLocation.long),
                mode: TravelMode.driving,
                wayPoints: wayPoints
                    .map((point) => PolylineWayPoint(location: point))
                    .toList()));

        if (res.status == "OK") {
          return Right(res.toPolyline());
        }

        return const Left(Failure.defaultError);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }
}
