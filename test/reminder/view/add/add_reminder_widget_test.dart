import 'package:delivery_reminder/common/state_management/base_store.dart';
import 'package:delivery_reminder/common/view/controls/button_widget.dart';
import 'package:delivery_reminder/common/view/controls/date_input_widget.dart';
import 'package:delivery_reminder/common/view/controls/error_pad_widget.dart';
import 'package:delivery_reminder/common/view/controls/text_input_widget.dart';
import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:delivery_reminder/reminder/service/reminder_repository.dart';
import 'package:delivery_reminder/reminder/state_management/add_reminder_store.dart';
import 'package:delivery_reminder/reminder/state_management/reminder_list_store.dart';
import 'package:delivery_reminder/reminder/view/add/add_reminder_widget.dart';
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

  Finder _findTitleField() {
    return find.byWidgetPredicate((w) => w is TextInputWidget && w.helperText == AddReminderWidget.titleFieldName);
  }

  Finder _findDoneTillButton() {
    return find.ancestor(of: find.text('Готово'), matching: find.byType(CupertinoButton));
  }

  Finder _findSubmitButton() {
    return find.byWidgetPredicate((w) => w is ButtonWidget && w.title == AddReminderWidget.submitButtonName);
  }

  Widget _wrap(Widget child) {
    final TestObserver observer = TestObserver()
      ..onPopped = (Route<dynamic> route, Route<dynamic> previousRoute) {
        _popCounter++;
      };
    return Provider(
        create: (ctx) =>
            AddReminderStore.create(repository: _mockReminderRepository, listStore: _mockReminderListStore),
        child: wrapInPopup(child, observer));
  }

  testWidgets('could not add empty reminder', (WidgetTester tester) async {
    // arrange
    await tester.pumpWidget(_wrap(AddReminderWidget()));
    expect(find.byType(ErrorPadWidget), findsNothing);
    _mockReminderRepository.failOnInsert = true;

    // act
    await tester.tap(_findSubmitButton());
    await tester.pump();

    // assert
    expect(find.byType(ErrorPadWidget), findsNothing);
    expect(find.text(AddReminderWidget.emptyFieldError), findsNWidgets(2));
    expect(_popCounter, equals(0));
  });

  testWidgets('show error when cannot add reminder', (WidgetTester tester) async {
    // arrange
    await tester.pumpWidget(_wrap(AddReminderWidget()));
    expect(find.byType(ErrorPadWidget), findsNothing);
    await tester.enterText(_findTitleField(), 'test');
    await tester.tap(find.byType(DateInputWidget));
    await tester.pumpAndSettle();
    await tester.tap(_findDoneTillButton());
    await tester.pumpAndSettle();
    expect(_popCounter, equals(1)); // on calendar close
    _popCounter = 0;
    _mockReminderRepository.failOnInsert = true;

    // act
    await tester.tap(_findSubmitButton());
    await tester.pump();

    // assert
    expect(find.byType(ErrorPadWidget), findsOneWidget);
    expect(_popCounter, equals(0));
  });

  testWidgets('add reminder', (WidgetTester tester) async {
    // arrange
    await tester.pumpWidget(_wrap(AddReminderWidget()));
    expect(find.byType(ErrorPadWidget), findsNothing);
    await tester.enterText(_findTitleField(), 'test');
    await tester.tap(find.byType(DateInputWidget));
    await tester.pumpAndSettle();
    await tester.tap(_findDoneTillButton());
    await tester.pumpAndSettle();
    expect(_popCounter, equals(1)); // on calendar close
    _popCounter = 0;

    // act
    await tester.tap(_findSubmitButton());
    await tester.pump();

    // assert
    expect(find.byType(ErrorPadWidget), findsNothing);
    expect(_popCounter, equals(1));
  });
}

class MockReminderRepository extends Mock implements ReminderRepository {
  bool failOnInsert = false;

  @override
  Future<Reminder> insert(Reminder reminder) async {
    if (failOnInsert) {
      throw Exception('Deliberate exception');
    }
    return reminder.copyWith();
  }
}

class MockReminderListStore extends Mock implements ReminderListStore {}
