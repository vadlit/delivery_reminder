import 'package:delivery_reminder/reminder/service/reminder_repository.dart';
import 'package:delivery_reminder/reminder/state_management/add_reminder_store.dart';
import 'package:delivery_reminder/reminder/state_management/reminder_list_store.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

void main() {
  AddReminderStore _testable;
  MockReminderRepository _mockReminderRepository;
  MockReminderListStore _mockReminderListStore;

  setUp(() async {
    _mockReminderRepository = MockReminderRepository();
    _mockReminderListStore = MockReminderListStore();

    _testable = AddReminderStore.create(repository: _mockReminderRepository, listStore: _mockReminderListStore);
  });

  group('.setTitle()', () {
    group('before submit', () {
      test('when valid', () {
        // act
        _testable.setTitle('test');

        // assert
        expect(_testable.isReadyToValidate.value, equals(false));
        expect(_testable.titleError, isNull);
        expect(_testable.canSubmit, equals(true));
      });

      test('when invalid', () {
        // act
        _testable.setTitle(null);

        // assert
        expect(_testable.isReadyToValidate.value, equals(false));
        expect(_testable.titleError, isNull);
        expect(_testable.canSubmit, equals(true));
      });
    });

    group('after submit', () {
      test('when valid', () async {
        // arrange
        final submitSucceeded = await _testable.submit();
        expect(submitSucceeded, equals(false));
        expect(_testable.isReadyToValidate.value, equals(true));

        // act
        _testable.setTitle('test');

        // assert
        expect(_testable.isReadyToValidate.value, equals(true));
        expect(_testable.titleError, isNull);
        expect(_testable.canSubmit, equals(false));
      });

      test('when null', () async {
        // arrange
        final submitSucceeded = await _testable.submit();
        expect(submitSucceeded, equals(false));
        expect(_testable.isReadyToValidate.value, equals(true));

        // act
        _testable.setTitle(null);

        // assert
        expect(_testable.isReadyToValidate.value, equals(true));
        expect(_testable.titleError, equals(TitleError.empty));
        expect(_testable.canSubmit, equals(false));
      });

      test('when empty', () async {
        // arrange
        final submitSucceeded = await _testable.submit();
        expect(submitSucceeded, equals(false));
        expect(_testable.isReadyToValidate.value, equals(true));

        // act
        _testable.setTitle('');

        // assert
        expect(_testable.isReadyToValidate.value, equals(true));
        expect(_testable.titleError, equals(TitleError.empty));
        expect(_testable.canSubmit, equals(false));
      });
    });
  });

  group('.setTill()', () {
    group('before submit', () {
      test('when valid', () {
        // act
        _testable.setTill(DateTime.now());

        // assert
        expect(_testable.isReadyToValidate.value, equals(false));
        expect(_testable.tillError, isNull);
        expect(_testable.canSubmit, equals(true));
      });

      test('when null', () {
        // act
        _testable.setTill(null);

        // assert
        expect(_testable.isReadyToValidate.value, equals(false));
        expect(_testable.tillError, isNull);
        expect(_testable.canSubmit, equals(true));
      });
    });

    group('after submit', () {
      test('when valid', () async {
        // arrange
        final submitSucceeded = await _testable.submit();
        expect(submitSucceeded, equals(false));
        expect(_testable.isReadyToValidate.value, equals(true));

        // act
        _testable.setTill(DateTime.now());

        // assert
        expect(_testable.isReadyToValidate.value, equals(true));
        expect(_testable.tillError, isNull);
        expect(_testable.canSubmit, equals(false));
      });

      test('when null', () async {
        // arrange
        final submitSucceeded = await _testable.submit();
        expect(submitSucceeded, equals(false));
        expect(_testable.isReadyToValidate.value, equals(true));

        // act
        _testable.setTill(null);

        // assert
        expect(_testable.isReadyToValidate.value, equals(true));
        expect(_testable.tillError, equals(TillError.empty));
        expect(_testable.canSubmit, equals(false));
      });
    });
  });

  group('.canSubmit', () {
    test('when valid', () {
      // arrange
      _testable.setTitle('test');
      _testable.setTill(DateTime.now());

      // act
      final result = _testable.canSubmit;

      // assert
      expect(result, equals(true));
    });
  });
}

class MockReminderRepository extends Mock implements ReminderRepository {}

class MockReminderListStore extends Mock implements ReminderListStore {}
