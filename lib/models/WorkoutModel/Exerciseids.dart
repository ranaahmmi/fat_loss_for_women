import 'package:moor/moor.dart';

class ExerciseIds extends Table {
  IntColumn get exerciseid => integer()();
  IntColumn get weekid => integer()();
  IntColumn get dayid => integer()();
  IntColumn get planid => integer()();
  TextColumn get sets => text().nullable()();
  TextColumn get rep => text().nullable()();
  TextColumn get timer => text().nullable()();
  TextColumn get restTime => text().nullable()();

  @override
  Set<Column> get primaryKey => {exerciseid, weekid, dayid, planid};
}
