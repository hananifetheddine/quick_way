import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:quick_way/data/repositories/map_respository.dart';
import 'package:quick_way/domain/use_case/map/auto_complete_use_case.dart';
import 'package:quick_way/domain/use_case/map/place_by_id_use_case.dart';

import '../controllers/location/location.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlaceByIdUseCase(Get.find<MapRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => AutoCompleteUseCase(Get.find<MapRepositoryImpl>()),
        fenix: true);
    Get.put(LocationController(Get.find(), Get.find()));
  }
}
