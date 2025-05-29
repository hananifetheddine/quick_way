import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../app/local.dart';
import '../utils/enums.dart';
import 'foreground.dart';

class LifeCycleService extends GetxService {
  late final AppLifecycleListener listener;

  LifeCycleService(this._foregroundService);

  final ForegroundService _foregroundService;
  late AppLifecycleState state;
  AccountState accountState = LocalService.state;

  @override
  void onInit() {
    startListening();
    super.onInit();
  }

  startListening() async {
    listener =
        AppLifecycleListener(onStateChange: (AppLifecycleState state) async {
      this.state = state;
      switch (state) {
        case AppLifecycleState.detached:
          {}
        case AppLifecycleState.resumed:
          {
            if (accountState == AccountState.activated) {
              await _foregroundService.startService();
            }
          }
        case AppLifecycleState.inactive:
          {}

        case AppLifecycleState.hidden:
          {}
        case AppLifecycleState.paused:
          {
            if (accountState == AccountState.activated) {
              await _foregroundService.stopService();
            }
          }
      }
    });
  }
}
