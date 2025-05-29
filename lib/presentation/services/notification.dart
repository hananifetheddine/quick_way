import 'dart:isolate';
import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/chat/chats.dart';

import '../../main.dart';
import '../utils/enums.dart';

class NotificationService extends GetxService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final AndroidNotificationDetails _androidSpec =
      const AndroidNotificationDetails(
    "high_importance_channel",
    "Important",
    importance: Importance.max,
    priority: Priority.high,
  );

  final AndroidNotificationChannel _channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'Important', // title
    description: '', // description
    importance: Importance.max,
  );

  @override
  onInit() async {
    super.onInit();
    _requestPermission();
    listenBackgroundNotification();
    await _initialize();
    _initializeMessage();
    //_getTokenNotification();
  }

  Future<String> getTokenNotification() async {
    String token = "";
    try {
      await FirebaseMessaging.instance.getAPNSToken();
      token = await FirebaseMessaging.instance.getToken() ?? "";
    } catch (err) {
      logger.i(err);
    }
    return token;
  }

  _initialize() async {
    var androidInit = const AndroidInitializationSettings('notification_icon');

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            requestProvisionalPermission: true,
            requestCriticalPermission: true,
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: onDidReceiveNotificationResponse);

    var initSettings = InitializationSettings(
        android: androidInit, iOS: initializationSettingsDarwin);

    await _flutterLocalNotificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: (notification) async {
      if (notification.payload != null && notification.payload!.isNotEmpty) {}
    });

    FirebaseMessaging.onMessage.listen(
      (message) {
        RemoteNotification? notification = message.notification;
        logger.i("inside app");
        if (notification != null) {
          String? payload = message.data.toString();
          NotificationType notificationType =
              NotificationType.getValue(message);
          if (notificationType == NotificationType.message) {
            var controller = Get.find<ChatsController>();
            controller.refreshData();
          }
          sendNotification(
            title: notification.title!,
            body: notification.body!,
            payload: payload,
          );
        }
      },
    );
    // FirebaseMessaging.onBackgroundMessage(_onBackground);

    //click
    //// ki tkon app f la ram mais mchi mahloula
    // FirebaseMessaging.onMessageOpenedApp
    //    .listen((message) => notificationHandle(message, false));
  }

  //// ki tkon app mbal3a ga3
  _initializeMessage() async {
    final RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
  }

  // 3la hsab doc for versions older then 10
  void onDidReceiveNotificationResponse(
      int id, String? title, String? body, String? payload) {}

  _requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  sendNotification({
    required String title,
    required String body,
    required String? payload,
  }) async {
    DarwinNotificationDetails iosSpec = const DarwinNotificationDetails();
    var notification = NotificationDetails(android: _androidSpec, iOS: iosSpec);
    await _flutterLocalNotificationsPlugin.show(0, title, body, notification,
        payload: payload);
  }

  listenBackgroundNotification() {
    final ReceivePort port = ReceivePort();
    IsolateNameServer.removePortNameMapping('fcm_port');
    IsolateNameServer.registerPortWithName(port.sendPort, 'fcm_port');
    port.listen((dynamic message) async {
      //PackageDeliveryRequest request = PackageDeliveryRequest.fromJson(message);
      if (message != null) {
        String? payload = message.data.toString();
        NotificationType notificationType = NotificationType.getValue(message);
        if (notificationType == NotificationType.message) {
          var controller = Get.find<ChatsController>();
          controller.refreshData();
        }
      }
    });
  }
}

@pragma('vm:entry-point')
Future<void> onBackgroundFCM(RemoteMessage message) async {
  final SendPort? sendPort = IsolateNameServer.lookupPortByName('fcm_port');

  if (message.data["type"] == "message") {
    sendPort!.send(message.data);
  }
}
