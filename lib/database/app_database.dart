// These imports are only needed to open the database
import 'package:fat_loss_for_women/dao/UtilitiesDao/DailyTipsDao.dart';
import 'package:fat_loss_for_women/dao/ExerciseDao.dart';
import 'package:fat_loss_for_women/dao/ExerciseProgressDao.dart';
import 'package:fat_loss_for_women/dao/UserDao.dart';
import 'package:fat_loss_for_women/dao/PlanDao.dart';
import 'package:fat_loss_for_women/dao/UtilitiesDao/WaterInTakeDao.dart';
import 'package:fat_loss_for_women/dao/WorkoutDao.dart';
import 'package:fat_loss_for_women/models/UtitlitesModel/DailyTips.dart';
import 'package:fat_loss_for_women/models/UtitlitesModel/waterIntake.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Exerciseids.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Exercises.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Workout.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/WorkoutExerciseIDs.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/WorkoutExerciseProgress.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/WorkoutPlans.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Days.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/exerciseProgress.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Users.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Weeks.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

part 'app_database.g.dart'; // the generated code will be there

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.ballyFat'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [
  WorkoutPlans,
  Weeks,
  Days,
  ExerciseIds,
  ExerciseProgress,
  WorkoutExerciseProgress,
  Exercises,
  Users,
  DailyTips,
  Workouts,
  WorkoutExerciseIds,
  WaterInTakes
], daos: [
  UserDao,
  PlanDao,
  ExerciseDao,
  ExerciseProgressDao,
  DailyTipsDao,
  WorkoutDao,
  WaterInTakeDao
])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}
