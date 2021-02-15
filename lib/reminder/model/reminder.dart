import 'package:delivery_reminder/common/dart/enum_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'reminder_headers.dart';
import 'stage.dart';

part 'reminder.freezed.dart';

@freezed
abstract class Reminder with _$Reminder {
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnDescription = 'description';
  static const String columnTrackNumber = 'track_number';
  static const String columnStage = 'stage';
  static const String columnTimestamp = 'timestamp';
  static const String columnIsArchived = 'is_archived';

  const Reminder._();

  const factory Reminder.waiting(
      {int id, @required ReminderHeaders headers, @required Stage stage, @required DateTime till}) = ReminderWaiting;

  const factory Reminder.archived({int id, @required ReminderHeaders headers, @required DateTime archivedAt}) =
      ReminderArchived;

  factory Reminder.fromMap(Map<String, dynamic> map) {
    final DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(map[columnTimestamp]);
    final bool isArchived = map[columnIsArchived] == 1;
    if (isArchived) {
      return Reminder.archived(
          id: map[columnId],
          headers: ReminderHeaders(
              title: map[columnTitle], description: map[columnDescription], trackNumber: map[columnTrackNumber]),
          archivedAt: timestamp);
    }
    final String stageText = map[columnStage];
    final Stage stage = Stage.values.firstWhere((e) => getEnumName(e) == stageText);
    return Reminder.waiting(
        id: map[columnId],
        headers: ReminderHeaders(
            title: map[columnTitle], description: map[columnDescription], trackNumber: map[columnTrackNumber]),
        stage: stage,
        till: timestamp);
  }

  Map<String, dynamic> toMap() {
    var result = <String, dynamic>{
      columnTitle: headers.title,
      columnTimestamp: map(waiting: (it) => it.till, archived: (it) => it.archivedAt).millisecondsSinceEpoch,
      columnIsArchived: map(waiting: (_) => false, archived: (_) => true)
    };
    map(
        waiting: (it) {
          result[columnStage] = getEnumName(it.stage);
        },
        archived: (_) {});
    if (headers.description != null) {
      result[columnDescription] = headers.description;
    }
    if (headers.trackNumber != null) {
      result[columnTrackNumber] = headers.trackNumber;
    }
    if (id != null) {
      result[columnId] = id;
    }
    return result;
  }
}
