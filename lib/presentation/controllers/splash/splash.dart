import 'dart:async';
import 'package:get/get.dart';
import '../../resources/assets_manager.dart';
import '../../resources/routes_manager.dart';

//enum FromScreen { auth, init }

class SplashController extends GetxController {
  //late FromScreen from;
  SplashController();

  String nextPage = AppPages.pageByState();

  @override
  void onInit() {
    super.onInit();
    //from = Get.arguments["from"] == null ? FromScreen.init : FromScreen.auth;
    _makeReq();
  }

  _makeReq() async {
    List<Future> requirements = [
      _loadMarkers(),
      _loadMapStyle(),
    ];

    await Future.wait(requirements);
    Get.offAllNamed(nextPage);
  }

  Future _loadMarkers() async {
    //await MarkersAssets.load();
  }

  Future _loadMapStyle() async {
    //await MapStyles.load();
  }
}
