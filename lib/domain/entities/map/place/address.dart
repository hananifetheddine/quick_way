import 'package:quick_way/domain/entities/map/geometry.dart';

import 'place_details.dart';

class Address extends PlaceDetails {
  String city;

  Address(
      {required this.city,
      required super.formattedAddress,
      required super.geometry,
      super.name});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json["city"],
      city: json['city'],
      formattedAddress: json['address'],
      geometry: Geometry.fromBDD(json["geometry"]),
    );
  }
}
