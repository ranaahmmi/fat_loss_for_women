import 'package:moor/moor.dart';

class Exercises extends Table {
  IntColumn get id => integer()();
  TextColumn get tags => text().nullable()();
  TextColumn get exerciseTitle => text().nullable()();
  TextColumn get time => text().nullable()();
  TextColumn get restTime => text().nullable()();
  TextColumn get mainBodyGroup => text().nullable()();
  TextColumn get detailLink => text().nullable()();
  TextColumn get mainMuscleGroup => text().nullable()();
  TextColumn get otherMuscleGroups => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get equipment => text().nullable()();
  TextColumn get mechanics => text().nullable()();
  TextColumn get difficulty => text().nullable()();
  TextColumn get image1Link => text().nullable()();
  TextColumn get image2Link => text().nullable()();
  TextColumn get detail => text().nullable()();
  TextColumn get sets => text().nullable()();
  TextColumn get repetitions => text().nullable()();
  TextColumn get videoLink => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}
