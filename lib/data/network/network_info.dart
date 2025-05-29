import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends GetxService implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  RxBool connected = true.obs;

  NetworkInfoImpl(this.internetConnectionChecker);

  @override
  Future<bool> get isConnected async =>
      await internetConnectionChecker.hasConnection;
}
