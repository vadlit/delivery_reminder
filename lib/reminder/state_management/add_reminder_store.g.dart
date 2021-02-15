// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_reminder_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$_AddReminderStoreImpl on AddReminderStore, Store {
  Computed<TitleError> _$titleErrorComputed;

  @override
  TitleError get titleError =>
      (_$titleErrorComputed ??= Computed<TitleError>(() => super.titleError,
              name: 'AddReminderStore.titleError'))
          .value;
  Computed<TillError> _$tillErrorComputed;

  @override
  TillError get tillError =>
      (_$tillErrorComputed ??= Computed<TillError>(() => super.tillError,
              name: 'AddReminderStore.tillError'))
          .value;
  Computed<bool> _$canSubmitComputed;

  @override
  bool get canSubmit =>
      (_$canSubmitComputed ??= Computed<bool>(() => super.canSubmit,
              name: 'AddReminderStore.canSubmit'))
          .value;

  final _$submitAsyncAction = AsyncAction('AddReminderStore.submit');

  @override
  Future<bool> submit() {
    return _$submitAsyncAction.run(() => super.submit());
  }

  final _$AddReminderStoreActionController =
      ActionController(name: 'AddReminderStore');

  @override
  void setTitle(String title) {
    final _$actionInfo = _$AddReminderStoreActionController.startAction(
        name: 'AddReminderStore.setTitle');
    try {
      return super.setTitle(title);
    } finally {
      _$AddReminderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String description) {
    final _$actionInfo = _$AddReminderStoreActionController.startAction(
        name: 'AddReminderStore.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$AddReminderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTrackNumber(String trackNumber) {
    final _$actionInfo = _$AddReminderStoreActionController.startAction(
        name: 'AddReminderStore.setTrackNumber');
    try {
      return super.setTrackNumber(trackNumber);
    } finally {
      _$AddReminderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTill(DateTime newTill) {
    final _$actionInfo = _$AddReminderStoreActionController.startAction(
        name: 'AddReminderStore.setTill');
    try {
      return super.setTill(newTill);
    } finally {
      _$AddReminderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleError: ${titleError},
tillError: ${tillError},
canSubmit: ${canSubmit}
    ''';
  }
}
