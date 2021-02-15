import 'dart:async';

import 'package:delivery_reminder/common/state_management/form_store.dart';
import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:delivery_reminder/reminder/model/reminder_headers.dart';
import 'package:delivery_reminder/reminder/service/reminder_repository.dart';
import 'package:delivery_reminder/reminder/state_management/reminder_list_store.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'add_reminder_store.g.dart';

abstract class AddReminderStore extends FormStore with Store {
  final _logger = Logger();

  final ReminderRepository _repository;
  final ReminderListStore _listStore;

  AddReminderStore(this._repository, this._listStore) : assert(_repository != null);

  factory AddReminderStore.create({ReminderRepository repository, ReminderListStore listStore}) {
    return _AddReminderStoreImpl(repository, listStore);
  }

  final Observable<String> _title = Observable(null);
  final Observable<String> _description = Observable(null);
  final Observable<String> _trackNumber = Observable(null);
  final Observable<DateTime> till = Observable(null);

  @computed
  TitleError get titleError {
    return isReadyToValidate.value && (_title.value == null || _title.value.isEmpty) ? TitleError.empty : null;
  }

  @action
  void setTitle(String title) {
    _title.value = title;
  }

  @action
  void setDescription(String description) {
    _description.value = description == '' ? null : description;
  }

  @action
  void setTrackNumber(String trackNumber) {
    _trackNumber.value = trackNumber == '' ? null : trackNumber;
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
  Future<bool> submit() async {
    markAsReadyToValidate();

    if (!canSubmit) {
      return false;
    }

    return setProcessState(() async {
      final reminder = Reminder.waiting(
          headers:
              ReminderHeaders(title: _title.value, description: _description.value, trackNumber: _trackNumber.value),
          stage: Stage.delivery,
          till: till.value /*DateTime.now().add(Duration(seconds: 10))*/);
      try {
        await _repository.insert(reminder);
      } catch (e) {
        _logger.e('Could not add a reminder $reminder', e);
        rethrow;
      }
      // ignore: unawaited_futures
      _listStore.refresh(isForcedByUser: true);
      return true;
    });
  }
}

enum TitleError { empty }

enum TillError { empty }

class _AddReminderStoreImpl extends AddReminderStore with _$_AddReminderStoreImpl {
  _AddReminderStoreImpl(ReminderRepository repository, ReminderListStore listStore) : super(repository, listStore);
}
