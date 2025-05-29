import '../geometry.dart';

class Polyline {
  List<Geometry> points;
  int distance;
  int duration;

  Polyline(
      {required this.points, required this.distance, required this.duration});
}
