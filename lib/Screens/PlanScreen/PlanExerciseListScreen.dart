import 'package:cached_network_image/cached_network_image.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  late ScrollController _scrollController;

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (700.h - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    adShow();
    _scrollController = ScrollController()
      ..addListener(() {
        _isAppBarExpanded ? setState(() {}) : setState(() {});
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
              shrinkWrap: true,
              controller: _scrollController,
              slivers: <Widget>[
                SliverAppBar(
                    expandedHeight: 700.h,
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: false,
                    snap: false,
                    elevation: 0,
                    backgroundColor: AppColors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: !_isAppBarExpanded
                          ? Text('')
                          : Row(
                              children: [
                                Image.asset("assets/icons/back_arrow.png",
                                        height: 56.h,
                                        color: AppColors.TextColorLight)
                                    .onTap(() {
                                  Navigator.pop(context);
                                }),
                                'All Exercises'
                                    .text
                                    .size(68.sp)
                                    .bold
                                    .color(AppColors.black)
                                    .make()
                                    .px(111.w),
                              ],
                            ).px(111.w),
                      background: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            186.h.heightBox,
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Image.asset("assets/icons/back_arrow.png",
                                      height: 56.h,
                                      color: AppColors.TextColorLight)
                                  .onTap(() {
                                Navigator.pop(context);
                              }),
                            ).px(110.w),
                            86.h.heightBox,
                            Center(
                              child: Image.asset(
                                'assets/icons/Exercise_vector.png',
                                height: 485.h,
                              ).px(50.w),
                            ),
                          ],
                        ),
                      ),
                    )),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Consumer(builder: (context, watch, child) {
                    final exercis = watch(getExercriseProvider(Day(
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
                      return exercis.when(
                          data: (exerciseList) {
                            return exerciseList.length == 0
                                ? loading()
                                : ListView(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    children: [
                                      26.h.heightBox,
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child:
                                            "Exercises (${exerciseList.length})"
                                                .text
                                                .size(72.sp)
                                                .bold
                                                .color(AppColors.black)
                                                .make(),
                                      ).px(50.w),
                                      121.h.heightBox,
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics: BouncingScrollPhysics(),
                                          itemCount: exerciseList.length,
                                          itemBuilder: (context, index) {
                                            final isdone = progressMap[
                                                '${exerciseList[index].id}'];

                                            return Column(
                                              children: [
                                                if (index % 3 == 0 &&
                                                    index != 0 &&
                                                    isAdShow)
                                                  NativeAdBanner(),
                                                ExerciseCard(
                                                        exercise:
                                                            exerciseList[index],
                                                        function: () async {
                                                          final interstitial =
                                                              context.read(
                                                                  interstitialAdProvider);
                                                          SharedPreferences
                                                              prefs =
                                                              await SharedPreferences
                                                                  .getInstance();

                                                          if (isAdShow) {
                                                            if (!interstitial
                                                                .isAvailable) {
                                                              interstitial
                                                                  .load();
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ExercisePage(
                                                                            islast:
                                                                                index == exerciseList.length - 1,
                                                                            exercise:
                                                                                exerciseList[index],
                                                                            exerciseIds: ExerciseId(
                                                                                dayid: widget.dayID!,
                                                                                planid: widget.planID!,
                                                                                weekid: widget.weekID!,
                                                                                exerciseid: exerciseList[index].id),
                                                                          )));
                                                            } else {
                                                              String _lastTime = (prefs
                                                                      .getString(
                                                                          'AdTime') ??
                                                                  DateTime.now()
                                                                      .toIso8601String());
                                                              if (DateTime.parse(
                                                                      _lastTime)
                                                                  .isBefore(DateTime
                                                                      .now())) {
                                                                await interstitial
                                                                    .show();
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ExercisePage(
                                                                              islast: index == exerciseList.length - 1,
                                                                              exercise: exerciseList[index],
                                                                              exerciseIds: ExerciseId(dayid: widget.dayID!, planid: widget.planID!, weekid: widget.weekID!, exerciseid: exerciseList[index].id),
                                                                            )));
                                                                prefs.setString(
                                                                    'AdTime',
                                                                    DateTime.now()
                                                                        .add(Duration(
                                                                            seconds:
                                                                                14))
                                                                        .toIso8601String());
                                                              } else {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ExercisePage(
                                                                              islast: index == exerciseList.length - 1,
                                                                              exercise: exerciseList[index],
                                                                              exerciseIds: ExerciseId(dayid: widget.dayID!, planid: widget.planID!, weekid: widget.weekID!, exerciseid: exerciseList[index].id),
                                                                            )));
                                                              }
                                                            }
                                                          } else {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ExercisePage(
                                                                              islast: index == exerciseList.length - 1,
                                                                              exercise: exerciseList[index],
                                                                              exerciseIds: ExerciseId(dayid: widget.dayID!, planid: widget.planID!, weekid: widget.weekID!, exerciseid: exerciseList[index].id),
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
                    }
                  ),
                ]))
              ]),
        ],
      ),
    );
  }

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
                    height: 50.h,
                    color: AppColors.primaryColor,
                  )
                : Text('')
          ],
        ).pOnly(right: 20.w),
      ),
    );
  }
}
