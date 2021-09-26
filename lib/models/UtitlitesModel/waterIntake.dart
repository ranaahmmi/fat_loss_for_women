import 'package:moor/moor.dart';

class WaterInTakes extends Table {
  IntColumn get id => integer()();
  IntColumn get totalGlass => integer().nullable()();
  IntColumn get drinkGlass => integer().nullable()();
  IntColumn get reminderInterval => integer().nullable()();

  TextColumn get sleepTime => text().nullable()();
  TextColumn get wakeupTime => text().nullable()();
  TextColumn get workoutTime => text().nullable()();
  TextColumn get dayTime => text().nullable()();


  @override
  Set<Column> get primaryKey => {id};
}
