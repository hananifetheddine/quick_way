import 'dart:async';
import 'dart:io';

import 'package:geolocator/geolocator.dart' as geo;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/network/network_info.dart';
import 'connection.dart';
import 'location.dart';

class ForegroundService extends GetxService {
  ForegroundService(
      this._locationService, this._connectionService, this._connectionInfo);

  final LocationService _locationService;
  final ConnectionService _connectionService;
  final NetworkInfoImpl _connectionInfo;

  late geo.LocationSettings locationSettings;
  late StreamSubscription listener;
  late StreamSubscription<ServiceStatus> serviceStatusStream;
  late StreamSubscription<bool> connectionStatusStream;

  bool serviceEnabled = false;

  @override
  onInit() {
    super.onInit();
    configure();
  }

  configure() {
    locationSettings = Platform.isAndroid
        ? geo.AndroidSettings(
            accuracy: geo.LocationAccuracy.high,
            distanceFilter: 50,
            // foregroundNotificationConfig: notificationConfig,
          )
        : geo.AppleSettings(
            allowBackgroundLocationUpdates: true,
            showBackgroundLocationIndicator: true,
            distanceFilter: 50,
          );
  }

  Future<void> startService() async {
    if (!serviceEnabled) {
      if (await Geolocator.isLocationServiceEnabled() &&
          await _connectionInfo.isConnected) {
        startListener();
      }
      serviceEnabled = true;
      trackConnection();
      trackGPSService();
    }
  }

  stopService() {
    if (serviceEnabled) {
      clearMemory();
      serviceEnabled = false;
    }
  }

  startListener() {
    listener =
        geo.Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen(sendLocation);
  }

  stopListener() {
    listener.cancel();
  }

  sendLocation(geo.Position position) async {}

  trackConnection() {
    connectionStatusStream =
        _connectionService.isConnected.listen((bool connected) {
      connected ? startListener() : stopListener();
    });
  }

  trackGPSService() {
    serviceStatusStream = geo.Geolocator.getServiceStatusStream()
        .listen((geo.ServiceStatus status) {
      status == geo.ServiceStatus.disabled ? stopListener() : startListener()();
    });
  }

  @override
  void onClose() {
    clearMemory();
    super.onClose();
  }

  clearMemory() {
    listener.cancel();
    serviceStatusStream.cancel();
    connectionStatusStream.cancel();
  }
}

var notificationConfig = const geo.ForegroundNotificationConfig(
  notificationText: "Wassla needs to keep receiving your location",
  notificationTitle: "Wassla is running",
  enableWakeLock: true,
);
