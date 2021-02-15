import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_headers.freezed.dart';

@freezed
abstract class ReminderHeaders with _$ReminderHeaders {
  const factory ReminderHeaders({@required String title, @nullable String description, @nullable String trackNumber}) = ReminderHeadersValue;
}
