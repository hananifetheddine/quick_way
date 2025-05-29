abstract class Place {
  String formattedAddress;
  String name;
  String placeId;

  Place(
      {required this.formattedAddress,
      required this.name,
      required this.placeId});

  String get detailedAddress => "$name, $formattedAddress";
}
