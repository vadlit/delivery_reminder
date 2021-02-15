import 'package:delivery_reminder/reminder/data/reminder_storage.dart';
import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:delivery_reminder/reminder/model/reminder_headers.dart';
import 'package:delivery_reminder/reminder/service/notification_scheduler.dart';
import 'package:delivery_reminder/reminder/service/reminder_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

void main() {
  ReminderRepository _testable;
  MockReminderStorage _mockReminderStorage;
  MockNotificationScheduler _mockNotificationScheduler;

  setUp(() async {
    _mockReminderStorage = MockReminderStorage();
    _mockNotificationScheduler = MockNotificationScheduler();

    _testable = ReminderRepository(_mockReminderStorage, _mockNotificationScheduler);
  });

  ReminderWaiting _buildFakeReminder() =>
      Reminder.waiting(headers: ReminderHeaders(title: 'some title'), stage: Stage.delivery, till: DateTime.now());

  group('.insert()', () {
    test('succeeded', () async {
      // arrange
      final reminder = _buildFakeReminder();
      final storageReminder = reminder.copyWith();
      _mockReminderStorage.returnStubOnInsert(storageReminder);

      // act
      final result = await _testable.insert(reminder);

      // assert
      final ReminderWaiting scheduledReminder =
          verify(_mockNotificationScheduler.scheduleNotification(captureAny)).captured.first as ReminderWaiting;
      expect(scheduledReminder, equals(storageReminder));
      expect(result, equals(storageReminder));
    });
  });

  group('.update()', () {
    test('succeeded', () async {
      // arrange
      final reminder = _buildFakeReminder();
      _mockReminderStorage.returnStubOnUpdate(reminder, 1);

      // act
      final result = await _testable.update(reminder);

      // assert
      final ReminderWaiting scheduledReminder =
          verify(_mockNotificationScheduler.scheduleNotification(captureAny)).captured.first as ReminderWaiting;
      expect(scheduledReminder, equals(reminder));
      expect(result, equals(true));
    });

    test('not found', () async {
      // arrange
      final reminder = _buildFakeReminder();
      _mockReminderStorage.returnStubOnUpdate(reminder, 0);

      // act
      final result = await _testable.update(reminder);

      // assert
      verifyNever(_mockNotificationScheduler.scheduleNotification(any));
      expect(result, equals(false));
    });
  });
}

class MockReminderStorage extends Mock implements ReminderStorage {
  Reminder _insertStub;
  final _updateStubs = <Reminder, int>{};

  void returnStubOnInsert(Reminder reminder) {
    _insertStub = reminder;
  }

  void returnStubOnUpdate(Reminder reminder, int updatesCount) {
    _updateStubs[reminder] = updatesCount;
  }

  @override
  Future<Reminder> insert(Reminder reminder) {
    return Future.value(_insertStub);
  }

  @override
  Future<int> update(Reminder reminder) {
    return Future.value(_updateStubs[reminder]);
  }
}

class MockNotificationScheduler extends Mock implements NotificationScheduler {}
