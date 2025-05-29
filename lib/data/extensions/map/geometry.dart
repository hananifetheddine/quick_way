import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_webservice/places.dart' as web_service;

import '../../../domain/entities/map/geometry.dart';

extension ExtensionGeometry on Geometry {
  web_service.Location toLocation() {
    return web_service.Location(lat: lat, lng: long);
  }

  PolylineWayPoint toPolylineWayPoint() {
    return PolylineWayPoint(location: '', stopOver: false);
  }
}
