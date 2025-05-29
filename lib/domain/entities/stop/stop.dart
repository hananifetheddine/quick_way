import 'package:quick_way/presentation/utils/date.dart';

import '../map/place/address.dart';

class Stop {
  int id;
  int tripId;
  int locationId;
  DateTime? fromDate;
  DateTime? toDate;
  String stopCase;
  int order;
  int? pickUpOption;
  int? deliveryOption;
  DateTime? storageBeforeDate;
  DateTime? storageAfterDate;
  Address location;

  Stop({
    required this.id,
    required this.tripId,
    required this.locationId,
    required this.fromDate,
    required this.toDate,
    required this.stopCase,
    required this.order,
    required this.pickUpOption,
    required this.deliveryOption,
    required this.storageBeforeDate,
    required this.storageAfterDate,
    required this.location,
  });

  factory Stop.fromJson(Map<String, dynamic> json) {
    return Stop(
      id: json['id'],
      tripId: json['tripId'],
      locationId: json['locationId'],
      fromDate: dateJsonNull(json['fromDate']),
      toDate: dateJsonNull(json['toDate']),
      stopCase: json['stopCase'],
      order: json['order'],
      pickUpOption: json['pickUpOption'],
      deliveryOption: json['deliveryOption'],
      storageBeforeDate: dateJsonNull(json['storageBeforeDate']),
      storageAfterDate: dateJsonNull(json['storageAfterDate']),
      location: Address.fromJson(json['Location']),
    );
  }
}
