import 'dart:developer';

import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Shared/Aleartbox.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExercisesRepo {
  Future<List?> getHttps(BuildContext context) async {
    final plandao = context.read(planDao);
    final workoutdao = context.read(workoutDao);

    final planlistID = await plandao.getAllExercisesids();
    final workoutListIDb = await workoutdao.getAllExercisesids();

    final list = [...planlistID, ...workoutListIDb];
    print(list);

    try {
      Response response = await Dio().post("$baseUrl/app/exercises",
          data: {"exerciseIds": list, "languageCode": "en"});
      if (response.statusCode == 200) {
        log(response.data.toString());
        return response.data;
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      await showDialog(
          context: context,
          builder: (context) => Alertbox().alertBox('Error', 'No Internet', () {
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => SplashScreen(),
                //     ),
                //     (route) => false);
                Navigator.pop(context);
              }));
      print(e);
      return [e];
    }
    // String data = await DefaultAssetBundle.of(context)
    //     .loadString("assets/exercises.json");
    // final jsonResult = json.decode(data);
    // return jsonResult;
  }

  addExerciseToDatabase(BuildContext context) async {
    final dao = context.read(exerciseDao);
    await getHttps(context).then((value) {
      final exerciseList = value!.map((e) => Exercise.fromJson(e)).toList();
      exerciseList.forEach((val) {
        dao.insertExercises(val);
      });
    });
  }

  initilizeProgressWorkout(BuildContext context, int workoutplanid) async {
    final dao = context.read(planDao);
    final progressDao = context.read(exerciseProgressDao);
    List<Week> weeklist = await dao.getAllWeekByPlanID(workoutplanid);
    for (Week week in weeklist) {
      final int? weekid = week.weekid;
      List<Day> daylist = await dao.getListofDays(workoutplanid, weekid!);
      for (Day day in daylist) {
        final int? dayid = day.id;
        List<ExerciseId> exerciseIdList =
            await dao.getExerciseIdByPlanIDandWeekidandDay(
                planid: workoutplanid, weekid: weekid, dayid: dayid);
        for (ExerciseId exerciseId in exerciseIdList) {
          ExerciseProgres exerciseProgres = ExerciseProgres(
              planid: workoutplanid,
              weekid: weekid,
              dayid: dayid!,
              exerciseId: exerciseId.exerciseid,
              progress: 0);
          progressDao.insertExerciseProgress(exerciseProgres);
        }
      }
    }
  }

  Future<List<Exercise>?> getExerciseWithFiltter({
    int? page,
    String? mainMusclegroup,
  }) async {
    Response response = await Dio()
        .post('$baseUrl/filtered-exercise?page=0&size=100&engLangId=17', data: {
      "mainMuscleGroup": mainMusclegroup,
      "difficulty": '',
      "equipment": '',
      "type": '',
      "tags": '',
      "mechanics": '',
    });
    if (response.statusCode == 200) {
      final dao = ProviderContainer().read(exerciseDao);

      print(response.data);
      // Exercises exercises = Exercises.fromJson(response.data);
      List<Exercise> list = List<Exercise>.from(
          response.data['content'].map((x) => Exercise.fromJson(x)));
      print(list);
      list.forEach((val) {
        dao.insertExercises(val);
      });
      return list;
    }
    return null;
  }
}
