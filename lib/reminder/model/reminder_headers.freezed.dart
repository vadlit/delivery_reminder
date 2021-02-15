// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'reminder_headers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ReminderHeadersTearOff {
  const _$ReminderHeadersTearOff();

// ignore: unused_element
  ReminderHeadersValue call(
      {@required String title,
      @nullable String description,
      @nullable String trackNumber}) {
    return ReminderHeadersValue(
      title: title,
      description: description,
      trackNumber: trackNumber,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ReminderHeaders = _$ReminderHeadersTearOff();

/// @nodoc
mixin _$ReminderHeaders {
  String get title;
  @nullable
  String get description;
  @nullable
  String get trackNumber;

  @JsonKey(ignore: true)
  $ReminderHeadersCopyWith<ReminderHeaders> get copyWith;
}

/// @nodoc
abstract class $ReminderHeadersCopyWith<$Res> {
  factory $ReminderHeadersCopyWith(
          ReminderHeaders value, $Res Function(ReminderHeaders) then) =
      _$ReminderHeadersCopyWithImpl<$Res>;
  $Res call(
      {String title,
      @nullable String description,
      @nullable String trackNumber});
}

/// @nodoc
class _$ReminderHeadersCopyWithImpl<$Res>
    implements $ReminderHeadersCopyWith<$Res> {
  _$ReminderHeadersCopyWithImpl(this._value, this._then);

  final ReminderHeaders _value;
  // ignore: unused_field
  final $Res Function(ReminderHeaders) _then;

  @override
  $Res call({
    Object title = freezed,
    Object description = freezed,
    Object trackNumber = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      trackNumber:
          trackNumber == freezed ? _value.trackNumber : trackNumber as String,
    ));
  }
}

/// @nodoc
abstract class $ReminderHeadersValueCopyWith<$Res>
    implements $ReminderHeadersCopyWith<$Res> {
  factory $ReminderHeadersValueCopyWith(ReminderHeadersValue value,
          $Res Function(ReminderHeadersValue) then) =
      _$ReminderHeadersValueCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      @nullable String description,
      @nullable String trackNumber});
}

/// @nodoc
class _$ReminderHeadersValueCopyWithImpl<$Res>
    extends _$ReminderHeadersCopyWithImpl<$Res>
    implements $ReminderHeadersValueCopyWith<$Res> {
  _$ReminderHeadersValueCopyWithImpl(
      ReminderHeadersValue _value, $Res Function(ReminderHeadersValue) _then)
      : super(_value, (v) => _then(v as ReminderHeadersValue));

  @override
  ReminderHeadersValue get _value => super._value as ReminderHeadersValue;

  @override
  $Res call({
    Object title = freezed,
    Object description = freezed,
    Object trackNumber = freezed,
  }) {
    return _then(ReminderHeadersValue(
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      trackNumber:
          trackNumber == freezed ? _value.trackNumber : trackNumber as String,
    ));
  }
}

/// @nodoc
class _$ReminderHeadersValue implements ReminderHeadersValue {
  const _$ReminderHeadersValue(
      {@required this.title,
      @nullable this.description,
      @nullable this.trackNumber})
      : assert(title != null);

  @override
  final String title;
  @override
  @nullable
  final String description;
  @override
  @nullable
  final String trackNumber;

  @override
  String toString() {
    return 'ReminderHeaders(title: $title, description: $description, trackNumber: $trackNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReminderHeadersValue &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.trackNumber, trackNumber) ||
                const DeepCollectionEquality()
                    .equals(other.trackNumber, trackNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(trackNumber);

  @JsonKey(ignore: true)
  @override
  $ReminderHeadersValueCopyWith<ReminderHeadersValue> get copyWith =>
      _$ReminderHeadersValueCopyWithImpl<ReminderHeadersValue>(
          this, _$identity);
}

abstract class ReminderHeadersValue implements ReminderHeaders {
  const factory ReminderHeadersValue(
      {@required String title,
      @nullable String description,
      @nullable String trackNumber}) = _$ReminderHeadersValue;

  @override
  String get title;
  @override
  @nullable
  String get description;
  @override
  @nullable
  String get trackNumber;
  @override
  @JsonKey(ignore: true)
  $ReminderHeadersValueCopyWith<ReminderHeadersValue> get copyWith;
}
