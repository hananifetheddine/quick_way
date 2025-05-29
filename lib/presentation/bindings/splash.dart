import 'package:get/get.dart';

import '../controllers/splash/splash.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
