import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../resources/assets_manager.dart';
import '../resources/theme_manager.dart';

LatLngBounds computeBounds(List<LatLng> list) {
  assert(list.isNotEmpty);
  var firstLatLng = list.first;
  var s = firstLatLng.latitude,
      n = firstLatLng.latitude,
      w = firstLatLng.longitude,
      e = firstLatLng.longitude;
  for (var i = 1; i < list.length; i++) {
    var latlng = list[i];
    s = min(s, latlng.latitude);
    n = max(n, latlng.latitude);
    w = min(w, latlng.longitude);
    e = max(e, latlng.longitude);
  }
  return LatLngBounds(southwest: LatLng(s, w), northeast: LatLng(n, e));
}

min(double x1, double x2) => x1 < x2 ? x1 : x2;

max(double x1, double x2) => x1 > x2 ? x1 : x2;

styleMap(GoogleMapController controller) {
  if (ThemeManager.isThemeDark()) {
    controller.setMapStyle(MapStyles.darkMapStyle);
  }
}
/*
 if (userLocation.latitude > packageLocation.latitude &&
        userLocation.longitude > packageLocation.longitude) {
      bound = LatLngBounds(southwest: packageLocation, northeast: userLocation);
    } else if (userLocation.longitude > packageLocation.longitude) {
      bound = LatLngBounds(
          southwest: LatLng(userLocation.latitude, packageLocation.longitude),
          northeast: LatLng(packageLocation.latitude, userLocation.longitude));
    } else if (userLocation.latitude > packageLocation.latitude) {
      bound = LatLngBounds(
          southwest: LatLng(packageLocation.latitude, userLocation.longitude),
          northeast: LatLng(userLocation.latitude, packageLocation.longitude));
    } else {
      bound = LatLngBounds(southwest: userLocation, northeast: packageLocation);
    }
 */
