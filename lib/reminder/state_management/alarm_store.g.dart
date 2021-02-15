// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$_AlarmStoreImpl on AlarmStore, Store {
  Computed<TitleError> _$titleErrorComputed;

  @override
  TitleError get titleError =>
      (_$titleErrorComputed ??= Computed<TitleError>(() => super.titleError,
              name: 'AlarmStore.titleError'))
          .value;
  Computed<TillError> _$tillErrorComputed;

  @override
  TillError get tillError =>
      (_$tillErrorComputed ??= Computed<TillError>(() => super.tillError,
              name: 'AlarmStore.tillError'))
          .value;
  Computed<bool> _$canSubmitComputed;

  @override
  bool get canSubmit => (_$canSubmitComputed ??=
          Computed<bool>(() => super.canSubmit, name: 'AlarmStore.canSubmit'))
      .value;

  final _$reloadAsyncAction = AsyncAction('AlarmStore.reload');

  @override
  Future<void> reload() {
    return _$reloadAsyncAction.run(() => super.reload());
  }

  final _$postponeAsyncAction = AsyncAction('AlarmStore.postpone');

  @override
  Future<bool> postpone() {
    return _$postponeAsyncAction.run(() => super.postpone());
  }

  final _$archiveAsyncAction = AsyncAction('AlarmStore.archive');

  @override
  Future<bool> archive() {
    return _$archiveAsyncAction.run(() => super.archive());
  }

  final _$AlarmStoreActionController = ActionController(name: 'AlarmStore');

  @override
  void setTitle(String newValue) {
    final _$actionInfo =
        _$AlarmStoreActionController.startAction(name: 'AlarmStore.setTitle');
    try {
      return super.setTitle(newValue);
    } finally {
      _$AlarmStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String newValue) {
    final _$actionInfo = _$AlarmStoreActionController.startAction(
        name: 'AlarmStore.setDescription');
    try {
      return super.setDescription(newValue);
    } finally {
      _$AlarmStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTrackNumber(String newValue) {
    final _$actionInfo = _$AlarmStoreActionController.startAction(
        name: 'AlarmStore.setTrackNumber');
    try {
      return super.setTrackNumber(newValue);
    } finally {
      _$AlarmStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTill(DateTime newTill) {
    final _$actionInfo =
        _$AlarmStoreActionController.startAction(name: 'AlarmStore.setTill');
    try {
      return super.setTill(newTill);
    } finally {
      _$AlarmStoreActionController.endAction(_$actionInfo);
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
