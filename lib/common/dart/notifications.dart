import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

Future scheduleNotification(Notification notification) async {
  _initializeTimeZone(notification.timeZone);

  return notificationsPlugin.zonedSchedule(
      0,
      notification.title,
      notification.body,
      tz.TZDateTime.from(notification.dateTime, tz.local),
      const NotificationDetails(
          android: AndroidNotificationDetails(
              'delivery_reminder_notification', 'DeliveryReminder', 'Напоминания о доставке',
              importance: Importance.high, priority: Priority.defaultPriority, ticker: 'Напоминание')),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      payload: notification.payload);
}

void _initializeTimeZone(String currentTimeZone) {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(currentTimeZone));
}

class Notification {
  final String timeZone;
  final DateTime dateTime;
  final String title;
  final String body;
  final String payload;

  Notification(this.timeZone, this.dateTime, this.title, this.body, this.payload);
}
