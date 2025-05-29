import 'package:quick_way/domain/entities/map/place/address.dart';

import '../../../presentation/utils/enums.dart';
import '../match/match.dart';

class Package {
  final String id;
  final String title;
  final String description;
  final Address fromLocation;
  final Address toLocation;
  final String weight;
  final String deadLine;
  final String image;
  final String dimensions;
  final List<MatchOfPackage> matchs;

  Package(
      {required this.id,
      required this.title,
      required this.description,
      required this.fromLocation,
      required this.toLocation,
      required this.weight,
      required this.deadLine,
      required this.image,
      required this.dimensions,
      required this.matchs});

  String matchsByState(MatchState state) =>
      matchs.where((element) => element.state == state).length.toString();

  factory Package.fromJons(Map<String, dynamic> data) {
    List<MatchOfPackage> matchs = data["Matches"]
        .map<MatchOfPackage>((e) => MatchOfPackage.fromJson(e))
        .toList();
    matchs.removeWhere((match) => match.state == MatchState.other);
    return Package(
      title: data["title"],
      description: data["description"],
      fromLocation: Address.fromJson(data["fromLocation"]),
      toLocation: Address.fromJson(data["toLocation"]),
      weight: data["weight"].toString(),
      deadLine: data["deadLine"].toString(),
      image: data["image"].toString(),
      dimensions: data["dimensions"].toString(),
      matchs: matchs,
      id: data["id"].toString(),
    );
  }
}
