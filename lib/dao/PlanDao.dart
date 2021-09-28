import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Exerciseids.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Exercises.dart';
import 'package:fat_loss_for_women/models/Tuple/PlanProgressTuple.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/WorkoutPlans.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Days.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Weeks.dart';
import 'package:moor/moor.dart';

part 'PlanDao.g.dart';

@UseDao(tables: [WorkoutPlans, Weeks, Days, ExerciseIds, Exercises])
class PlanDao extends DatabaseAccessor<AppDatabase> with _$PlanDaoMixin {
  final AppDatabase db;

  PlanDao(this.db) : super(db);

  Future<List<WorkoutPlan>> getAllWorkoutPlan() => (select(workoutPlans)
        ..orderBy(
            [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc)]))
      .get();

  Stream<List<WorkoutPlan>> getAllWorkoutPlanwithStrem() =>
      (select(workoutPlans)
            ..orderBy([
              (t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc)
            ]))
          .watch();

  Future<List<WorkoutPlan>> getWorkoutPlanByCategoryName(String categoryName) {
    return (select(workoutPlans)
          ..where((tbl) => tbl.planLevel.equals("Moderate Level ")))
        .get();
  }

  Future<String> getUpdatedTimeStemp() {
    return customSelect('select max(update_timestamp) from workout_plans;',
            readsFrom: {workoutPlans})
        .map((value) => value.data["max(update_timestamp)"].toString())
        .getSingle();
  }

  Future<List> getAllExercisesids() {
    return customSelect('SELECT exerciseid FROM exercise_ids;',
        readsFrom: {exerciseIds}).map((value) {
      return value.data['exerciseid'];
    }).get();
  }

  Future<List<ExerciseId>> getAllExercisesidsClass() {
    return (select(exerciseIds)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.exerciseid, mode: OrderingMode.asc)
          ]))
        .get();
  }

  Future<List<Week>> getAllWeekByPlanID(int planid) =>
      (select(weeks)..where((tbl) => tbl.planid.equals(planid))).get();

  Future<Day> getDayByPlanIDandWeekid(int planid, weekid, id) {
    final _select = select(days);
    _select..where((tbl) => tbl.planid.equals(planid));
    _select..where((tbl) => tbl.weekid.equals(weekid));
    _select..where((tbl) => tbl.id.equals(id));
    return _select.getSingle();
  }

  Future<List<Day>> getAllDayByPlanID(int planid) {
    final _select = select(days);
    _select
      ..where((tbl) => tbl.planid.equals(planid))
      ..orderBy([(t) => OrderingTerm(expression: t.weekid)]);
    return _select.get();
  }

  Future<List<Day>> getListofDays(int planid, int weekid) {
    final _select = select(days);
    _select..where((tbl) => tbl.planid.equals(planid));
    _select..where((tbl) => tbl.weekid.equals(weekid));
    return _select.get();
  }

  Future<List<ExerciseId>> getExerciseIdByPlanIDandWeekidandDay(
      {int? planid, int? weekid, int? dayid}) {
    final _select = select(exerciseIds);
    _select..where((tbl) => tbl.planid.equals(planid));
    _select..where((tbl) => tbl.weekid.equals(weekid));
    _select..where((tbl) => tbl.dayid.equals(dayid));
    return _select.get();
  }

  Future insertWorkoutPlans(workoutplan) =>
      into(workoutPlans).insertOnConflictUpdate(workoutplan);

  Future insertDay(Insertable<Day> day) =>
      into(days).insertOnConflictUpdate(day);

  Future insertWeek(Insertable<Week> week) =>
      into(weeks).insertOnConflictUpdate(week);

  Future insertExerciseids(Insertable<ExerciseId> exerciseid) =>
      into(exerciseIds).insertOnConflictUpdate(exerciseid);

  Stream<List<PlanProgressTuple>> getPlanProgress() {
    return customSelect(
        "select planid, round(100*sum(progress+0.0)/count(*),1) as plan_progress from exercise_progress group by planid;",
        readsFrom: {exercises}).map((value) {
      return PlanProgressTuple.fromMap(value.data);
    }).watch();
  }

  Stream<List<DayProgressTuple>> getDayProgress() {
    return customSelect(
        "select planid,weekid,dayid, round(100*sum(progress+0.0)/count(*),1) as day_progress from exercise_progress  group by dayid, weekid ,planid;",
        readsFrom: {exercises}).map((value) {
      return DayProgressTuple.fromMap(value.data);
    }).watch();
  }

  Future<List<DayProgressTuple>> getDayProgressFuture() {
    return customSelect(
        "select planid,weekid,dayid, round(100*sum(progress+0.0)/count(*),1) as day_progress from exercise_progress  group by dayid, weekid ,planid;",
        readsFrom: {exercises}).map((value) {
      return DayProgressTuple.fromMap(value.data);
    }).get();
  }

  Stream<List<DayProgressTuple>> getDayProgresswithplanId(int planID) {
    return customSelect(
        "select planid,weekid,dayid, round(100*sum(progress+0.0)/count(*),1) as day_progress from exercise_progress WHERE planid=$planID group by dayid, weekid ,planid;",
        readsFrom: {exercises}).map((value) {
      return DayProgressTuple.fromMap(value.data);
    }).watch();
  }
}
