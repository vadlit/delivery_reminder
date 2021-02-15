import 'package:built_collection/built_collection.dart';
import 'package:delivery_reminder/reminder/data/reminder_storage.dart';
import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:delivery_reminder/reminder/service/notification_scheduler.dart';

class ReminderRepository {
  final ReminderStorage _storage;
  final NotificationScheduler _notificationScheduler;

  const ReminderRepository(this._storage, this._notificationScheduler);

  Future<Reminder> insert(Reminder reminder) async {
    reminder = await _storage.insert(reminder);
    await _scheduleNotification(reminder);
    return reminder;
  }

  // returns 'true' if updated
  Future<bool> update(Reminder reminder) async {
    final bool succeeded = await _storage.update(reminder) > 0;
    if (succeeded) {
      await _scheduleNotification(reminder);
    }
    return succeeded;
  }

  Future _scheduleNotification(Reminder reminder) async {
    return reminder.map(waiting: (it) => _notificationScheduler.scheduleNotification(it), archived: (_) {});
  }

  Future<BuiltList<Reminder>> getAll() async {
    return _storage.getAll();
  }

  Future<Reminder> findReminder(int id) async {
    return _storage.findReminder(id);
  }
}
