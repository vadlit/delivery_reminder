// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ReminderTearOff {
  const _$ReminderTearOff();

// ignore: unused_element
  ReminderWaiting waiting(
      {int id,
      @required ReminderHeaders headers,
      @required Stage stage,
      @required DateTime till}) {
    return ReminderWaiting(
      id: id,
      headers: headers,
      stage: stage,
      till: till,
    );
  }

// ignore: unused_element
  ReminderArchived archived(
      {int id,
      @required ReminderHeaders headers,
      @required DateTime archivedAt}) {
    return ReminderArchived(
      id: id,
      headers: headers,
      archivedAt: archivedAt,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Reminder = _$ReminderTearOff();

/// @nodoc
mixin _$Reminder {
  int get id;
  ReminderHeaders get headers;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult waiting(
            int id, ReminderHeaders headers, Stage stage, DateTime till),
    @required
        TResult archived(int id, ReminderHeaders headers, DateTime archivedAt),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult waiting(
        int id, ReminderHeaders headers, Stage stage, DateTime till),
    TResult archived(int id, ReminderHeaders headers, DateTime archivedAt),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult waiting(ReminderWaiting value),
    @required TResult archived(ReminderArchived value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult waiting(ReminderWaiting value),
    TResult archived(ReminderArchived value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $ReminderCopyWith<Reminder> get copyWith;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res>;
  $Res call({int id, ReminderHeaders headers});

  $ReminderHeadersCopyWith<$Res> get headers;
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res> implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  final Reminder _value;
  // ignore: unused_field
  final $Res Function(Reminder) _then;

  @override
  $Res call({
    Object id = freezed,
    Object headers = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      headers: headers == freezed ? _value.headers : headers as ReminderHeaders,
    ));
  }

  @override
  $ReminderHeadersCopyWith<$Res> get headers {
    if (_value.headers == null) {
      return null;
    }
    return $ReminderHeadersCopyWith<$Res>(_value.headers, (value) {
      return _then(_value.copyWith(headers: value));
    });
  }
}

/// @nodoc
abstract class $ReminderWaitingCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory $ReminderWaitingCopyWith(
          ReminderWaiting value, $Res Function(ReminderWaiting) then) =
      _$ReminderWaitingCopyWithImpl<$Res>;
  @override
  $Res call({int id, ReminderHeaders headers, Stage stage, DateTime till});

  @override
  $ReminderHeadersCopyWith<$Res> get headers;
}

/// @nodoc
class _$ReminderWaitingCopyWithImpl<$Res> extends _$ReminderCopyWithImpl<$Res>
    implements $ReminderWaitingCopyWith<$Res> {
  _$ReminderWaitingCopyWithImpl(
      ReminderWaiting _value, $Res Function(ReminderWaiting) _then)
      : super(_value, (v) => _then(v as ReminderWaiting));

  @override
  ReminderWaiting get _value => super._value as ReminderWaiting;

  @override
  $Res call({
    Object id = freezed,
    Object headers = freezed,
    Object stage = freezed,
    Object till = freezed,
  }) {
    return _then(ReminderWaiting(
      id: id == freezed ? _value.id : id as int,
      headers: headers == freezed ? _value.headers : headers as ReminderHeaders,
      stage: stage == freezed ? _value.stage : stage as Stage,
      till: till == freezed ? _value.till : till as DateTime,
    ));
  }
}

/// @nodoc
class _$ReminderWaiting extends ReminderWaiting {
  const _$ReminderWaiting(
      {this.id,
      @required this.headers,
      @required this.stage,
      @required this.till})
      : assert(headers != null),
        assert(stage != null),
        assert(till != null),
        super._();

  @override
  final int id;
  @override
  final ReminderHeaders headers;
  @override
  final Stage stage;
  @override
  final DateTime till;

  @override
  String toString() {
    return 'Reminder.waiting(id: $id, headers: $headers, stage: $stage, till: $till)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReminderWaiting &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.headers, headers) ||
                const DeepCollectionEquality()
                    .equals(other.headers, headers)) &&
            (identical(other.stage, stage) ||
                const DeepCollectionEquality().equals(other.stage, stage)) &&
            (identical(other.till, till) ||
                const DeepCollectionEquality().equals(other.till, till)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(headers) ^
      const DeepCollectionEquality().hash(stage) ^
      const DeepCollectionEquality().hash(till);

  @JsonKey(ignore: true)
  @override
  $ReminderWaitingCopyWith<ReminderWaiting> get copyWith =>
      _$ReminderWaitingCopyWithImpl<ReminderWaiting>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult waiting(
            int id, ReminderHeaders headers, Stage stage, DateTime till),
    @required
        TResult archived(int id, ReminderHeaders headers, DateTime archivedAt),
  }) {
    assert(waiting != null);
    assert(archived != null);
    return waiting(id, headers, stage, till);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult waiting(
        int id, ReminderHeaders headers, Stage stage, DateTime till),
    TResult archived(int id, ReminderHeaders headers, DateTime archivedAt),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (waiting != null) {
      return waiting(id, headers, stage, till);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult waiting(ReminderWaiting value),
    @required TResult archived(ReminderArchived value),
  }) {
    assert(waiting != null);
    assert(archived != null);
    return waiting(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult waiting(ReminderWaiting value),
    TResult archived(ReminderArchived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (waiting != null) {
      return waiting(this);
    }
    return orElse();
  }
}

abstract class ReminderWaiting extends Reminder {
  const ReminderWaiting._() : super._();
  const factory ReminderWaiting(
      {int id,
      @required ReminderHeaders headers,
      @required Stage stage,
      @required DateTime till}) = _$ReminderWaiting;

  @override
  int get id;
  @override
  ReminderHeaders get headers;
  Stage get stage;
  DateTime get till;
  @override
  @JsonKey(ignore: true)
  $ReminderWaitingCopyWith<ReminderWaiting> get copyWith;
}

/// @nodoc
abstract class $ReminderArchivedCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory $ReminderArchivedCopyWith(
          ReminderArchived value, $Res Function(ReminderArchived) then) =
      _$ReminderArchivedCopyWithImpl<$Res>;
  @override
  $Res call({int id, ReminderHeaders headers, DateTime archivedAt});

  @override
  $ReminderHeadersCopyWith<$Res> get headers;
}

/// @nodoc
class _$ReminderArchivedCopyWithImpl<$Res> extends _$ReminderCopyWithImpl<$Res>
    implements $ReminderArchivedCopyWith<$Res> {
  _$ReminderArchivedCopyWithImpl(
      ReminderArchived _value, $Res Function(ReminderArchived) _then)
      : super(_value, (v) => _then(v as ReminderArchived));

  @override
  ReminderArchived get _value => super._value as ReminderArchived;

  @override
  $Res call({
    Object id = freezed,
    Object headers = freezed,
    Object archivedAt = freezed,
  }) {
    return _then(ReminderArchived(
      id: id == freezed ? _value.id : id as int,
      headers: headers == freezed ? _value.headers : headers as ReminderHeaders,
      archivedAt:
          archivedAt == freezed ? _value.archivedAt : archivedAt as DateTime,
    ));
  }
}

/// @nodoc
class _$ReminderArchived extends ReminderArchived {
  const _$ReminderArchived(
      {this.id, @required this.headers, @required this.archivedAt})
      : assert(headers != null),
        assert(archivedAt != null),
        super._();

  @override
  final int id;
  @override
  final ReminderHeaders headers;
  @override
  final DateTime archivedAt;

  @override
  String toString() {
    return 'Reminder.archived(id: $id, headers: $headers, archivedAt: $archivedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReminderArchived &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.headers, headers) ||
                const DeepCollectionEquality()
                    .equals(other.headers, headers)) &&
            (identical(other.archivedAt, archivedAt) ||
                const DeepCollectionEquality()
                    .equals(other.archivedAt, archivedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(headers) ^
      const DeepCollectionEquality().hash(archivedAt);

  @JsonKey(ignore: true)
  @override
  $ReminderArchivedCopyWith<ReminderArchived> get copyWith =>
      _$ReminderArchivedCopyWithImpl<ReminderArchived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult waiting(
            int id, ReminderHeaders headers, Stage stage, DateTime till),
    @required
        TResult archived(int id, ReminderHeaders headers, DateTime archivedAt),
  }) {
    assert(waiting != null);
    assert(archived != null);
    return archived(id, headers, archivedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult waiting(
        int id, ReminderHeaders headers, Stage stage, DateTime till),
    TResult archived(int id, ReminderHeaders headers, DateTime archivedAt),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (archived != null) {
      return archived(id, headers, archivedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult waiting(ReminderWaiting value),
    @required TResult archived(ReminderArchived value),
  }) {
    assert(waiting != null);
    assert(archived != null);
    return archived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult waiting(ReminderWaiting value),
    TResult archived(ReminderArchived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (archived != null) {
      return archived(this);
    }
    return orElse();
  }
}

abstract class ReminderArchived extends Reminder {
  const ReminderArchived._() : super._();
  const factory ReminderArchived(
      {int id,
      @required ReminderHeaders headers,
      @required DateTime archivedAt}) = _$ReminderArchived;

  @override
  int get id;
  @override
  ReminderHeaders get headers;
  DateTime get archivedAt;
  @override
  @JsonKey(ignore: true)
  $ReminderArchivedCopyWith<ReminderArchived> get copyWith;
}
