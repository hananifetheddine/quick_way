import 'package:google_maps_webservice/places.dart' as web_service;

import '../../../domain/entities/map/geometry.dart';
import '../../../domain/entities/map/place/place_details.dart';

extension WebServiceExtension on web_service.PlaceDetails {
  PlaceDetails toPlaceDetails() {
    return PlaceDetails(
      formattedAddress: formattedAddress!,
      name: name,
      placeId: placeId,
      geometry:
          Geometry(lat: geometry!.location.lat, long: geometry!.location.lng),
    );
  }
}
