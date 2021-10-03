import 'package:cached_network_image/cached_network_image.dart';
import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Repository/ExerciseRepo.dart';
import 'package:fat_loss_for_women/Screens/PlanScreen/PlanWeeksScreen.dart';
import 'package:fat_loss_for_women/Screens/ProScreen/ProScreen.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';

class PlanDetailScreen extends StatefulWidget {
  final WorkoutPlan workoutPlan;

  const PlanDetailScreen({Key? key, required this.workoutPlan})
      : super(key: key);

  @override
  _PlanDetailScreenState createState() => _PlanDetailScreenState();
}

class _PlanDetailScreenState extends State<PlanDetailScreen> {
  @override
  void initState() {
    super.initState();
    adShow();
  }

  bool isAdShow = false;
  adShow() async {
    final user = await context.read(userDao).getUserfuture();
    isAdShow = user.ip!;
    print(isAdShow);
    setState(() {});
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      color: AppColors.black,
      progressIndicator: loading(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              height: 1573.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          widget.workoutPlan.planPhoto!),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/icons/back_arrow.png",
                            height: 56.h, color: AppColors.white)
                        .onTap(() {
                      Navigator.pop(context);
                    }),
                  ).pSymmetric(v: 180.h, h: 100.w),
                  Column(
                    children: [
                      widget.workoutPlan.planTitle!.text
                          .size(72.sp)
                          .bold
                          .color(AppColors.white)
                          .make(),
                      63.h.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.workoutPlan.planType!.text
                              .size(48.sp)
                              .underline
                              .capitalize
                              .color(AppColors.white)
                              .make(),
                          // Container(
                          //   height: 10,
                          //   width: 2,
                          //   color: AppColors.TextColorLight,
                          // ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: Color(0xFFD4FE1A),
                                size: 60.h,
                              ).pOnly(left: 54.w),
                              26.w.widthBox,
                              widget.workoutPlan.challengeDuration!.text
                                  .size(48.sp)
                                  .color(AppColors.white)
                                  .make(),
                            ],
                          ),
                          // Container(
                          //   height: 10,
                          //   width: 2,
                          //   color: AppColors.TextColorLight,
                          // ),
                          Row(
                            children: [
                              Icon(
                                Icons.signal_cellular_alt_rounded,
                                color: getColor(widget.workoutPlan.planLevel!),
                                size: 60.h,
                              ).pOnly(left: 54.w),
                              26.w.widthBox,
                              widget.workoutPlan.planLevel!.text
                                  .size(48.sp)
                                  .color(AppColors.white)
                                  .make(),
                            ],
                          ),
                        ],
                      ).px(200.w),
                      73.h.heightBox,
                    ],
                  ),
                ],
              ),
            ),
            // if (isAdShow) NativeAdBanner(),
            130.h.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                'What this plan actually does?'
                    .text
                    .size(68.sp)
                    .bold
                    .color(AppColors.black)
                    .make(),
                104.h.heightBox,
                widget.workoutPlan.aboutPlan!.text
                    .size(48.sp)
                    .bold
                    .color(AppColors.TextColorLight)
                    .make(),
                110.h.heightBox,
                CustomButton(
                        onpressed: () async {
                          if (widget.workoutPlan.inAppPurchaseID != null &&
                              isAdShow) {
                            Navigator.pushReplacement(
                                context, SlideRightRoute(page: ProScreen()));
                          } else {
                            await Navigator.push(
                              context,
                              SlideRightRoute(
                                page: InitPlanLoading(
                                  planlist: [],
                                  plan: widget.workoutPlan,
                                  isAdShow: isAdShow,
                                ),
                              ),
                            );
                            Navigator.pushReplacement(
                                context,
                                SlideRightRoute(
                                    page: PlanWeeksScreen(
                                        workoutPlan: widget.workoutPlan)));
                          }
                        },
                        color: widget.workoutPlan.inAppPurchaseID == null ||
                                !isAdShow
                            ? AppColors.primaryColor
                            : AppColors.Adcolor,
                        title: widget.workoutPlan.inAppPurchaseID == null ||
                                !isAdShow
                            ? 'Start Workout'
                            : 'Go Premium')
                    .px(40.w),
                100.h.heightBox,
              ],
            ).px(83.w)
          ],
        ),
      ),
    );
  }
}

class InitPlanLoading extends StatefulWidget {
  final WorkoutPlan plan;
  final bool isAdShow;
  final List<int> planlist;
  const InitPlanLoading({
    Key? key,
    required this.plan,
    required this.isAdShow,
    required this.planlist,
  }) : super(key: key);
  @override
  InitPlanLoadingState createState() => new InitPlanLoadingState();
}

class InitPlanLoadingState extends State<InitPlanLoading> {
  @override
  void initState() {
    initPlanAndNev();
    super.initState();
  }

  initPlanAndNev() async {
    await Future.delayed(Duration(seconds: 4));
    if (widget.planlist.length != 0) {
      FirebaseAnalytics().logEvent(
          name: 'Start_Plan', parameters: {'Plan_ID': widget.plan.id});
      for (var item in widget.planlist) {
        await ExercisesRepo().initilizeProgressWorkout(context, item);
      }
      context.pop();
    } else {
      FirebaseAnalytics().logEvent(
          name: 'Start_Plan', parameters: {'Plan_ID': widget.plan.id});
      await ExercisesRepo().initilizeProgressWorkout(context, widget.plan.id);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Container(
            height: 1500.h,
            child: Stack(
              children: [
                Positioned(
                  top: -100,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/icons/login_bg.png',
                  ),
                ),
                // Positioned(
                //   top: 0,
                //   left: 0,
                //   right: 0,
                // child:
                Center(
                  child: Image.asset(
                    'assets/icons/person_image.png',
                    height: 1400.h,
                  ),
                ),
                // ),
              ],
            ),
          ),
          SpinKitThreeBounce(
            color: AppColors.primaryColor,
            size: 100.h,
          ),
          30.h.heightBox,
          'Please Wait...'
              .text
              .size(56.sp)
              .color(AppColors.primaryColor)
              .semiBold
              .make(),
          43.h.heightBox,
          'Fetching workout plans that suits you the best...'
              .text
              .size(52.sp)
              .color(AppColors.TextColorLight)
              .make(),
          150.h.heightBox,
          // if (widget.isAdShow)
            // Container(
            //         height: 1000.h,
            //         decoration: BoxDecoration(
            //             // borderRadius:
            //             //     BorderRadius.circular(20),
            //             // border: Border.all(
            //             //     color: Colors.black, width: 0)
            //             ),
            //         child: NativeAdsFull())
            //     .px(3.w)
        ],
      ),
    );
  }
}
