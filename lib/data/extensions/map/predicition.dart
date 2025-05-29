import 'package:google_maps_webservice/places.dart' as web_service;

import '../../../domain/entities/map/place/prediction.dart';
import '../../../presentation/utils/place.dart';

extension PredictionExtension on web_service.Prediction {
  Prediction toPrediction() {
    var details = detailsAddress(description!);

    return Prediction(
      placeId: placeId ?? "",
      name: details.$1,
      formattedAddress: details.$2,
    );
  }
}
