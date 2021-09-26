import 'dart:developer';
import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Repository/Expection.dart';
import 'package:fat_loss_for_women/Screens/HomeScreen/HomeScreen.dart';
import 'package:fat_loss_for_women/Shared/Aleartbox.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/workoutPlanRaw.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fat_loss_for_women/models/WorkoutModel/WorkoutRaw.dart' as wk;
import 'package:shared_preferences/shared_preferences.dart';

import 'ExerciseRepo.dart';

class WorkoutsRepo {
  Dio? dio;

  WorkoutsRepo() {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
          baseUrl: "$baseUrl",
          receiveDataWhenStatusError: true,
          connectTimeout: 60 * 1000, // 60 seconds
          receiveTimeout: 60 * 1000 // 60 seconds
          );

      dio = new Dio(options);
    }
  }
  Future<String> updateworkoutplan(BuildContext context) async {
    final dao = context.read(workoutDao);

    return await dao.getUpdatedTimeStemp().then((value) {
      print(value);
      return value == "null" || value == null ? defaultDate : value;
    });
  }

  Future<List?> getHttp(BuildContext context) async {
    final String updatetimestamp = await updateworkoutplan(context);
    print(updatetimestamp);
    try {
      Response response = await dio!
          .get("/app-workouts?appId=$appId&timestamp=$updatetimestamp");
      // "https://apps.innovidio.com:8443/gym/api/app/plans?appId=124554&timestamp=2020-01-01T00:00:00");
      if (response.statusCode == 200) {
        // print(response.data);
        return response.data;
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      if (e is DioError) {
        final errorMessage = DioExceptions.fromDioError(e).toString();

        await showDialog(
            context: context,
            builder: (context) =>
                Alertbox().alertBox('Error', errorMessage, () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  bool _seen = (prefs.getBool('seen') ?? false);
                  if (_seen) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(),
                        ),
                        (route) => false);
                  } else {
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (_) => SplashScreen(),
                    //     ),
                    //     (route) => false);
                    Navigator.pop(context);
                  }
                }));

        print(e);
        return [e];
      }
    }

    // String data =
    //     await DefaultAssetBundle.of(context).loadString("assets/Planjson.json");
    // final jsonResult = json.decode(data);
    // return jsonResult;
  }

  Future<bool> addWorkoutToDatabase(BuildContext context) async {
    final dao = context.read(workoutDao);

    await getHttp(context).then((value) async {
      log(value.toString());
      List<wk.WorkoutRaw> rawlist =
          value!.map((x) => wk.WorkoutRaw.fromJson(x)).toList();

      for (wk.WorkoutRaw workoutRaw in rawlist) {
        dao.insertWorkoutPlans(Workout.fromJson(workoutRaw.workout!.toJson()));
        for (ExerciseIdRaw exerciseidRaw in workoutRaw.workout!.exercises!) {
          WorkoutExerciseId exerciseId = WorkoutExerciseId(
              workoutid: workoutRaw.workout!.id!,
              exerciseid: exerciseidRaw.id!.toInt(),
              rep: exerciseidRaw.rep,
              restTime: exerciseidRaw.rest,
              sets: exerciseidRaw.sets,
              timer: exerciseidRaw.timer);
          dao.insertExerciseids(exerciseId);
        }
      }

      if (value.isNotEmpty) {
        print('done...');
        await ExercisesRepo().addExerciseToDatabase(context);
      }
    });
    return true;
  }

  workoutProgressInit(BuildContext context, String workoutTitle) async {
    final dao = context.read(workoutDao);
    final progressDao = context.read(exerciseProgressDao);

    final workout = await dao.getWorkoutIDByWorkoutName(workoutTitle);

    List<WorkoutExerciseId> exerciseIDs =
        await dao.getWorkoutExerciseIdsByWorkoutId(workout.id);

    for (WorkoutExerciseId exerciseId in exerciseIDs) {
      WorkoutExerciseProgres exerciseProgres = WorkoutExerciseProgres(
          workoutid: workout.id,
          exerciseId: exerciseId.exerciseid,
          progress: 0);
      progressDao.insertWorkoutExerciseProgress(exerciseProgres);
    }
  }
}
