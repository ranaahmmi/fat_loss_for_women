import 'package:cached_network_image/cached_network_image.dart';
import 'package:fat_loss_for_women/Screens/PlanScreen/PlanDetail.dart';
import 'package:fat_loss_for_women/Screens/Utilities/WaterIntak/WaterIntakScreen.dart';
import 'package:fat_loss_for_women/Screens/Utilities/WaterIntak/waterHeader.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/models/Tuple/PlanProgressTuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'PlanWeeksScreen.dart';

class PlanScreen extends StatefulWidget {
  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
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

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        WaterHeader(),
        74.h.heightBox,
        'Best Fat lose\nworkouts for You!'
            .text
            .size(102.sp)
            .extraBold
            .color(AppColors.black)
            .make()
            .px(50.w),
        50.h.heightBox,
        'Recommended by coach'
            .text
            .size(52.sp)
            .color(AppColors.primaryColor)
            .make()
            .px(50.w),
        107.h.heightBox,
        Consumer(builder: (context, watch, child) {
          final planListFuture = watch(getPlanList);
          final planinit = watch(planinitList).data?.value;

          return planListFuture.when(
            data: (planlist) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: planlist.length,
                  itemBuilder: (context, index) {
                    final plan = planlist[index];
                    final planProgress =
                        watch(getPlanProgressByPlanID(plan.id)).data?.value ??
                            PlanProgressTuple(planId: 1, planProgress: 0);

                    return Column(
                      children: [
                        (index == 1 || index == 3) && isAdShow
                            ? NativeAdsFull()
                            : Text(''),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 1558.h,
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: plan.planPhoto!,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  placeholder: (context, url) => loading(),
                                  errorWidget: (context, url, error) =>
                                      new Icon(Icons.error),
                                ),
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        Colors.transparent,
                                        AppColors.black.withOpacity(0.6)
                                      ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter)),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        plan.inAppPurchaseID != null
                                            ? Image.asset(
                                                "assets/icons/premium_plans_card_icon.png",
                                                height: 202.h,
                                              )
                                            : Text(''),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(plan.challengeDuration ?? '')
                                                .text
                                                .color(AppColors.white)
                                                .size(48.sp)
                                                .make()
                                                .pOnly(
                                                    left: 90.w,
                                                    right: 58.w,
                                                    top: 27.h,
                                                    bottom: 27.h)
                                                .box
                                                .color(AppColors.black
                                                    .withOpacity(0.5))
                                                .leftRounded(value: 30)
                                                .make(),
                                            20.h.heightBox,
                                            Text(plan.planLevel ?? '')
                                                .text
                                                .color(AppColors.white)
                                                .size(48.sp)
                                                .make()
                                                .pOnly(
                                                    left: 90.w,
                                                    right: 58.w,
                                                    top: 27.h,
                                                    bottom: 27.h)
                                                .box
                                                .color(AppColors.black
                                                    .withOpacity(0.5))
                                                .leftRounded(value: 30)
                                                .make(),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          plan.planTitle!,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 72.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        26.h.heightBox,
                                        Row(
                                          children: [
                                            'View Routine'
                                                .text
                                                .size(42.sp)
                                                .color(AppColors.white)
                                                .make(),
                                            36.w.widthBox,
                                            Image.asset(
                                              'assets/icons/premium_proceed_arrow.png',
                                              width: 50.w,
                                              color: AppColors.primaryColor,
                                            )
                                          ],
                                        ),
                                        66.h.heightBox,
                                        Container(
                                                child: LinearPercentIndicator(
                                          backgroundColor: Colors.black,
                                          animation: true,
                                          lineHeight: 20.0,
                                          animationDuration: 2500,
                                          percent: planinit!.contains(plan.id)
                                              ? planProgress.planProgress! / 100
                                              : 0,
                                          center: planinit.contains(plan.id)
                                              ? Text((planProgress
                                                              .planProgress)!
                                                          .toStringAsFixed(2) +
                                                      " %  Completed")
                                                  .text
                                                  .bold
                                                  .white
                                                  .make()
                                              : Text("0 %  Completed")
                                                  .text
                                                  .bold
                                                  .white
                                                  .make(),
                                          linearStrokeCap:
                                              LinearStrokeCap.roundAll,
                                          progressColor: AppColors.primaryColor,
                                        ).px(20.w))
                                            .pOnly(bottom: 20)
                                      ],
                                    ),
                                  ],
                                ).pOnly(
                                    top: 25, bottom: 10, left: 10, right: 0),
                              ],
                            ),
                          ).onTap(() async {
                            final interstitial =
                                context.read(interstitialAdProvider);

                            if (isAdShow) {
                              if (!interstitial.isAvailable) {
                                interstitial.load();
                                if (!planinit.contains(plan.id)) {
                                  FirebaseAnalytics().logEvent(
                                      name: 'Plan_Detail_Screen',
                                      parameters: {'Plan_ID': plan.id});
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlanDetailScreen(
                                              workoutPlan: plan,
                                            )),
                                  );
                                } else {
                                  FirebaseAnalytics().logEvent(
                                      name: 'Continue_Plan',
                                      parameters: {'Plan_ID': plan.id});
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlanWeeksScreen(
                                              workoutPlan: plan,
                                            )),
                                  );
                                }
                              } else {
                                await interstitial.show();
                                if (!planinit.contains(plan.id)) {
                                  FirebaseAnalytics().logEvent(
                                      name: 'Plan_Detail_Screen',
                                      parameters: {'Plan_ID': plan.id});
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlanDetailScreen(
                                              workoutPlan: plan,
                                            )),
                                  );
                                } else {
                                  FirebaseAnalytics().logEvent(
                                      name: 'Continue_Plan',
                                      parameters: {'Plan_ID': plan.id});
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlanWeeksScreen(
                                              workoutPlan: plan,
                                            )),
                                  );
                                }
                              }
                            } else {
                              if (!planinit.contains(plan.id)) {
                                FirebaseAnalytics().logEvent(
                                    name: 'Plan_Detail_Screen',
                                    parameters: {'Plan_ID': plan.id});
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlanDetailScreen(
                                            workoutPlan: plan,
                                          )),
                                );
                              } else {
                                FirebaseAnalytics().logEvent(
                                    name: 'Continue_Plan',
                                    parameters: {'Plan_ID': plan.id});
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlanWeeksScreen(
                                            workoutPlan: plan,
                                          )),
                                );
                              }
                            }
                          }),
                        ).pOnly(bottom: 10),
                      ],
                    );
                  });
            },
            loading: () => Center(child: loading()),
            error: (e, st) => Text('Error: $e'),
          );
        }),
      ],
    ).px(70.w);
  }
}
