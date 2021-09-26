import 'package:moor/moor.dart';

class Workouts extends Table {
  IntColumn get id => integer()();
  TextColumn get insertTimestamp => text().nullable()();
  TextColumn get updateTimestamp => text().nullable()();
  TextColumn get workoutTitle => text().nullable()();
  TextColumn get workoutPhoto => text().nullable()();
  TextColumn get workoutLevel => text().nullable()();
  TextColumn get workoutTime => text().nullable()();
  TextColumn get aboutWorkout => text().nullable()();
  BoolColumn get active => boolean().nullable()();
  BoolColumn get isnew => boolean().nullable()();
  BoolColumn get isPremium => boolean().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}
