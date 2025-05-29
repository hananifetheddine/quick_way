import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../../domain/entities/map/geometry.dart';
import '../../../domain/entities/map/routes/polyline.dart';

extension PolylineResultExtension on PolylineResult {
  Polyline toPolyline() {
    return Polyline(
        points: points
            .map(
                (point) => Geometry(lat: point.latitude, long: point.longitude))
            .toList(),
        distance: totalDistanceValue!,
        duration: totalDurationValue!);
  }
}
