import 'package:dotted_border/dotted_border.dart';
import 'package:fat_loss_for_women/Screens/PlanScreen/PlanDetail.dart';
import 'package:fat_loss_for_women/Screens/Utilities/WaterIntak/WaterIntakScreen.dart';
import 'package:fat_loss_for_women/Shared/Aleartbox.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:fat_loss_for_women/models/Tuple/DailyProgressTuple.dart';
import 'package:fat_loss_for_women/models/Tuple/PlanProgressTuple.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Screens/PlanScreen/PlanExerciseListScreen.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';

class PlanWeeksScreen extends StatefulWidget {
  final WorkoutPlan workoutPlan;

  const PlanWeeksScreen({Key? key, required this.workoutPlan})
      : super(key: key);

  @override
  _PlanWeeksScreenState createState() => _PlanWeeksScreenState();
}

class _PlanWeeksScreenState extends State<PlanWeeksScreen> {
  late ScrollController _scrollController;

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset >
            (isAdShow ? 1400.h : 1000.h - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    adShow();
    _checkFirstSeen();
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

  Future _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('SETTING_SEEN') ?? false);
    print(_seen);
    if (!_seen) {
      WaterInTake water =
          await context.read(waterIntakeDao).getWaterIntakefuture();
      await WaterintakeSheet().showWorkoutSheet(
          context, water, await context.read(userDao).getUserfuture());
      await prefs.setBool('SETTING_SEEN', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
              expandedHeight: isAdShow ? 1500.h : 1080.h,
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
                                  height: 56.h, color: AppColors.TextColorLight)
                              .onTap(() {
                            Navigator.pop(context);
                          }),
                          Flexible(
                            child: widget.workoutPlan.planTitle!.text
                                .size(68.sp)
                                .bold
                                .maxLines(2)
                                .color(AppColors.black)
                                .make()
                                .pOnly(left: 111.w),
                          ),
                        ],
                      ).px(111.w).pOnly(top: 50.h),
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    186.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Image.asset("assets/icons/back_arrow.png",
                                  height: 56.h, color: AppColors.TextColorLight)
                              .onTap(() {
                            Navigator.pop(context);
                          }),
                        ),
                        Image.asset(
                          'assets/icons/Week_Vector.png',
                          height: 444.h,
                        ),
                      ],
                    ).px(111.w),
                    40.h.heightBox,
                    if (isAdShow) NativeAdBanner(),
                    112.h.heightBox,
                    widget.workoutPlan.planTitle!.text
                        .size(68.sp)
                        .bold
                        .color(AppColors.black)
                        .make()
                        .px(111.w)
                        .h(200.h),
                    18.h.heightBox,
                    "Exercise: ${widget.workoutPlan.challengeDuration}"
                        .text
                        .size(48.sp)
                        .color(AppColors.TextColorLight)
                        .make()
                        .px(111.w),
                    96.h.heightBox,
                    Consumer(builder: (context, watch, child) {
                      final planProgress =
                          watch(getPlanProgressByPlanID(widget.workoutPlan.id))
                                  .data
                                  ?.value ??
                              PlanProgressTuple(planId: 1, planProgress: 0);
                      return LinearPercentIndicator(
                        backgroundColor: Colors.black.withOpacity(0.8),
                        animation: true,
                        lineHeight: 64.h,
                        animationDuration: 2500,
                        percent: planProgress.planProgress! / 100,
                        center: Hero(
                          tag: 'progressbar ${widget.workoutPlan.id}',
                          child: Text((planProgress.planProgress)!
                                      .toStringAsFixed(1) +
                                  " %  Completed")
                              .text
                              .bold
                              .white
                              .make(),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: AppColors.primaryColor,
                      );
                    }).px(111.w),
                  ],
                ),
              )),
          SliverList(
              delegate: SliverChildListDelegate([
            Consumer(builder: (context, watch, child) {
              final weeks = watch(getTotalweekinPlan!(widget.workoutPlan.id));

              final dayprogress =
                  watch(getPlanDaysProgressByPlanID(widget.workoutPlan.id))
                          .data
                          ?.value ??
                      [];

              return weeks.when(
                  data: (weeks) {
                    Map<String, bool> dailyProgressMap = Map();
                    for (DailyProgressTuple item in dayprogress) {
                      String key =
                          "${item.planId}-${item.weekId}-${item.dayId}";
                      dailyProgressMap[key] = item.isDone();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: weeks + 1,
                      itemBuilder: (context, index) {
                        if (index == weeks) {
                          return CustomButton(
                            onpressed: () async {
                              Alertbox().resetProgress(context, () async {
                                final interstitial =
                                    context.read(interstitialAdProvider);

                                if (isAdShow) {
                                  if (!interstitial.isAvailable) {
                                    await interstitial.load();
                                    await Navigator.push(
                                      context,
                                      SlideRightRoute(
                                        page: InitPlanLoading(
                                          plan: widget.workoutPlan,
                                          isAdShow: isAdShow,
                                          planlist: [],
                                        ),
                                      ),
                                    );
                                    context.pop(true);
                                  } else {
                                    await interstitial.show();
                                    await Navigator.push(
                                      context,
                                      SlideRightRoute(
                                        page: InitPlanLoading(
                                          plan: widget.workoutPlan,
                                          isAdShow: isAdShow,
                                          planlist: [],
                                        ),
                                      ),
                                    );
                                    context.pop(true);
                                  }
                                }
                                await Navigator.push(
                                  context,
                                  SlideRightRoute(
                                    page: InitPlanLoading(
                                      plan: widget.workoutPlan,
                                      isAdShow: isAdShow,
                                      planlist: [],
                                    ),
                                  ),
                                );
                                context.pop(true);
                              });
                            },
                            title: "Reset All Progress",
                            color: AppColors.greyDim,
                          ).py(188.h);
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(children: [
                            Center(
                                child: Text(
                              "Week-${index + 1}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 60.sp,
                                  fontWeight: FontWeight.w900),
                            )),
                            100.h.heightBox,
                            fullWeekCard(
                              planID: widget.workoutPlan.id,
                              day1Active: isActive(dailyProgressMap, index, 1),
                              day2Active: isActive(dailyProgressMap, index, 2),
                              day3Active: isActive(dailyProgressMap, index, 3),
                              day4Active: isActive(dailyProgressMap, index, 4),
                              day5Active: isActive(dailyProgressMap, index, 5),
                              day6Active: isActive(dailyProgressMap, index, 6),
                              day7Active: isActive(dailyProgressMap, index, 7),
                              day1isRestDay:
                                  isRestDay(dailyProgressMap, index, 1),
                              day2isRestDay:
                                  isRestDay(dailyProgressMap, index, 2),
                              day3isRestDay:
                                  isRestDay(dailyProgressMap, index, 3),
                              day4isRestDay:
                                  isRestDay(dailyProgressMap, index, 4),
                              day5isRestDay:
                                  isRestDay(dailyProgressMap, index, 5),
                              day6isRestDay:
                                  isRestDay(dailyProgressMap, index, 6),
                              day7isRestDay:
                                  isRestDay(dailyProgressMap, index, 7),
                              weekID: index + 1,
                            )
                          ]),
                        );
                      },
                    );
                  },
                  loading: () => loading(),
                  error: error);
            }).px(111.w),
          ]))
        ],
      ),
    );
  }

  bool isActive(Map total, int week, int daynumber) {
    return total
            .containsKey("${widget.workoutPlan.id}-${week + 1}-$daynumber") &&
        !total["${widget.workoutPlan.id}-${week + 1}-$daynumber"];
  }

  bool isRestDay(Map total, int week, int daynumber) {
    return !total
        .containsKey("${widget.workoutPlan.id}-${week + 1}-$daynumber");
  }

  Widget fullWeekCard({
    required int weekID,
    required int planID,
    bool day1Active = false,
    bool day2Active = false,
    bool day3Active = false,
    bool day4Active = false,
    bool day5Active = false,
    bool day6Active = false,
    bool day7Active = false,
    bool day1isRestDay = false,
    bool day2isRestDay = false,
    bool day3isRestDay = false,
    bool day4isRestDay = false,
    bool day5isRestDay = false,
    bool day6isRestDay = false,
    bool day7isRestDay = false,
  }) {
    return Center(
      child: Container(
        // decoration: BoxDecoration(
        //   color: AppColors.greyDim,
        //   borderRadius: BorderRadius.circular(20),
        //   // boxShadow: [
        //   //   BoxShadow(
        //   //     color: Colors.grey.withOpacity(0.5),
        //   //     blurRadius: 3,
        //   //     offset: Offset(0, 2), // changes position of shadow
        //   //   ),
        //   // ],
        // ),
        height: 600.h,
        width: 1313.w,
        child:Stack(
          children: [
            Positioned(
                top: 100.h,
                left: 35.w,
                right: 145.w,
                child: Container(
                  color: AppColors.TextColorLight,
                  height: 1.h,
                  width: double.infinity,
                )),
            Positioned(
                bottom: 170.h,
                left: 350.w,
                right: 145.w,
                child: Container(
                  color: AppColors.TextColorLight,
                  height: 1.h,
                  width: double.infinity,
                )),
            Positioned(
                top: 180.h,
                right: 190.w,
                child: Container(
                  color: AppColors.TextColorLight,
                  height: 280.h,
                  width: 1.h,
                )),
            Positioned(
                top: 10.h,
                left: 20.w,
                child: RoundCircle(
                  title: '1',
                  active: day1Active,
                  isRestDay: day1isRestDay,
                  dayID: 1,
                  planID: planID,
                  weekID: weekID,
                )),
            Positioned(
                top: 10.h,
                left: 340.w,
                child: RoundCircle(
                  title: '2',
                  active: day2Active,
                  isRestDay: day2isRestDay,
                  dayID: 2,
                  planID: planID,
                  weekID: weekID,
                )),
            Positioned(
                top: 10.h,
                left: 660.w,
                child: RoundCircle(
                  title: '3',
                  active: day3Active,
                  isRestDay: day3isRestDay,
                  dayID: 3,
                  planID: planID,
                  weekID: weekID,
                )),
            Positioned(
                top: 10.h,
                left: 970.w,
                child: RoundCircle(
                  title: '4',
                  active: day4Active,
                  isRestDay: day4isRestDay,
                  dayID: 4,
                  planID: planID,
                  weekID: weekID,
                )),
            Positioned(
                bottom: 80.h,
                left: 970.w,
                child: RoundCircle(
                  title: '5',
                  active: day5Active,
                  isRestDay: day5isRestDay,
                  dayID: 5,
                  planID: planID,
                  weekID: weekID,
                )),
            Positioned(
                bottom: 80.h,
                left: 660.w,
                child: RoundCircle(
                  title: '6',
                  active: day6Active,
                  isRestDay: day6isRestDay,
                  dayID: 6,
                  planID: planID,
                  weekID: weekID,
                )),
            Positioned(
              bottom: 80.h,
              left: 340.w,
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                  ),
                  height: 145.h,
                  width: 145.w,
                  child: Center(
                    child: Image.asset(
                      'assets/icons/finish_week.png',
                      height: 174.h,
                      color: day7Active
                          ? AppColors.TextColorLight
                          : AppColors.primaryColor,
                    ),
                  )).pOnly(bottom: 10).onInkTap(
                () {
                  if (day7isRestDay) {
                    context.showToast(
                        msg: "This Day is Rest Day",
                        bgColor: Colors.green,
                        textColor: Colors.white,
                        textSize: 48.sp,
                        position: VxToastPosition.top);
                  } else {
                    context.nextPage(PlanExerciseList(
                        dayID: 7, weekID: weekID, planID: planID));
                  }
                },
              ),
            ),
          ],
        ),
     ),
    );
  }
}


class RoundCircle extends StatelessWidget {
  const RoundCircle(
      {Key? key,
      required this.title,
      this.active = false,
      this.bColor = false,
      required this.weekID,
      required this.planID,
      required this.dayID,
      required this.isRestDay})
      : super(key: key);
  final bool bColor;
  final bool isRestDay;
  final String title;
  final int weekID, planID, dayID;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: active
          ? AppColors.TextColorLight
          : isRestDay
              ? AppColors.TextColorLight
              : AppColors.primaryColor,
      borderType: BorderType.Circle,
      dashPattern: [5, 3],
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(99),
          // border: Border.all(
          //     color: active ? AppColors.TextColorLight : AppColors.primaryColor,
          //     width: 1),
        ),
        height: 178.h,
        width: 178.h,
        child: isRestDay
            ? Center(
                child: Image.asset(
                  'assets/icons/rest_day.png',
                  width: 86.w,
                  color: AppColors.primaryColor,
                ),
              )
            : active
                ? title.text.bold.xl
                    .color(AppColors.TextColorLight)
                    .makeCentered()
                : title.text.bold
                    .color(AppColors.white)
                    .makeCentered()
                    .box
                    .withGradient(AppColors.radialGradient)
                    .roundedFull
                    .make(),
      ),
    ).onTap(
      () {
        if (!isRestDay) {
          context.nextPage(
              PlanExerciseList(dayID: dayID, weekID: weekID, planID: planID));
        } else {
          context.showToast(
              msg: 'This Day is Rest Day',
              bgColor: Colors.green,
              textColor: Colors.white,
              textSize: 48.sp,
              position: VxToastPosition.top);
        }
      },
    );
  }
}
