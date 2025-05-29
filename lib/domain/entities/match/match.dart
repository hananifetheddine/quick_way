import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../presentation/utils/enums.dart';
import '../Trip/trip.dart';

class MatchOfPackage {
  String matchId;
  String packageId;
  Rx<MatchState> state;
  MatchType type;
  List<TripMatch> trips;

  MatchOfPackage(
      {required this.matchId,
      required this.packageId,
      required this.state,
      required this.type,
      this.trips = const <TripMatch>[]});

  factory MatchOfPackage.fromJson(Map<String, dynamic> json) {
    return MatchOfPackage(
      matchId: json['matchId'].toString(),
      packageId: json['packageId'].toString(),
      state: MatchState.getState(json['state']).obs,
      trips: json['MatchSegments'] == null
          ? []
          : (json['MatchSegments'] as List)
              .map((e) => TripMatch.fromJson(e))
              .toList(),
      type: MatchType.getValue(json["type"]),
    );
  }

  void sortMatches(List<MatchOfPackage> matches) {
    matches.sort((a, b) {
      // Define priority order for MatchType
      int getTypePriority(MatchType type) {
        switch (type) {
          case MatchType.direct:
            return 1;
          case MatchType.oneConnection:
            return 2;
          case MatchType.twoConnections:
            return 3;
        }
      }

      // First, sort by type priority
      int typeComparison =
          getTypePriority(a.type).compareTo(getTypePriority(b.type));
      if (typeComparison != 0) {
        return typeComparison;
      }

      // If types are the same, sort by the number of trips (secondary sorting)
      return a.trips.length.compareTo(b.trips.length);
    });
  }
}
