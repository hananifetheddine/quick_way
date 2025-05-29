import 'package:quick_way/domain/entities/map/geometry.dart';

class NewPackage {
  final String title;
  final String description;
  final Geometry fromLocation;
  final Geometry toLocation;
  final String weight;
  final String deadLine;
  final String image;
  final String dimensions;
  final int? dropOffFeet;
  final int? dropOffTransport;
  final int? collectTransport;
  final int? collectFeet;

  NewPackage({
    required this.dropOffTransport,
    required this.collectTransport,
    required this.collectFeet,
    required this.dropOffFeet,
    required this.title,
    required this.description,
    required this.fromLocation,
    required this.toLocation,
    required this.weight,
    required this.deadLine,
    required this.image,
    required this.dimensions,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "fromLocationLat": fromLocation.lat,
      "fromLocationLong": fromLocation.long,
      "toLocationLong": toLocation.long,
      "toLocationLat": toLocation.lat,
      "weight": weight,
      "deadLine": deadLine,
      "image": image,
      "dimensions": dimensions,
      "dropOffFeet": dropOffFeet,
      "dropOffTransport": dropOffTransport,
      "collectFeet": collectFeet,
      "collectTransport": collectTransport
    };
  }
}
