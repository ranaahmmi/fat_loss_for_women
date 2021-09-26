import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/Tuple/DailyProgressTuple.dart';
import 'package:fat_loss_for_women/models/Tuple/PlanProgressTuple.dart';
import 'package:fat_loss_for_women/models/Tuple/WeeklyProgressTuple.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/WorkoutExerciseProgress.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/exerciseProgress.dart';
import 'package:moor/moor.dart';
part 'ExerciseProgressDao.g.dart';

@UseDao(tables: [ExerciseProgress, WorkoutExerciseProgress])
class ExerciseProgressDao extends DatabaseAccessor<AppDatabase>
    with _$ExerciseProgressDaoMixin {
  final AppDatabase db;

  ExerciseProgressDao(this.db) : super(db);

  Stream<int> isWorkoutPlanInit(int planid) {
    return customSelect(
            'SELECT case when count(*)>0 then 1 else 0 end FROM exercise_progress WHERE planid=$planid;',
            readsFrom: {
          exerciseProgress
        })
        .map((value) => int.parse(
            value.data['case when count(*)>0 then 1 else 0 end'].toString()))
        .watchSingle();
  }

  Future<int> isWorkoutPlanInitWithoutStream(int planid) {
    return customSelect(
            'SELECT case when count(*)>0 then 1 else 0 end FROM exercise_progress WHERE planid=$planid;',
            readsFrom: {
          exerciseProgress
        })
        .map((value) => int.parse(
            value.data['case when count(*)>0 then 1 else 0 end'].toString()))
        .getSingle();
  }

  Stream<List<int>> getPlanInitilizedStatus() {
    return customSelect('SELECT DISTINCT planid FROM exercise_progress;',
        readsFrom: {exerciseProgress}).map((value) {
      return int.parse(value.data["planid"].toString());
    }).watch();
  }

  Stream<List<int>> getWorkoutInitilizedStatus() {
    return customSelect(
        'SELECT DISTINCT workoutid FROM workout_exercise_progress;',
        readsFrom: {workoutExerciseProgress}).map((value) {
      // print("<--- data --->");
      // print(value.data);
      return int.parse(value.data["workoutid"].toString());
    }).watch();
  }

  Future insertExerciseProgress(Insertable<ExerciseProgres> exerciseProgres) =>
      into(exerciseProgress).insertOnConflictUpdate(exerciseProgres);

  Future insertWorkoutExerciseProgress(
          Insertable<WorkoutExerciseProgres> workoutExercise) =>
      into(workoutExerciseProgress).insertOnConflictUpdate(workoutExercise);

  Stream<PlanProgressTuple> getPlanProgressByID(int planid) {
    return customSelect(
        'select planid,  round(100*sum(progress+0.0)/count(*),1) as  planProgress from exercise_progress WHERE planid= $planid;',
        readsFrom: {exerciseProgress}).map((value) {
      return PlanProgressTuple.fromMap(value.data);
    }).watchSingle();
  }

  ///

  Stream<WorkoutProgressTuple> getWorkoutProgressByID(int workoutid) {
    return customSelect(
        'select workoutid,  round(100*sum(progress+0.0)/count(*),1) as  workoutProgress from workout_exercise_progress WHERE workoutid= $workoutid;',
        readsFrom: {workoutExerciseProgress}).map((value) {
      return WorkoutProgressTuple.fromMap(value.data);
    }).watchSingle();
  }

  Stream<List<DayExercisesProgressTuple>> getWorkoutExerciseProgress(
      int workoutId) {
    return customSelect(
        "SELECT exercise_id,progress FROM workout_exercise_progress  WHERE workoutid=$workoutId;",
        readsFrom: {workoutExerciseProgress}).map((value) {
      return DayExercisesProgressTuple.fromMap(value.data);
    }).watch();
  }

  Stream<List<WeeklyProgressTuple>> getWeeklyProgress(int planid) {
    return customSelect(
        'select planid, weekid,  sum(progress)/count(*) as done from exercise_progress where planid = $planid group by planid, weekid order by planid, weekid;',
        readsFrom: {exerciseProgress}).map((value) {
      return WeeklyProgressTuple.fromMap(value.data);
    }).watch();
  }

  Stream<List<DailyProgressTuple>> getDailyProgress(int planid) {
    return customSelect(
        'select planid, weekid,dayid,  sum(progress)/count(*) as done from exercise_progress where planid = $planid group by planid,weekid,dayid order by planid, weekid, dayid;',
        readsFrom: {exerciseProgress}).map((value) {
      return DailyProgressTuple.fromMap(value.data);
    }).watch();
  }
}
