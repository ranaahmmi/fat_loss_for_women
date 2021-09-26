import 'package:cached_network_image/cached_network_image.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/Tuple/PlanProgressTuple.dart';

import 'Exercises/ExerciseScreen.dart';

class PlanExerciseList extends StatefulWidget {
  final int? planID, weekID, dayID;
  const PlanExerciseList({
    Key? key,
    required this.dayID,
    required this.weekID,
    required this.planID,
  }) : super(key: key);

  @override
  _PlanExerciseListState createState() => _PlanExerciseListState();
}

class _PlanExerciseListState extends State<PlanExerciseList> {
  @override
  void initState() {
    super.initState();
    adShow();
    // dayProgress();
  }

  bool isAdShow = false;
  bool isShowSheet = false;

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
        alignment: Alignment.bottomCenter,
        children: [
          Consumer(builder: (context, watch, child) {
            final exercis = watch(getExercrisebyplanIDweekIDdayIdProvider!(Day(
                id: widget.dayID!,
                weekid: widget.weekID!,
                planid: widget.planID!)));
            final dayProgress = watch(getDayProgressByPlanID(Day(
                        id: widget.dayID!,
                        weekid: widget.weekID!,
                        planid: widget.planID!)))
                    .data
                    ?.value ??
                [];
            Map<String, bool> progressMap = Map();
            for (DayExercisesProgressTuple item in dayProgress) {
              String key = "${item.exerciseId}";
              progressMap[key] = item.progress == 0 ? false : true;
            }
            print(progressMap);
            if (progressMap.isNotEmpty) {
              Future.delayed(Duration.zero, () async {
                progressMap.containsValue(false)
                    ? isShowSheet = false
                    : isShowSheet = true;
              });
            }
            return exercis.when(
                data: (exerciseList) {
                  return ListView(
                    children: [
                      186.h.heightBox,
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Image.asset("assets/icons/back_arrow.png",
                                height: 56.h, color: AppColors.TextColorLight)
                            .onTap(() {
                          Navigator.pop(context);
                        }),
                      ).px(110.w),
                      Image.asset(
                        'assets/icons/Exercise_vector.png',
                        height: 485.h,
                      ).px(50.w),
                      126.h.heightBox,
                      Container(
                        alignment: Alignment.centerLeft,
                        child: "Exercises (${exerciseList.length})"
                            .text
                            .size(72.sp)
                            .bold
                            .color(AppColors.black)
                            .make(),
                      ).px(50.w),
                      221.h.heightBox,
                      ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: exerciseList.length,
                          itemBuilder: (context, index) {
                            final isdone =
                                progressMap['${exerciseList[index].id}'];

                            return Column(
                              children: [
                                if (index % 3 == 0 && index != 0 && isAdShow)
                                  NativeAdBanner(),
                                ExerciseCard(
                                        exercise: exerciseList[index],
                                        function: () async {
                                          final interstitial = context
                                              .read(interstitialAdProvider);
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();

                                          if (isAdShow) {
                                            if (!interstitial.isAvailable) {
                                              interstitial.load();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              ExercisePage(
                                                                islast: index ==
                                                                        exerciseList.length -
                                                                            1
                                                                    ? true
                                                                    : false,
                                                                exercise:
                                                                    exerciseList[
                                                                        index],
                                                                exerciseIds: ExerciseId(
                                                                    dayid: widget
                                                                        .dayID!,
                                                                    planid: widget
                                                                        .planID!,
                                                                    weekid: widget
                                                                        .weekID!,
                                                                    exerciseid:
                                                                        exerciseList[index]
                                                                            .id),
                                                              )));
                                            } else {
                                              String _lastTime =
                                                  (prefs.getString('AdTime') ??
                                                      DateTime.now()
                                                          .toIso8601String());
                                              if (DateTime.parse(_lastTime)
                                                  .isBefore(DateTime.now())) {
                                                await interstitial.show();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                                ExercisePage(
                                                                  islast: index ==
                                                                          exerciseList.length -
                                                                              1
                                                                      ? true
                                                                      : false,
                                                                  exercise:
                                                                      exerciseList[
                                                                          index],
                                                                  exerciseIds: ExerciseId(
                                                                      dayid: widget
                                                                          .dayID!,
                                                                      planid: widget
                                                                          .planID!,
                                                                      weekid: widget
                                                                          .weekID!,
                                                                      exerciseid:
                                                                          exerciseList[index]
                                                                              .id),
                                                                )));
                                                prefs.setString(
                                                    'AdTime',
                                                    DateTime.now()
                                                        .add(Duration(
                                                            seconds: 14))
                                                        .toIso8601String());
                                              } else {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                                ExercisePage(
                                                                  islast: index ==
                                                                          exerciseList.length -
                                                                              1
                                                                      ? true
                                                                      : false,
                                                                  exercise:
                                                                      exerciseList[
                                                                          index],
                                                                  exerciseIds: ExerciseId(
                                                                      dayid: widget
                                                                          .dayID!,
                                                                      planid: widget
                                                                          .planID!,
                                                                      weekid: widget
                                                                          .weekID!,
                                                                      exerciseid:
                                                                          exerciseList[index]
                                                                              .id),
                                                                )));
                                              }
                                            }
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ExercisePage(
                                                          islast: index ==
                                                                  exerciseList
                                                                          .length -
                                                                      1
                                                              ? true
                                                              : false,
                                                          exercise:
                                                              exerciseList[
                                                                  index],
                                                          exerciseIds: ExerciseId(
                                                              dayid:
                                                                  widget.dayID!,
                                                              planid: widget
                                                                  .planID!,
                                                              weekid: widget
                                                                  .weekID!,
                                                              exerciseid:
                                                                  exerciseList[
                                                                          index]
                                                                      .id),
                                                        )));
                                          }
                                        },
                                        isdone: isdone)
                                    .px(50.w),
                              ],
                            );
                          }),
                    ],
                  );
                },
                loading: () => loading(color: Colors.red[700]),
                error: error);
          }),
          if (isShowSheet)
            Opacity(
              child: ModalBarrier(
                dismissible: false,
                color: Colors.black,
              ),
              opacity: 0.5,
            ),
          AnimatedContainer(
            duration: Duration(milliseconds: 700),
            height: isShowSheet
                ? isAdShow
                    ? 1700.h
                    : 1300.h
                : 0,
            child: Material(
              child: Container(
                child: Container(
                  color: AppColors.white,
                  child: SizedBox.expand(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isAdShow) NativeAdBanner(),
                        Expanded(
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.close,
                                  size: 70.h,
                                  color: AppColors.TextColorLight,
                                ),
                              ).py(70.h).onTap(() {
                                changevalue();
                              }),
                              Center(
                                  child: Lottie.asset(
                                          'assets/Animation/well_done.json',
                                          height: 728.h)
                                      .pOnly(bottom: 100.h)),
                              Positioned(
                                bottom: 396.h,
                                left: 0,
                                right: 0,
                                child: Center(
                                    child: Text(
                                  "You have completed your Day ${widget.dayID} of this Week ${widget.weekID}. Take a good rest then we will continue from next Day. ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.TextColorLight,
                                      fontSize: 46.sp,
                                      fontWeight: FontWeight.normal),
                                ).w(1116.w)),
                              ),
                              Positioned(
                                bottom: 90.h,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: CustomButton(
                                      width: 590,
                                      onpressed: () async {
                                        final interstitial = context
                                            .read(interstitialAdProvider);
                                        if (isAdShow) {
                                          if (!interstitial.isAvailable) {
                                            interstitial.load();
                                            changevalue();
                                          } else {
                                            await interstitial.show();
                                            changevalue();
                                          }
                                        } else {
                                          changevalue();
                                        }
                                      },
                                      title: 'Save'),
                                ),
                              ),
                            ],
                          ).px(91.w),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  changevalue() {
    setState(() {
      isShowSheet = false;
    });
  }

//   showCompleteSheet() async {
//     return await showSlidingBottomSheet(context, builder: (context) {
//       // showCompeletsheet = false;
//       return SlidingSheetDialog(
//         color: Colors.white,
//         backdropColor: AppColors.cardColor.withOpacity(0.4),
//         elevation: 8,
//         cornerRadius: 0,
//         snapSpec: const SnapSpec(
//           snappings: [0.9, 0.7, 1.0],
//           positioning: SnapPositioning.relativeToAvailableSpace,
//         ),
//         builder: (context, state) {
//           return StatefulBuilder(builder: (BuildContext context, reload) {
//             return Container(
//               height: isAdShow ? 1500.h : 1100.h,
//               child: Material(
//                 child: Container(
//                   child: Container(
//                     color: AppColors.white,
//                     child: SizedBox.expand(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           if (isAdShow) NativeAdBanner(),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               70.h.heightBox,
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Icon(
//                                   Icons.close,
//                                   size: 70.h,
//                                   color: AppColors.TextColorLight,
//                                 ),
//                               ).onTap(() {
//                                 context.pop();
//                               }),
//                               Center(
//                                 child: Text(
//                                   "Set Workout Reminder",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: AppColors.black,
//                                       fontSize: 68.sp,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               160.h.heightBox,
//                               Text(
//                                 "In which time of the day you do workout more often?",
//                                 textAlign: TextAlign.left,
//                                 style: TextStyle(
//                                     color: AppColors.TextColorLight,
//                                     fontSize: 53.sp,
//                                     fontWeight: FontWeight.normal),
//                               ).w(832.w),
//                               130.h.heightBox,
//                               100.h.heightBox,
//                               Center(
//                                 child: CustomButton(
//                                     width: 590,
//                                     onpressed: () async {
//                                       final interstitial =
//                                           context.read(interstitialAdProvider);
//                                       if (isAdShow) {
//                                         if (!interstitial.isAvailable) {
//                                           interstitial.load();
//                                           context.pop();
//                                         } else {
//                                           await interstitial.show();
//                                           context.pop();
//                                         }
//                                       } else {
//                                         context.pop();
//                                       }
//                                     },
//                                     title: 'Save'),
//                               ),
//                             ],
//                           ).px(91.w)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           });
//         },
//       );
//     });
//   }
}

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    Key? key,
    required this.exercise,
    required this.function,
    required this.isdone,
  }) : super(key: key);

  final Exercise exercise;
  final VoidCallback function;
  final bool? isdone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 390.h,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: exercise.image1Link!,
              height: 270.h,
              placeholder: (context, url) => Image.asset(
                'assets/icons/all_exercise_icon.webp',
                color: AppColors.black,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ).wh(309.w, 309.h),
            72.w.widthBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                exercise.exerciseTitle!.text
                    .size(56.sp)
                    .color(AppColors.black)
                    .make(),
                "${exercise.sets!}  -  ${exercise.repetitions!}"
                    .text
                    .size(48.sp)
                    .color(AppColors.TextColorLight)
                    .make(),
                "${exercise.time!} workout"
                    .text
                    .size(48.sp)
                    .color(AppColors.TextColorLight)
                    .make(),
              ],
            ).w(753.w),
            10.w.widthBox,
            isdone!
                ? Image.asset(
                    'assets/icons/double_tick.png',
                    color: AppColors.primaryColor,
                    height: 50.h,
                  )
                : Text('')
          ],
        ).pOnly(right: 20.w),
      ),
    );
  }
}
