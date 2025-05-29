import 'package:quick_way/domain/entities/map/place/place.dart';

import '../../../../presentation/utils/place.dart';
import '../geometry.dart';

class PlaceDetails extends Place {
  Geometry geometry;

  PlaceDetails(
      {required super.formattedAddress,
      super.name = "",
      super.placeId = "",
      required this.geometry});

  factory PlaceDetails.fromJson(Map<String, dynamic> data) {
    return PlaceDetails(
      placeId: data["placeId"],
      name: data["name"],
      formattedAddress: data["formattedAddress"],
      geometry: Geometry.fromJson(data["geometry"]),
    );
  }

  factory PlaceDetails.fromBDD(Map<String, dynamic> data) {
    return PlaceDetails(
      placeId: "",
      name: "",
      formattedAddress: data["address"],
      geometry: Geometry.fromJson(data["location"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "placeId": placeId,
      "formattedAddress": formattedAddress,
      "geometry": geometry.toJson(),
    };
  }

  factory PlaceDetails.forDelivery(Geometry location, String address) {
    var details = detailsAddress(address);
    return PlaceDetails(
      placeId: "",
      name: details.$1,
      formattedAddress: details.$2,
      geometry: location,
    );
  }

  String getCity() {
    List<String> details = formattedAddress.split(",");
    String city = details[details.length - 2].trim();
    if (city.contains("Wilaya d'")) {
      city = city.split("d'")[1];
    } else if (city.contains("Wilaya de ")) {
      city = city.split("de ")[1];
    } else if (city.contains("Province")) {
      city = city.split(" Province")[0];
    } else {
      city = "";
    }
    return city;
  }

  @override
  bool operator ==(Object other) =>
      other is PlaceDetails &&
      runtimeType == other.runtimeType &&
      formattedAddress == other.formattedAddress &&
      geometry == other.geometry;

  @override
  int get hashCode =>
      name.hashCode ^
      placeId.hashCode ^
      formattedAddress.hashCode ^
      geometry.lat.hashCode;

  @override
  String toString() {
    return '${super.toString()} PlaceDetails{geometry: $geometry}';
  }
}
