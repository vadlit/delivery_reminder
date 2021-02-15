import 'package:built_collection/built_collection.dart';
import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ReminderStorage {
  static const String reminderTable = 'reminder';

  Database _db;

  Future _prepareDb() async {
    if (_db != null) {
      return;
    }

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'reminder.db');

    _db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
create table $reminderTable ( 
  ${Reminder.columnId} integer primary key autoincrement,   
  ${Reminder.columnTitle} text not null,
  ${Reminder.columnDescription} text null,
  ${Reminder.columnTrackNumber} text null,
  ${Reminder.columnStage} text null,
  ${Reminder.columnTimestamp} integer not null,
  ${Reminder.columnIsArchived} integer not null);
''');
    });
  }

  Future close() async {
    await _prepareDb();
    return _db.close();
  }

  Future<Reminder> insert(Reminder reminder) async {
    await _prepareDb();

    final int id = await _db.insert(reminderTable, reminder.toMap());
    return reminder.copyWith(id: id);
  }

  Future<BuiltList<Reminder>> getAll() async {
    await _prepareDb();

    List<Map> maps = await _db.query(reminderTable, columns: [
      Reminder.columnId,
      Reminder.columnTitle,
      Reminder.columnDescription,
      Reminder.columnTrackNumber,
      Reminder.columnStage,
      Reminder.columnTimestamp,
      Reminder.columnIsArchived
    ]);
    return BuiltList.build((builder) => builder.addAll(maps.map((m) => Reminder.fromMap(m))));
  }

  Future<Reminder> findReminder(int id) async {
    await _prepareDb();

    List<Map> maps = await _db.query(reminderTable,
        columns: [
          Reminder.columnId,
          Reminder.columnTitle,
          Reminder.columnDescription,
          Reminder.columnTrackNumber,
          Reminder.columnStage,
          Reminder.columnTimestamp,
          Reminder.columnIsArchived
        ],
        where: '${Reminder.columnId} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Reminder.fromMap(maps.first);
    }
    return null;
  }

  Future delete(int id) async {
    await _prepareDb();

    return await _db.delete(reminderTable, where: '${Reminder.columnId} = ?', whereArgs: [id]);
  }

  Future<int> update(Reminder reminder) async {
    await _prepareDb();

    return await _db
        .update(reminderTable, reminder.toMap(), where: '${Reminder.columnId} = ?', whereArgs: [reminder.id]);
  }
}
