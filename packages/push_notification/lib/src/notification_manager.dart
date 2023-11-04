import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:push_notification/push_notification.dart';

class NotificationManager {
  Future<void> push({String? title, String? content, Map<String, String?>? payload}) async {
    final notifyContent = NotificationContent(
      id: NotifyConstants.defaultId,
      channelKey: NotifyConstants.channelKey,
      title: title,
      body: content,
      displayOnBackground: true,
      displayOnForeground: true,
      autoDismissible: true,
      criticalAlert: true,
      locked: false,
      category: NotificationCategory.Message,
      notificationLayout: NotificationLayout.BigText,
      payload: payload,
    );

    AwesomeNotifications().createNotification(content: notifyContent);
  }

  void dismiss([int? id]) {
    if (id == null) return;
    AwesomeNotifications().dismiss(id);
  }

  void dismissAll() {
    AwesomeNotifications().dismissAllNotifications();
  }
}
