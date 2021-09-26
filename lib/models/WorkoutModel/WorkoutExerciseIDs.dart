import 'package:moor/moor.dart';

class WorkoutExerciseIds extends Table {
  IntColumn get exerciseid => integer()();
  IntColumn get workoutid => integer()();
  TextColumn get sets => text().nullable()() ;
  TextColumn get rep => text().nullable()() ;
  TextColumn get timer => text().nullable()() ;
  TextColumn get restTime => text().nullable()() ;

  @override
  Set<Column> get primaryKey => {exerciseid, workoutid};
}
