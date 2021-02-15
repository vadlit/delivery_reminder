import 'package:delivery_reminder/common/dart/notifications.dart';
import 'package:delivery_reminder/reminder/view/alarm/alarm_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void initNotifications(BuildContext context) async {
  final NotificationAppLaunchDetails launchDetails = await notificationsPlugin.getNotificationAppLaunchDetails();
  String notificationPayloadId;
  if (launchDetails?.didNotificationLaunchApp ?? false) {
    notificationPayloadId = launchDetails.payload;
  }

  const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(android: androidSettings);
  await notificationsPlugin.initialize(initializationSettings, onSelectNotification: (String payload) async {
    _showNotification(context, payload);
  });

  _showNotification(context, notificationPayloadId);
}

void _showNotification(BuildContext context, String notificationPayloadId) {
  if (notificationPayloadId != null) {
    showAlarmPopup(context, notificationPayloadId);
  }
}
