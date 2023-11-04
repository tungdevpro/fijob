import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../push_notification.dart';

class PushNotification {
  PushNotification._internal();

  static final PushNotification _instance = PushNotification._internal();

  static PushNotification get instance => _instance;

  Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
      null, //'resource://drawable/res_app_icon',//
      [
        NotificationChannel(
          // channelGroupKey: NotifyConstants.channelGroupKey,
          channelKey: NotifyConstants.channelKey,
          channelName: NotifyConstants.channelName,
          channelDescription: NotifyConstants.channelDescription,
          playSound: true,
          onlyAlertOnce: true,
          groupAlertBehavior: GroupAlertBehavior.Children,
          importance: NotificationImportance.Max,
          defaultPrivacy: NotificationPrivacy.Private,
          defaultColor: Colors.deepPurple,
          ledColor: Colors.deepPurple,
        )
      ],
      debug: true,
    );
  }

  Future<void> initializeNotificationsEventListeners() async {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
    );
  }

  Future<bool> requestPermission() async {
    bool? hasAllow = await AwesomeNotifications().isNotificationAllowed();
    if (hasAllow) return false;
    return await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  Future<void> resetBadgeCounter() async => await AwesomeNotifications().resetGlobalBadge();

  Future<void> cancelNotifications() async => await AwesomeNotifications().cancelAll();

  Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {}

  Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {}

  Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {}

  Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {}
}
