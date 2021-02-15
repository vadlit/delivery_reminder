import 'package:delivery_reminder/common/state_management/base_store.dart';
import 'package:mobx/mobx.dart';

abstract class FormStore extends BaseStore {
  final isReadyToValidate = Observable<bool>(false);

  void markAsReadyToValidate() {
    isReadyToValidate.value = true;
  }
}
