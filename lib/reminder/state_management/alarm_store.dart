import 'dart:async';

import 'package:delivery_reminder/common/state_management/form_store.dart';
import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:delivery_reminder/reminder/model/reminder_headers.dart';
import 'package:delivery_reminder/reminder/service/reminder_repository.dart';
import 'package:delivery_reminder/reminder/state_management/reminder_list_store.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'alarm_store.g.dart';

abstract class AlarmStore extends FormStore with Store {
  final _logger = Logger();

  ReminderWaiting _reminder;
  final String reminderId;
  final ReminderRepository _repository;
  final ReminderListStore _listStore;

  AlarmStore(this.reminderId, this._repository, this._listStore)
      : assert(reminderId != null),
        assert(_repository != null),
        assert(_listStore != null);

  factory AlarmStore.create({String reminderId, ReminderRepository repository, ReminderListStore listStore}) {
    return _AlarmStoreImpl(reminderId, repository, listStore)..reload();
  }

  final Observable<String> title = Observable(null);
  final Observable<String> description = Observable(null);
  final Observable<String> trackNumber = Observable(null);
  final Observable<DateTime> till = Observable(null);

  @computed
  TitleError get titleError {
    return isReadyToValidate.value && (title.value == null || title.value.isEmpty) ? TitleError.empty : null;
  }

  @action
  void setTitle(String newValue) {
    title.value = newValue;
  }

  @action
  void setDescription(String newValue) {
    description.value = newValue == '' ? null : newValue;
  }

  @action
  void setTrackNumber(String newValue) {
    trackNumber.value = newValue == '' ? null : newValue;
  }

  @computed
  TillError get tillError {
    return isReadyToValidate.value && till.value == null ? TillError.empty : null;
  }

  @action
  void setTill(DateTime newTill) {
    till.value = newTill;
  }

  @computed
  bool get canSubmit {
    return titleError == null && tillError == null;
  }

  @action
  Future reload() async {
    return setProcessState(() async {
      final reminderIdInt = int.parse(reminderId);
      final reminder = await _repository.findReminder(reminderIdInt);
      _reminder = reminder as ReminderWaiting;
      title.value = _reminder.headers.title;
      description.value = _reminder.headers.description;
      trackNumber.value = _reminder.headers.trackNumber;
      till.value = _reminder.till;
      return true;
    });
  }

  @action
  Future<bool> postpone() async {
    return setProcessState(() async {
      final reminder = _reminder.copyWith(till: DateTime.now().add(Duration(hours: 1)));
      try {
        await _repository.update(reminder);
      } catch (e) {
        _logger.e('Could not postpone a reminder $reminder', e);
        rethrow;
      }
      // ignore: unawaited_futures
      _listStore.refresh(isForcedByUser: true);
      return true;
    });
  }

  @action
  Future<bool> archive() async {
    markAsReadyToValidate();

    if (!canSubmit) {
      return false;
    }

    return setProcessState(() async {
      final reminder = Reminder.archived(
          id: _reminder.id,
          headers: ReminderHeaders(title: title.value, description: description.value, trackNumber: trackNumber.value),
          archivedAt: DateTime.now());
      bool updated;
      try {
        updated = await _repository.update(reminder);
      } catch (e) {
        _logger.e('Could not archive a reminder $reminder', e);
        rethrow;
      }
      if (!updated) {
        _logger.e('Could not archive an unknown reminder $reminder');
        return false;
      }
      // ignore: unawaited_futures
      _listStore.refresh(isForcedByUser: true);
      return true;
    });
  }
}

enum TitleError { empty }

enum TillError { empty }

class _AlarmStoreImpl extends AlarmStore with _$_AlarmStoreImpl {
  _AlarmStoreImpl(String reminderId, ReminderRepository repository, ReminderListStore listStore)
      : super(reminderId, repository, listStore);
}
