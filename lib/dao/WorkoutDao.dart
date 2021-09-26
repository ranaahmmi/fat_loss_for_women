import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Exercises.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Workout.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/WorkoutExerciseIDs.dart';
import 'package:moor/moor.dart';

part 'WorkoutDao.g.dart';

@UseDao(tables: [Workouts, WorkoutExerciseIds, Exercises])
class WorkoutDao extends DatabaseAccessor<AppDatabase> with _$WorkoutDaoMixin {
  final AppDatabase db;

  WorkoutDao(this.db) : super(db);

  Future<List<Workout>> getAllWorkoutPlan() => (select(workouts)
        ..orderBy(
            [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc)]))
      .get();

  Stream<List<Workout>> getAllWorkoutPlanwithStrem() => (select(workouts)
        ..orderBy(
            [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc)]))
      .watch();

  Future<Workout> getWorkoutPlan(String name) =>
      (select(workouts)..where((tbl) => tbl.workoutTitle.equals(name)))
          .getSingle();

  Future<String> getUpdatedTimeStemp() {
    return customSelect('select max(update_timestamp) from workouts;',
            readsFrom: {workouts})
        .map((value) => value.data["max(update_timestamp)"].toString())
        .getSingle();
  }

  Future<List> getAllExercisesids() {
    return customSelect('SELECT exerciseid FROM workout_exercise_ids;',
        readsFrom: {workoutExerciseIds}).map((value) {
      return value.data['exerciseid'];
    }).get();
  }

  Future<List<WorkoutExerciseId>> getWorkoutExerciseIdsByWorkoutId(
      int workoutid) {
    final _select = select(workoutExerciseIds);
    _select..where((tbl) => tbl.workoutid.equals(workoutid));
    return _select.get();
  }

  Future<Workout> getWorkoutIDByWorkoutName(String workoutname) {
    final _select = select(workouts);
    _select..where((tbl) => tbl.workoutTitle.equals(workoutname));

    return _select.getSingle();
  }

  Future insertWorkoutPlans(workout) =>
      into(workouts).insertOnConflictUpdate(workout);

  Future insertExerciseids(Insertable<WorkoutExerciseId> exerciseid) =>
      into(workoutExerciseIds).insertOnConflictUpdate(exerciseid);
}
