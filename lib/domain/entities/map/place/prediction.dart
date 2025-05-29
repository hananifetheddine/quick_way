import 'package:quick_way/domain/entities/map/place/place.dart';

class Prediction extends Place {
  Prediction(
      {required super.formattedAddress,
      required super.name,
      required super.placeId});

  factory Prediction.fromJson(Map<String, dynamic> data) {
    return Prediction(
      placeId: data["placeId"],
      name: data["name"],
      formattedAddress: data["formattedAddress"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "reference": placeId,
      "formattedAddress": formattedAddress,
      "name": name
    };
  }
}
