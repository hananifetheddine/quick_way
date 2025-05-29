import 'package:get/get.dart';
import 'package:quick_way/presentation/utils/date.dart';

import '../../../presentation/utils/enums.dart';
import '../map/place/address.dart';
import '../stop/stop.dart';
import '../user/courier.dart';

class TripMatch {
  final Courier courier;
  final String departureDate;
  final String id;
  Rx<MatchState> matchState;
  Stop fromStop;
  Stop toStop;

  TripMatch(
      {required this.courier,
      required this.matchState,
      required this.departureDate,
      required this.fromStop,
      required this.toStop,
      required this.id});

  factory TripMatch.fromJson(Map<String, dynamic> json) {
    final jsonTrip = json['Trip'];
    return TripMatch(
      courier: Courier.fromJson(jsonTrip['Courier']),
      departureDate: DateTime.parse(jsonTrip['departureDate']).toStringDM(),
      matchState: MatchState.getState(json['state']).obs,
      id: json["id"].toString(),
      fromStop: Stop.fromJson(json["fromStop"]),
      toStop: Stop.fromJson(json["toStop"]),
    );
  }
}
