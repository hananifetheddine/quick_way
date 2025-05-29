import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../domain/entities/User/profile.dart';
import '../domain/entities/map/geometry.dart';
import '../domain/entities/map/place/place_details.dart';
import '../presentation/utils/enums.dart';

class LocalService extends GetxService {
  static final box = GetStorage();

  static clear() async {
    final keys = List.from(box.getKeys());
    for (final key in keys) {
      await box.remove(key);
    }
  }

  //tokens
  static set accessToken(String token) => box.write("token", token);

  static String get accessToken => box.read("token") ?? "";

  static set refreshToken(String token) => box.write("refreshToken", token);

  static String get refreshToken => box.read("refreshToken") ?? "";

  //state
  static set state(AccountState state) => box.write("state", state.name);

  static AccountState get state =>
      AccountState.getState(box.read("state") ?? "noAccount");

  //profile
  static set profile(Profile profile) =>
      box.write("profile", profile.toLocal());

  static Profile get profile => Profile.fromLocal(box.read("profile"));

  //location
  static set currentPosition(PlaceDetails position) =>
      box.write("position", position.toJson());

  static PlaceDetails get currentPosition => box.read("position") != null
      ? PlaceDetails.fromJson(box.read("position"))
      : PlaceDetails(
          formattedAddress: "",
          geometry: Geometry(lat: 36.752887, long: 3.042048),
        );

  // current delivery
  static int get currentDeliveryId => box.read("deliveryId") ?? -1;

  static set currentDeliveryId(int id) => box.write("deliveryId", id);

  //themes
  static ThemeDisplay get theme =>
      ThemeDisplay.getTheme(box.read("theme") ?? "system");

  static set theme(ThemeDisplay value) => box.write("theme", value.name);

  //show permission dialog box
  static set showLocationPermission(bool show) =>
      box.write("permission location", show);

  static bool get showLocationPermission =>
      box.read("permission location") ?? true;

  static bool hasLocation() =>
      currentPosition.geometry.lat != 36.752887 ||
      currentPosition.geometry.long != 3.042048;

  //history search
  static get historySearch => _getHistorySearchList();

  static List<PlaceDetails> _getHistorySearchList() {
    List<dynamic> placesMap = box.read("history") ?? [];
    List<PlaceDetails> places =
        placesMap.map((item) => PlaceDetails.fromJson(item)).toList();
    return places;
  }

  static void _setHistorySearchList(List<PlaceDetails> places) {
    List<Map<String, dynamic>> placesMpa =
        places.take(5).map((place) => place.toJson()).toList();
    box.write("history", placesMpa);
  }

  static addPlaceToHistory(PlaceDetails place) {
    List<PlaceDetails> places = _getHistorySearchList();
    places.removeWhere((element) => element.placeId == place.placeId);
    places.insert(0, place);
    _setHistorySearchList(places);
  }
}
