import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quick_way/data/repositories/chat_repostiroy.dart';
import 'package:quick_way/data/repositories/map_respository.dart';
import 'package:quick_way/data/repositories/match_repository.dart';
import 'package:quick_way/data/repositories/package_repostiroy.dart';

import '../../data/network/network_info.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/repositories/package_repository.dart';
import '../services/connection.dart';
import '../services/global_service.dart';
import '../services/location.dart';
import '../services/notification.dart';

class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    InternetConnectionChecker internetConnectionChecker =
        InternetConnectionChecker.createInstance(
      checkInterval: const Duration(seconds: 3),
    );

    Get.put(GlobalService(), permanent: true);

    //
    Get.put(ConnectionService(internetConnectionChecker), permanent: true);
    Get.put(NotificationService(), permanent: true);
    Get.put(LocationService(), permanent: true);

    Get.put(NetworkInfoImpl(internetConnectionChecker));
    Get.lazyPut(() => AuthRepositoryImpl(Get.find<NetworkInfoImpl>()),
        fenix: true);
    Get.lazyPut(() => MapRepositoryImpl(Get.find<NetworkInfoImpl>()),
        fenix: true);
    Get.lazyPut(() => PackageRepositoryImpl(Get.find<NetworkInfoImpl>()),
        fenix: true);
    Get.lazyPut(() => MatchRepositoryImpl(Get.find<NetworkInfoImpl>()),
        fenix: true);
    Get.lazyPut(() => ChatRepositoryImpl(Get.find<NetworkInfoImpl>()),
        fenix: true);
  }
}
