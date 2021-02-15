import 'package:freezed_annotation/freezed_annotation.dart';

part 'process_state.freezed.dart';

@freezed
abstract class ProcessState with _$ProcessState {
  const factory ProcessState.ready() = ProcessStateReady;
  const factory ProcessState.error([@nullable String reason]) = ProcessStateFailed;
  const factory ProcessState.processing() = ProcessStateProcessing;
}