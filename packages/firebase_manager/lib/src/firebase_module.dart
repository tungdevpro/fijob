import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

typedef OnInitialMsg = Function(RemoteMessage message);

class FirebaseModule {
  FirebaseModule._internal();

  factory FirebaseModule() {
    return _instance;
  }

  static final FirebaseModule _instance = FirebaseModule._internal();

  Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  Future<void> requestPermission() async {
    await FirebaseMessaging.instance.requestPermission(alert: true, sound: true, criticalAlert: true);
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, sound: true, badge: true);
  }

  Future<String> getToken() async {
    try {
      final result = await FirebaseMessaging.instance.getToken();
      return result ?? '';
    } catch (e) {
      return '';
    }
  }

  void listenForegroundNotification({VoidCallback? actionMessage}) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
  }

  void initialMessage({OnInitialMsg? onInitialMsg}) {
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {});
  }
}
