import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Exercises.dart';
import 'package:fat_loss_for_women/models/Tuple/ExerciseProgressTuple.dart';
import 'package:fat_loss_for_women/models/Tuple/PlanProgressTuple.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/exerciseProgress.dart';
import 'package:moor/moor.dart';
part 'ExerciseDao.g.dart';

@UseDao(tables: [Exercises, ExerciseProgress])
class ExerciseDao extends DatabaseAccessor<AppDatabase>
    with _$ExerciseDaoMixin {
  final AppDatabase db;

  ExerciseDao(this.db) : super(db);

  Stream<List<Exercise>> getExercisesByCategoryName(String categoryName) {
    return (select(exercises)
          ..where((tbl) => tbl.mainMuscleGroup.equals(categoryName)))
        .watch();
  }

  Future<List<Exercise>> getExercises() {
    return select(exercises).get();
  }

  Future<Exercise> getSingleExercise(int exerciseid) {
    return (select(exercises)..where((tbl) => tbl.id.equals(exerciseid)))
        .getSingle();
  }

  Future<List<Exercise>> getlistExercise(List<int> exerciseid) async {
    List<Exercise> list = [];
    for (var item in exerciseid) {
      final exercise = await (select(exercises)
            ..where((tbl) => tbl.id.equals(item)))
          .getSingle();
      list.add(exercise);
    }
    return list;
  }

  Future insertExercises(exercise) =>
      into(exercises).insertOnConflictUpdate(exercise);

  Stream<List<ExerciseProgressTuple>> getDayProgressStream(
      int planid, int weekid, int dayid) {
    return customSelect(
        "select id,type,exercise_title,detail,other_muscle_groups,detail_link,main_muscle_group,equipment,mechanics,difficulty,image1_link,image2_link,sets,repetitions,video_link,progress from exercises INNER JOIN exercise_progress on exercises.id = exercise_progress.exercise_id where planid = $planid and weekid = $weekid and dayid = $dayid ;",
        readsFrom: {exercises, exerciseProgress}).map((value) {
      return ExerciseProgressTuple.fromMap(value.data);
    }).watch();
  }

  Future<List<ExerciseProgressTuple>> getDayProgress(
      int planid, int weekid, int dayid) {
    return customSelect(
        "select id,type,exercise_title,detail,other_muscle_groups,detail_link,main_muscle_group,equipment,mechanics,difficulty,image1_link,image2_link,sets,repetitions,video_link,progress from exercises INNER JOIN exercise_progress on exercises.id = exercise_progress.exercise_id where planid = $planid and weekid = $weekid and dayid = $dayid ;",
        readsFrom: {exercises, exerciseProgress}).map((value) {
      return ExerciseProgressTuple.fromMap(value.data);
    }).get();
  }

  Stream<List<DayExercisesProgressTuple>> getPlanFullWeekDaysProgress(
      int planid, int weekid, int dayid) {
    return customSelect(
        "SELECT exercise_id,progress FROM exercise_progress  WHERE planid=$planid AND weekid=$weekid AND dayid=$dayid;",
        readsFrom: {exerciseProgress}).map((value) {
      return DayExercisesProgressTuple.fromMap(value.data);
    }).watch();
  }

  Future<List<DayExercisesProgressTuple>> getPlanFullWeekDaysProgressFuture(
      int planid, int weekid, int dayid) {
    return customSelect(
        "SELECT exercise_id,progress FROM exercise_progress  WHERE planid=$planid AND weekid=$weekid AND dayid=$dayid;",
        readsFrom: {exerciseProgress}).map((value) {
      return DayExercisesProgressTuple.fromMap(value.data);
    }).get();
  }

  Stream<ExerciseProgressTuple> getExerciseWithProgressStream(
      int planid, int weekid, int dayid, int exerciseid) {
    return customSelect(
        "select id,type,exercise_title,detail,other_muscle_groups,detail_link,main_muscle_group,equipment,mechanics,difficulty,image1_link,image2_link,sets,repetitions,video_link,progress from exercises INNER JOIN exercise_progress on exercises.id = exercise_progress.exercise_id where planid = $planid  and weekid = $weekid and dayid = $dayid  and exercise_id = $exerciseid;",
        readsFrom: {exercises, exerciseProgress}).map((value) {
      return ExerciseProgressTuple.fromMap(value.data);
    }).watchSingle();
  }
}
