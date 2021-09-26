import 'package:moor/moor.dart';

class Users extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  IntColumn get age => integer()();
  TextColumn get heightUnit => text().nullable()();
  TextColumn get weightUnit => text().nullable()();
  TextColumn get waistUnit => text().nullable()();
  TextColumn get height => text().nullable()();
  TextColumn get weight => text().nullable()();
  TextColumn get waist => text().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get goal => text().nullable()();
  TextColumn get workoutTimeRemainder => text().nullable()();
  TextColumn get fitnessLevel => text().nullable()();
  BoolColumn get ip => boolean().withDefault(const Constant(true)).nullable()();
  BoolColumn get dailyWaterRemainder =>
      boolean().withDefault(const Constant(false)).nullable()();
  BoolColumn? get dailyWorkoutRemainder =>
      boolean().withDefault(const Constant(false)).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
