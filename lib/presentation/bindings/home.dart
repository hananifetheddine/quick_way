import 'package:get/get.dart';
import 'package:quick_way/data/repositories/match_repository.dart';
import 'package:quick_way/data/repositories/package_repostiroy.dart';
import 'package:quick_way/domain/use_case/auth/log_out_usecase.dart';
import 'package:quick_way/domain/use_case/chat/get_chat.dart';
import 'package:quick_way/domain/use_case/matches/update_state.dart';
import 'package:quick_way/domain/use_case/package/get_packages.dart';
import 'package:quick_way/presentation/controllers/chat/chat.dart';
import 'package:quick_way/presentation/controllers/home/home.dart';
import 'package:quick_way/presentation/controllers/trips/trips.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/chat_repostiroy.dart';
import '../../domain/use_case/matches/get_trip_matches.dart';
import '../controllers/bottom_bar/bottom_bar.dart';
import '../controllers/chat/chats.dart';
import '../controllers/settings/settings.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogOutUseCase(Get.find<AuthRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => GetPackagesUseCase(Get.find<PackageRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => GetTripMatchesUseCase(Get.find<MatchRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => UpdateMatchStateUseCase(Get.find<MatchRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => GetChatsUseCase(Get.find<ChatRepositoryImpl>()),
        fenix: true);
    Get.put(BottomBarController());
    Get.put(ChatsController(Get.find()));
    Get.put(TripsController());

    Get.put(HomeController(Get.find()));
    Get.put(SettingsController(Get.find()));
  }
}
