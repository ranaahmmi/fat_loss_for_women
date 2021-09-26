import 'package:cached_network_image/cached_network_image.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class ExercisePage extends StatefulWidget {
  final int? workout;
  final Exercise? exercise;
  final ExerciseId? exerciseIds;

  const ExercisePage({Key? key, this.exercise, this.exerciseIds, this.workout})
      : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  // late Timer _timer;
  // int _start = 30;
  bool? start;
  @override
  void initState() {
    super.initState();
    adShow();
  }

  bool isAdShow = false;
  adShow() async {
    final user = await context.read(userDao).getUserfuture();
    isAdShow = user.ip!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                187.h.heightBox,
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/icons/back_arrow.png',
                    width: 76.w,
                  ).p(5).onInkTap(() {
                    context.pop();
                  }).px(100.w),
                ),
                Container(
                  height: 896.h,
                  color: Colors.white,
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: widget.exercise!.image1Link!,
                      height: 890.h,
                      placeholder: (context, url) => Image.asset(
                        'assets/icons/all_exercise_icon.webp',
                        color: AppColors.black,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ).px(100.w),
                83.h.heightBox,
                widget.exercise!.exerciseTitle!.text
                    .color(AppColors.black)
                    .size(64.sp)
                    .bold
                    .make()
                    .px(100.w),
                109.h.heightBox,
                ExerciseDataTiles(
                  title: "No.of Sets",
                  subtitle: "${widget.exercise!.sets!} Sets",
                ).px(100.w),
                26.h.heightBox,
                ExerciseDataTiles(
                  title: "No.of Reps",
                  subtitle: "${widget.exercise!.repetitions!} Reps",
                ).px(100.w),
                26.h.heightBox,
                ExerciseDataTiles(
                  title: "Workout Time",
                  subtitle: "${widget.exercise!.time!} Workout",
                ).px(100.w),
                26.h.heightBox,
                ExerciseDataTiles(
                  title: "Target Muscle",
                  subtitle: widget.exercise!.mainMuscleGroup!,
                ).px(100.w),
                110.h.heightBox,
                if (isAdShow) NativeAdBanner(),
                140.h.heightBox,
                'How to perform?'
                    .text
                    .color(AppColors.black)
                    .size(72.sp)
                    .bold
                    .make()
                    .px(100.w),
                20.h.heightBox,
                ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Html(
                      data: widget.exercise!.detail,
                      style: {
                        "html": Style(
                          color: Colors.grey[600],
                        ),
                      },
                    )
                  ],
                ).px(100.w),
                300.h.heightBox,
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                color: AppColors.white,
                child: Center(
                  child: CustomChildButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/double_tick.png',
                          color: AppColors.white,
                          height: 50.h,
                        ),
                        66.w.widthBox,
                        'Mark As Complete'
                            .text
                            .bold
                            .color(AppColors.white)
                            .size(56.sp)
                            .make()
                      ],
                    ),
                    onpressed: () async {
                      FirebaseAnalytics().logEvent(
                          name: 'Exercise_Done',
                          parameters: {'Exercise_id': widget.exercise!.id});
                      if (widget.exerciseIds != null) {
                        final daoExerciseProgress =
                            context.read(exerciseProgressDao);
                        ExerciseProgres exerciseProgres = ExerciseProgres(
                            planid: widget.exerciseIds!.planid,
                            weekid: widget.exerciseIds!.weekid,
                            dayid: widget.exerciseIds!.dayid,
                            exerciseId: widget.exerciseIds!.exerciseid,
                            progress: 1);
                        await daoExerciseProgress
                            .insertExerciseProgress(exerciseProgres);
                        final bool isAdShow =
                            context.read(purchasedProvider).data?.value ??
                                false;
                        if (isAdShow) {
                        } else {}
                        //   final interstitial = context.read(interstitialAdProvider);
                        //   if (!interstitial.isAvailable) interstitial.load();
                        //   if (interstitial.isAvailable) {
                        //     interstitial.show();
                        //   }
                        // }
                        Navigator.pop(context);
                      } else {
                        final daoExerciseProgress =
                            context.read(exerciseProgressDao);
                        WorkoutExerciseProgres workoutExercise =
                            WorkoutExerciseProgres(
                                progress: 1,
                                exerciseId: widget.exercise!.id,
                                workoutid: widget.workout!);
                        await daoExerciseProgress
                            .insertWorkoutExerciseProgress(workoutExercise);

                        // final bool isAdShow =
                        //     context.read(purchasedProvider).data?.value ?? false;
                        // if (isAdShow) {
                        //   final interstitial = context.read(interstitialAdProvider);
                        //   if (!interstitial.isAvailable) interstitial.load();
                        //   if (interstitial.isAvailable) {
                        //     interstitial.show();
                        //   }
                        // }
                        print(widget.exercise!.id);
                        Navigator.pop(context);
                      }
                    },
                  ).h(50).py12(),
                ).px(100.w),
              ))
        ],
      ),
    );
  }

  // void startTimer() {
  //   const oneSec = const Duration(seconds: 1);
  //   _timer = Timer.periodic(
  //     oneSec,
  //     (Timer timer) => setState(
  //       () {
  //         if (_start < 1) {
  //           timer.cancel();
  //           start = false;
  //         } else {
  //           _start = _start - 1;
  //         }
  //       },
  //     ),
  //   );
  // }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }
}

class ExerciseDataTiles extends StatelessWidget {
  const ExerciseDataTiles({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        "$title:".text.color(AppColors.black).size(48.sp).bold.make().w(340.w),
        subtitle.text.color(AppColors.TextColorLight).size(48.sp).make(),
      ],
    );
  }
}
