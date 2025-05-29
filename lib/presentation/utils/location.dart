import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../domain/entities/map/geometry.dart';
import '../../domain/entities/map/place/place_details.dart';

extension ExtensionLatLng on LatLng {
  Future<String> getDetailAddress() async {
    var addresses = await geo.placemarkFromCoordinates(latitude, longitude);
    var address = addresses.first;
    return "${address.locality!}, ${address.subAdministrativeArea!}, ${address.administrativeArea!}, ${address.country!} ";
  }

  Geometry toGeometry() => Geometry(lat: latitude, long: longitude);
}

extension ExtensionLocationData on LocationData {
  LatLng get latLang => LatLng(latitude ?? 0, longitude ?? 0);
}

extension ExtensionDetailPlace on PlaceDetails {
  LatLng get latLng => LatLng(geometry.lat, geometry.long);
}

extension ExtensionGeometry on Geometry {
  LatLng toLatLng() => LatLng(lat, long);
}
