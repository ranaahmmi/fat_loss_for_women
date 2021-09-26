import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Screens/HomeScreen/HomeScreen.dart';
import 'package:fat_loss_for_women/Screens/SplashScreen/SplashScreen.dart';
import 'package:fat_loss_for_women/Shared/Aleartbox.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/workoutPlanRaw.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fat_loss_for_women/models/WorkoutModel/workoutPlanRaw.dart'
    as wk;
import 'package:shared_preferences/shared_preferences.dart';

import 'ExerciseRepo.dart';
import 'Expection.dart';

class PlansRepo {
  Dio? dio;

  PlansRepo() {
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
    final dao = context.read(planDao);

    return await dao.getUpdatedTimeStemp().then((value) {
      return value == "null" || value == null ? defaultDate : value;
    });
  }

  Future<List?> getHttp(BuildContext context) async {
    final String updatetimestamp = await updateworkoutplan(context);
    print(updatetimestamp);
    try {
      Response response =
          await dio!.get("/app-plan?appId=$appId&timestamp=$updatetimestamp");
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SplashScreen(),
                        ),
                        (route) => false);
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

  Future<bool> addPlanToDatabase(BuildContext context) async {
    final dao = context.read(planDao);

    await getHttp(context).then((value) async {
      List<wk.WorkoutplanRaw> rawlist =
          value!.map((x) => wk.WorkoutplanRaw.fromJson(x)).toList();

      for (wk.WorkoutplanRaw planraw in rawlist) {
        planraw.plan!.planPremium = planraw.planPremium;
        planraw.plan!.inAppPurchaseId = planraw.inAppSku;

        dao.insertWorkoutPlans(WorkoutPlan.fromJson(planraw.plan!.toJson()));
        for (wk.WeekRaw weekRaw in planraw.plan!.weeks!) {
          Week week = Week(
              weekid: weekRaw.id!,
              planid: planraw.plan!.id!,
              weekTitle: weekRaw.weekTitle);
          dao.insertWeek(week);
          for (wk.DayListRaw dayRaw in weekRaw.dayList!) {
            Day day = Day(
                daytitle: dayRaw.dayTitle,
                id: dayRaw.id!,
                planid: planraw.plan!.id!,
                weekid: weekRaw.id!);
            dao.insertDay(day);
            for (ExerciseIdRaw exerciseidRaw in dayRaw.exerciseIds!) {
              ExerciseId exerciseId = ExerciseId(
                  planid: planraw.plan!.id!,
                  weekid: weekRaw.id!,
                  dayid: dayRaw.id!,
                  exerciseid: exerciseidRaw.id!.toInt(),
                  rep: exerciseidRaw.rep,
                  restTime: exerciseidRaw.rest,
                  sets: exerciseidRaw.sets,
                  timer: exerciseidRaw.timer);
              print(exerciseId.toJson());
              dao.insertExerciseids(exerciseId);
            }
          }
        }
      }

      if (value.isNotEmpty) {
        print('done...');
        await ExercisesRepo().addExerciseToDatabase(context);
      }
    });
    return true;
  }
}
