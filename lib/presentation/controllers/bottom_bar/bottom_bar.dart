import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/pages/chat/chats/chats.dart';
import 'package:quick_way/presentation/pages/home/home.dart';

import '../../pages/settings/settings/settings.dart';
import '../../pages/trips/trips.dart';
import '../../resources/assets_manager.dart';

class BottomBarController extends GetxController {
  RxInt index = 0.obs;
  List<String> icons = [
    IconAssets.homeIcon,
    IconAssets.chatIcon,
    IconAssets.listIcon,
    IconAssets.personIcon,
  ];

  List<Widget> screens = [
    const HomeView(),
    const ChatsView(),
    const TripsView(),
    const SettingsView()
  ];

  updateIndex(int p1) {
    index.value = p1;
    _animateToPage(p1);
  }

  final controller = PageController();

  _animateToPage(newIndex) {
    controller.animateToPage(newIndex,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
