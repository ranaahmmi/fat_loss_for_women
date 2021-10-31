import 'dart:isolate';

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

// These imports are only needed to open the database
import 'package:moor/ffi.dart';
import 'package:moor/isolate.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

part 'app_database.g.dart'; // the generated code will be there

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
  // This new factory function is used to generate Database instance from DatabaseConnection
  AppDatabase.connect(DatabaseConnection connection)
      : super.connect(connection);

  @override
  int get schemaVersion => 1;
}

// This class is used to package the data to be passed to isolate
class _Request {
  _Request(this.sendPort, this.targetPath);

  final SendPort sendPort;
  final String targetPath;
}

void _startBackground(_Request request) {
  // Create new VmDatabase
  final executor = VmDatabase(File(request.targetPath));

  // Because the current function has been executed in the background isolate, let Moor directly start Moor in the current isolate

  final moorIsolate = MoorIsolate.inCurrent(
    () => DatabaseConnection.fromExecutor(executor),
  );

// Pass moorIsolate back to sendPort
  request.sendPort.send(moorIsolate);
}

Future<MoorIsolate> createMoorIsolate() async {
// The path of the database file
  final dbFolder = await getApplicationDocumentsDirectory();
  final path = p.join(dbFolder.path, 'db.ballyFatWomen');

// Create a new ReceivePort
  final receivePort = ReceivePort();

// Execute _startBackground in the new isolate
  await Isolate.spawn(
    _startBackground,
    _Request(receivePort.sendPort, path),
  );

// Waiting for the MoorIsolate returned by receivePort
  return await receivePort.first as MoorIsolate;
}
