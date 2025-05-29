import 'package:get/get.dart';

import '../../../data/network/error_handler.dart';

class TripsController extends GetxController {
  List trips = [];
  //UI
  final Rx<Failure> failure = Failure.noFailure.obs;
  RxBool fetching = false.obs;

  switchState() => fetching.toggle();
}
