import 'package:flutter/material.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/Tuple/DailyProgressTuple.dart';
import 'package:fat_loss_for_women/models/Tuple/PlanProgressTuple.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moor/moor.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

Future<DatabaseConnection> _connectAsync() async {
  final isolate = await createMoorIsolate();
  return isolate.connect();
}

final db = AppDatabase.connect(DatabaseConnection.delayed(_connectAsync()));

final exerciseDao = Provider((_) => db.exerciseDao);
final planDao = Provider((_) => db.planDao);
final exerciseProgressDao = Provider((_) => db.exerciseProgressDao);
final userDao = Provider((_) => db.userDao);
final dailyTipDao = Provider((_) => db.dailyTipsDao);
final workoutDao = Provider((_) => db.workoutDao);
final waterIntakeDao = Provider((_) => db.waterInTakeDao);

final userStream = StreamProvider<User>((ref) {
  final stream = ref.watch(userDao).getUser();
  return stream;
});

final waterIntakeStream = StreamProvider<WaterInTake>((ref) {
  final stream = ref.watch(waterIntakeDao).getWaterIntake();
  return stream;
});
final waterIntakeFuture = FutureProvider<WaterInTake>((ref) async {
  final stream = await ref.watch(waterIntakeDao).getWaterIntakefuture();
  return stream;
});

final dailyTipsFuture = StreamProvider<List<DailyTip>>((ref) {
  final value = ref.watch(dailyTipDao).getAllDailyTips();
  return value;
});

final getPlanList = FutureProvider<List<WorkoutPlan>>((ref) async {
  final value = await ref.watch(planDao).getAllWorkoutPlan();
  return value;
});

final StreamProviderFamily<List<DailyProgressTuple>, int>?
    getplanDailyProgress =
    StreamProvider.family<List<DailyProgressTuple>, int>((ref, planid) {
  final value = ref.watch(exerciseProgressDao).getDailyProgress(planid);
  return value;
});

final planinitList = StreamProvider<List<int>>((ref) {
  final value = ref.watch(exerciseProgressDao).getPlanInitilizedStatus();
  return value;
});
//
// final isworkoutinit = StreamProvider<List<int>>((ref) {
//   final value = ref.watch(exerciseProgressDao).getWorkoutInitilizedStatus();
//   return value;
// });
//
final dayProgressStream = StreamProvider<List<DayProgressTuple>>((ref) {
  final value = ref.watch(planDao).getDayProgress();
  return value;
});


// ///
// final getWorkoutProgressByID =
//     StreamProvider.family<WorkoutProgressTuple, int>((ref, workoutid) {
//   final value =
//       ref.watch(exerciseProgressDao).getWorkoutProgressByID(workoutid);
//   print(value);
//   return value;
// });

// final getWorkoutExProgressByID =
//     StreamProvider.family<List<DayExercisesProgressTuple>, int>(
//         (ref, workoutid) {
//   final value =
//       ref.watch(exerciseProgressDao).getWorkoutExerciseProgress(workoutid);
//   print(value);
//   return value;
// });

final getPlanProgressByPlanID =
    StreamProvider.family<PlanProgressTuple, int>((ref, planid) {
  final value = ref.watch(exerciseProgressDao).getPlanProgressByID(planid);
  return value;
});

final getPlanDaysProgressByPlanID =
    StreamProvider.family<List<DailyProgressTuple>, int>((ref, planid) {
  final value = ref.watch(exerciseProgressDao).getDailyProgress(planid);
  return value;
});

final getDayProgressByPlanID =
    StreamProvider.family<List<DayExercisesProgressTuple>, Day>((ref, day) {
  final value = ref
      .watch(exerciseDao)
      .getPlanFullWeekDaysProgress(day.planid, day.weekid, day.id);
  return value;
});

final FutureProviderFamily<int, int>? getTotalweekinPlan =
    FutureProvider.family<int, int>((ref, planid) async {
  final value = await ref.watch(planDao).getAllWeekByPlanID(planid);
  return value.length;
});

final FutureProviderFamily<int, int>? planprogressdays =
    FutureProvider.family<int, int>((ref, planid) {
  final value = ref.watch(planDao).getDayProgresswithplanId(planid);
  return value.length;
});
final FutureProviderFamily<int, int>? plantotalDay =
    FutureProvider.family<int, int>((ref, planid) async {
  final value = await ref.watch(planDao).getAllDayByPlanID(planid);
  return value.length;
});

final FutureProviderFamily<int, Day>? getExercrisetime =
    FutureProvider.family<int, Day>((ref, day) async {
  int totalTime = 0;
  await ref
      .watch(planDao)
      .getExerciseIdByPlanIDandWeekidandDay(
          planid: day.planid, weekid: day.weekid, dayid: day.id)
      .then((value) async {
    for (var item in value) {
      totalTime = totalTime +
          int.parse(item.timer!.replaceAll(new RegExp(r'[^0-9]'), ''));
    }
  });

  return totalTime;
});

final getExercrisebyplanIDweekIDdayIdProvider =
    FutureProvider.family<List<ExerciseId>, Day>((ref, day) async {
  return await ref.watch(planDao).getExerciseIdByPlanIDandWeekidandDay(
      dayid: day.id, planid: day.planid, weekid: day.weekid);
});

final getExercriseProvider =
    FutureProvider.family<List<Exercise>, Day>((ref, day) async {
  List<Exercise> exerciseList = [];
  final exercisIds =
      await ref.watch(getExercrisebyplanIDweekIDdayIdProvider(day).future);
  await Future.wait(exercisIds.map((element) async {
    Exercise ex =
        await ref.watch(exerciseDao).getSingleExercise(element.exerciseid);
    ex = ex.copyWith(
        time: element.timer,
        repetitions: element.rep,
        sets: element.sets,
        restTime: element.restTime);
    exerciseList.add(ex);
  }));
  return exerciseList;
});

// final getExercrisebyWorkoutName =
//     FutureProvider.family<List<Exercise>, int>((ref, workoutId) async {
//   final planid =
//       await ref.watch(workoutDao).getWorkoutExerciseIdsByWorkoutId(workoutId);

//   List<Exercise> exerciseList = [];
//   planid.forEach((element) async {
//     Exercise ex =
//         await ref.watch(exerciseDao).getSingleExercise(element.exerciseid);
//     ex = ex.copyWith(
//         time: element.timer,
//         repetitions: element.rep,
//         sets: element.sets,
//         restTime: element.restTime);
//     exerciseList.add(ex);
//   });

//   return exerciseList;
// });

final purchasedProvider = StreamProvider<bool>((ref) {
  final a = ref.read(userDao).getUser();
  // return a.map((event) => event.ip!);
  return a.map((event) => false);
});

/// ads Section

final bannerad = Provider<BannerAd>((ref) {
  return BannerAd(
    size: BannerSize.ADAPTIVE,
    builder: (context, child) {
      return child;
    },
    error: Text('error'),
    loading: Text('loading'),
  );
});

final interstitialAdProvider = Provider<InterstitialAd>((ref) {
  final interstitialAd = InterstitialAd();
  if (!interstitialAd.isLoaded) interstitialAd.load();
  interstitialAd.onEvent.listen((e) {
    final event = e.keys.first;
    switch (event) {
      case FullScreenAdEvent.closed:
        interstitialAd.load();
        break;
      default:
        break;
    }
  });
  return interstitialAd;
});
