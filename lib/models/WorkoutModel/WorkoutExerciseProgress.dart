import 'package:moor/moor.dart';

class WorkoutExerciseProgress extends Table {
  IntColumn get workoutid => integer()();
  IntColumn get exerciseId => integer()();
  IntColumn get progress => integer()();
  @override
  Set<Column> get primaryKey => {workoutid, exerciseId};
}
