import 'package:delivery_reminder/common/state_management/base_store.dart';
import 'package:delivery_reminder/common/view/controls/button_widget.dart';
import 'package:delivery_reminder/common/view/controls/error_pad_widget.dart';
import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:delivery_reminder/reminder/model/reminder_headers.dart';
import 'package:delivery_reminder/reminder/service/reminder_repository.dart';
import 'package:delivery_reminder/reminder/state_management/alarm_store.dart';
import 'package:delivery_reminder/reminder/state_management/reminder_list_store.dart';
import 'package:delivery_reminder/reminder/view/alarm/alarm_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../../helper/popup.dart';
import '../../../helper/test_observer.dart';

void main() {
  MockReminderRepository _mockReminderRepository;
  MockReminderListStore _mockReminderListStore;
  int _popCounter;

  setUp(() {
    BaseStore.initReactiveWritePolicy();

    _mockReminderRepository = MockReminderRepository();
    _mockReminderListStore = MockReminderListStore();
    _popCounter = 0;
  });

  Finder _findArchiveButton() {
    return find.byWidgetPredicate((w) => w is ButtonWidget && w.title == AlarmWidget.archiveButtonName);
  }

  Widget _wrap(Widget child) {
    final TestObserver observer = TestObserver()
      ..onPopped = (Route<dynamic> route, Route<dynamic> previousRoute) {
        _popCounter++;
      };
    return Provider(
        create: (ctx) => AlarmStore.create(
            reminderId: MockReminderRepository.reminder.id.toString(),
            repository: _mockReminderRepository,
            listStore: _mockReminderListStore),
        child: wrapInPopup(child, observer));
  }

  testWidgets('archive', (WidgetTester tester) async {
    // arrange
    await tester.pumpWidget(_wrap(AlarmWidget()));

    // act
    await tester.tap(_findArchiveButton());
    await tester.pump();

    // assert
    expect(find.byType(ErrorPadWidget), findsNothing);
    expect(_popCounter, equals(1));
  });
}

class MockReminderRepository extends Mock implements ReminderRepository {
  static final reminder = Reminder.waiting(
      id: 777, headers: ReminderHeaders(title: 'some title'), stage: Stage.delivery, till: DateTime.now());

  bool failOnInsert = false;

  @override
  Future<Reminder> findReminder(int id) {
    return Future.value(reminder);
  }

  @override
  Future<bool> update(Reminder value) async {
    if (reminder.id == value.id && value is ReminderArchived) {
      return true;
    }
    return false;
  }
}

class MockReminderListStore extends Mock implements ReminderListStore {}
