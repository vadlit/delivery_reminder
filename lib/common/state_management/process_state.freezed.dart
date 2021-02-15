// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'process_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProcessStateTearOff {
  const _$ProcessStateTearOff();

// ignore: unused_element
  ProcessStateReady ready() {
    return const ProcessStateReady();
  }

// ignore: unused_element
  ProcessStateFailed error([@nullable String reason]) {
    return ProcessStateFailed(
      reason,
    );
  }

// ignore: unused_element
  ProcessStateProcessing processing() {
    return const ProcessStateProcessing();
  }
}

/// @nodoc
// ignore: unused_element
const $ProcessState = _$ProcessStateTearOff();

/// @nodoc
mixin _$ProcessState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult ready(),
    @required TResult error(@nullable String reason),
    @required TResult processing(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult ready(),
    TResult error(@nullable String reason),
    TResult processing(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult ready(ProcessStateReady value),
    @required TResult error(ProcessStateFailed value),
    @required TResult processing(ProcessStateProcessing value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult ready(ProcessStateReady value),
    TResult error(ProcessStateFailed value),
    TResult processing(ProcessStateProcessing value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ProcessStateCopyWith<$Res> {
  factory $ProcessStateCopyWith(
          ProcessState value, $Res Function(ProcessState) then) =
      _$ProcessStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProcessStateCopyWithImpl<$Res> implements $ProcessStateCopyWith<$Res> {
  _$ProcessStateCopyWithImpl(this._value, this._then);

  final ProcessState _value;
  // ignore: unused_field
  final $Res Function(ProcessState) _then;
}

/// @nodoc
abstract class $ProcessStateReadyCopyWith<$Res> {
  factory $ProcessStateReadyCopyWith(
          ProcessStateReady value, $Res Function(ProcessStateReady) then) =
      _$ProcessStateReadyCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProcessStateReadyCopyWithImpl<$Res>
    extends _$ProcessStateCopyWithImpl<$Res>
    implements $ProcessStateReadyCopyWith<$Res> {
  _$ProcessStateReadyCopyWithImpl(
      ProcessStateReady _value, $Res Function(ProcessStateReady) _then)
      : super(_value, (v) => _then(v as ProcessStateReady));

  @override
  ProcessStateReady get _value => super._value as ProcessStateReady;
}

/// @nodoc
class _$ProcessStateReady implements ProcessStateReady {
  const _$ProcessStateReady();

  @override
  String toString() {
    return 'ProcessState.ready()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ProcessStateReady);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult ready(),
    @required TResult error(@nullable String reason),
    @required TResult processing(),
  }) {
    assert(ready != null);
    assert(error != null);
    assert(processing != null);
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult ready(),
    TResult error(@nullable String reason),
    TResult processing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult ready(ProcessStateReady value),
    @required TResult error(ProcessStateFailed value),
    @required TResult processing(ProcessStateProcessing value),
  }) {
    assert(ready != null);
    assert(error != null);
    assert(processing != null);
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult ready(ProcessStateReady value),
    TResult error(ProcessStateFailed value),
    TResult processing(ProcessStateProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ProcessStateReady implements ProcessState {
  const factory ProcessStateReady() = _$ProcessStateReady;
}

/// @nodoc
abstract class $ProcessStateFailedCopyWith<$Res> {
  factory $ProcessStateFailedCopyWith(
          ProcessStateFailed value, $Res Function(ProcessStateFailed) then) =
      _$ProcessStateFailedCopyWithImpl<$Res>;
  $Res call({@nullable String reason});
}

/// @nodoc
class _$ProcessStateFailedCopyWithImpl<$Res>
    extends _$ProcessStateCopyWithImpl<$Res>
    implements $ProcessStateFailedCopyWith<$Res> {
  _$ProcessStateFailedCopyWithImpl(
      ProcessStateFailed _value, $Res Function(ProcessStateFailed) _then)
      : super(_value, (v) => _then(v as ProcessStateFailed));

  @override
  ProcessStateFailed get _value => super._value as ProcessStateFailed;

  @override
  $Res call({
    Object reason = freezed,
  }) {
    return _then(ProcessStateFailed(
      reason == freezed ? _value.reason : reason as String,
    ));
  }
}

/// @nodoc
class _$ProcessStateFailed implements ProcessStateFailed {
  const _$ProcessStateFailed([@nullable this.reason]);

  @override
  @nullable
  final String reason;

  @override
  String toString() {
    return 'ProcessState.error(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProcessStateFailed &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reason);

  @JsonKey(ignore: true)
  @override
  $ProcessStateFailedCopyWith<ProcessStateFailed> get copyWith =>
      _$ProcessStateFailedCopyWithImpl<ProcessStateFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult ready(),
    @required TResult error(@nullable String reason),
    @required TResult processing(),
  }) {
    assert(ready != null);
    assert(error != null);
    assert(processing != null);
    return error(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult ready(),
    TResult error(@nullable String reason),
    TResult processing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult ready(ProcessStateReady value),
    @required TResult error(ProcessStateFailed value),
    @required TResult processing(ProcessStateProcessing value),
  }) {
    assert(ready != null);
    assert(error != null);
    assert(processing != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult ready(ProcessStateReady value),
    TResult error(ProcessStateFailed value),
    TResult processing(ProcessStateProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProcessStateFailed implements ProcessState {
  const factory ProcessStateFailed([@nullable String reason]) =
      _$ProcessStateFailed;

  @nullable
  String get reason;
  @JsonKey(ignore: true)
  $ProcessStateFailedCopyWith<ProcessStateFailed> get copyWith;
}

/// @nodoc
abstract class $ProcessStateProcessingCopyWith<$Res> {
  factory $ProcessStateProcessingCopyWith(ProcessStateProcessing value,
          $Res Function(ProcessStateProcessing) then) =
      _$ProcessStateProcessingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProcessStateProcessingCopyWithImpl<$Res>
    extends _$ProcessStateCopyWithImpl<$Res>
    implements $ProcessStateProcessingCopyWith<$Res> {
  _$ProcessStateProcessingCopyWithImpl(ProcessStateProcessing _value,
      $Res Function(ProcessStateProcessing) _then)
      : super(_value, (v) => _then(v as ProcessStateProcessing));

  @override
  ProcessStateProcessing get _value => super._value as ProcessStateProcessing;
}

/// @nodoc
class _$ProcessStateProcessing implements ProcessStateProcessing {
  const _$ProcessStateProcessing();

  @override
  String toString() {
    return 'ProcessState.processing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ProcessStateProcessing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult ready(),
    @required TResult error(@nullable String reason),
    @required TResult processing(),
  }) {
    assert(ready != null);
    assert(error != null);
    assert(processing != null);
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult ready(),
    TResult error(@nullable String reason),
    TResult processing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult ready(ProcessStateReady value),
    @required TResult error(ProcessStateFailed value),
    @required TResult processing(ProcessStateProcessing value),
  }) {
    assert(ready != null);
    assert(error != null);
    assert(processing != null);
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult ready(ProcessStateReady value),
    TResult error(ProcessStateFailed value),
    TResult processing(ProcessStateProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class ProcessStateProcessing implements ProcessState {
  const factory ProcessStateProcessing() = _$ProcessStateProcessing;
}
