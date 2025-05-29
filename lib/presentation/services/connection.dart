import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../main.dart';

class ConnectionService extends GetxService {
  final InternetConnectionChecker internetConnectionChecker;

  ConnectionService(this.internetConnectionChecker);

  RxBool isConnected = false.obs;

  @override
  onInit() {
    super.onInit();
    trackConnection();
    listenConnection();
  }

  trackConnection() {
    internetConnectionChecker.onStatusChange.listen(
      (event) {
        isConnected.value = event == InternetConnectionStatus.connected;
      },
    );
  }

  listenConnection() {
    isConnected.listen((bool connected) {
      //todo : change here
      if (!connected) {
        //showConnectionSnack();
      } else {
        //hideConnectionSnack();
      }
    });
  }
}
