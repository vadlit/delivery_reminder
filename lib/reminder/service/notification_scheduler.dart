import 'package:flutter_native_timezone/flutter_native_timezone.dart';

import 'package:delivery_reminder/common/dart/notifications.dart' as common_notifications;
import 'package:delivery_reminder/reminder/model/models.dart';

class NotificationScheduler {
  Future scheduleNotification(ReminderWaiting reminder) async {
    final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    final notification = common_notifications.Notification(
        currentTimeZone, reminder.till, reminder.headers.title, 'скоро доставка', reminder.id.toString());

    return common_notifications.scheduleNotification(notification);
  }
}
