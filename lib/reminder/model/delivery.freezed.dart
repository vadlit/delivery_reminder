// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DeliveryTearOff {
  const _$DeliveryTearOff();

// ignore: unused_element
  DeliveryValue call({@required Reminder reminder, @nullable String status}) {
    return DeliveryValue(
      reminder: reminder,
      status: status,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Delivery = _$DeliveryTearOff();

/// @nodoc
mixin _$Delivery {
  Reminder get reminder;
  @nullable
  String get status;

  @JsonKey(ignore: true)
  $DeliveryCopyWith<Delivery> get copyWith;
}

/// @nodoc
abstract class $DeliveryCopyWith<$Res> {
  factory $DeliveryCopyWith(Delivery value, $Res Function(Delivery) then) =
      _$DeliveryCopyWithImpl<$Res>;
  $Res call({Reminder reminder, @nullable String status});

  $ReminderCopyWith<$Res> get reminder;
}

/// @nodoc
class _$DeliveryCopyWithImpl<$Res> implements $DeliveryCopyWith<$Res> {
  _$DeliveryCopyWithImpl(this._value, this._then);

  final Delivery _value;
  // ignore: unused_field
  final $Res Function(Delivery) _then;

  @override
  $Res call({
    Object reminder = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      reminder: reminder == freezed ? _value.reminder : reminder as Reminder,
      status: status == freezed ? _value.status : status as String,
    ));
  }

  @override
  $ReminderCopyWith<$Res> get reminder {
    if (_value.reminder == null) {
      return null;
    }
    return $ReminderCopyWith<$Res>(_value.reminder, (value) {
      return _then(_value.copyWith(reminder: value));
    });
  }
}

/// @nodoc
abstract class $DeliveryValueCopyWith<$Res> implements $DeliveryCopyWith<$Res> {
  factory $DeliveryValueCopyWith(
          DeliveryValue value, $Res Function(DeliveryValue) then) =
      _$DeliveryValueCopyWithImpl<$Res>;
  @override
  $Res call({Reminder reminder, @nullable String status});

  @override
  $ReminderCopyWith<$Res> get reminder;
}

/// @nodoc
class _$DeliveryValueCopyWithImpl<$Res> extends _$DeliveryCopyWithImpl<$Res>
    implements $DeliveryValueCopyWith<$Res> {
  _$DeliveryValueCopyWithImpl(
      DeliveryValue _value, $Res Function(DeliveryValue) _then)
      : super(_value, (v) => _then(v as DeliveryValue));

  @override
  DeliveryValue get _value => super._value as DeliveryValue;

  @override
  $Res call({
    Object reminder = freezed,
    Object status = freezed,
  }) {
    return _then(DeliveryValue(
      reminder: reminder == freezed ? _value.reminder : reminder as Reminder,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

/// @nodoc
class _$DeliveryValue implements DeliveryValue {
  const _$DeliveryValue({@required this.reminder, @nullable this.status})
      : assert(reminder != null);

  @override
  final Reminder reminder;
  @override
  @nullable
  final String status;

  @override
  String toString() {
    return 'Delivery(reminder: $reminder, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeliveryValue &&
            (identical(other.reminder, reminder) ||
                const DeepCollectionEquality()
                    .equals(other.reminder, reminder)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reminder) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  $DeliveryValueCopyWith<DeliveryValue> get copyWith =>
      _$DeliveryValueCopyWithImpl<DeliveryValue>(this, _$identity);
}

abstract class DeliveryValue implements Delivery {
  const factory DeliveryValue(
      {@required Reminder reminder, @nullable String status}) = _$DeliveryValue;

  @override
  Reminder get reminder;
  @override
  @nullable
  String get status;
  @override
  @JsonKey(ignore: true)
  $DeliveryValueCopyWith<DeliveryValue> get copyWith;
}
