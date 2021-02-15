import 'package:delivery_reminder/common/state_management/process_state.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

abstract class BaseStore {
  final _logger = Logger();
  final _processState = Observable<ProcessState>(ProcessState.ready());

  @computed
  ProcessState get processState {
    return _processState.value;
  }

  Future<bool> setProcessState(AsyncValueGetter<bool> updater) async {
    _processState.value = ProcessState.processing();
    bool succeeded = false;
    try {
      succeeded = await updater();
    } catch (e) {
      _logger.e('Could not set process state', e);
      runInAction(() => _processState.value = ProcessState.error(e.toString()));
      return false;
    }
    _processState.value = ProcessState.ready();

    return succeeded;
  }

  static void initReactiveWritePolicy() {
    mainContext.config = ReactiveConfig.main.clone(writePolicy: ReactiveWritePolicy.always);
  }
}
