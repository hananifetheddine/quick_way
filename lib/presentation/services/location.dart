import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

import '../../domain/entities/map/place/place_details.dart';
import '../../main.dart';

class LocationService extends GetxService {
  final _permission = Permission.locationWhenInUse;
  final loc.Location _locationService = loc.Location();

  LocationService();

  @override
  onInit() {
    super.onInit();
  }

  Future<bool> askPermission() async {
    try {
      PermissionStatus status = await _permission.status;
      if (status == PermissionStatus.granted) return true;
      if (status == PermissionStatus.denied) {
        return await _permission.request().isGranted;
      }
      if (status == PermissionStatus.permanentlyDenied) {
        await openAppSettings();
        return false;
      }
      return false;
    } on Exception catch (e) {
      logger.e(e);
      return false;
    }
  }
}

void isolateFunction(IsolateData isolate) async {
  try {
    BackgroundIsolateBinaryMessenger.ensureInitialized(isolate.token);
    var enabled = await geo.Geolocator.isLocationServiceEnabled();
    isolate.answerPort.send(enabled);
  } on Exception catch (_) {
    isolate.answerPort.send(false);
  }
}

class IsolateData {
  final RootIsolateToken token;
  final SendPort answerPort;

  IsolateData({
    required this.token,
    required this.answerPort,
  });
}
