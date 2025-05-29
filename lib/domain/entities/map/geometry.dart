class Geometry {
  double lat;
  double long;

  Geometry({required this.lat, required this.long});

  factory Geometry.fromJson(Map<String, dynamic> data) {
    return Geometry(lat: data['lat'], long: data["long"]);
  }

  factory Geometry.fromBDD(Map<String, dynamic> data) {
    return Geometry(lat: data["coordinates"][0], long: data["coordinates"][1]);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Geometry &&
          runtimeType == other.runtimeType &&
          lat == other.lat &&
          long == other.long;

  @override
  int get hashCode => lat.hashCode ^ long.hashCode;

  @override
  String toString() {
    return 'Geometry{lat: $lat, long: $long}';
  }

  toJson() {
    return {
      "lat": lat,
      "long": long,
    };
  }
}
