import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Screens/Utilities/ProtienCalculator/Protien_Calculator.dart';
import 'package:fat_loss_for_women/Screens/Utilities/WaterIntak/waterintakeDone.dart';
import 'package:fat_loss_for_women/Shared/Aleartbox.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/plugins/Notification_plugin.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:intl/intl.dart';

class WaterIntakScreen extends StatefulWidget {
  @override
  _WaterIntakScreenState createState() => _WaterIntakScreenState();
}

class _WaterIntakScreenState extends State<WaterIntakScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics().logEvent(name: 'Water_Screen_View');
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
    return SafeArea(child: Consumer(
      builder: (context, watch, child) {
        final waterData = watch(waterIntakeStream);
        return waterData.when(
            data: (water) {
              return Scaffold(
                backgroundColor: AppColors.white,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    187.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icons/back_arrow.png',
                          height: 56.h,
                          width: 76.w,
                        ).p(5).onInkTap(() {
                          Navigator.pop(context);
                        }),
                        Image.asset(
                          'assets/icons/Settings.png',
                          width: 76.w,
                        ).onInkTap(() async {
                          await WaterintakeSheet().showWaterSettingSheet(
                              context,
                              water,
                              await context.read(userDao).getUserfuture());
                        }),
                      ],
                    ).px(110.w),
                    127.h.heightBox,
                    Text(
                      "Water Reminder",
                      style: TextStyle(
                          fontSize: 72.sp, fontWeight: FontWeight.bold),
                    ).px(110.w),
                    117.h.heightBox,
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          TweenAnimationBuilder<double>(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.easeInOutSine,
                            tween: Tween(
                                begin: 0.0,
                                end: water.drinkGlass! / water.totalGlass! <
                                        0.28
                                    ? 0.28
                                    : water.drinkGlass! / water.totalGlass!),
                            builder: (context, value, child) {
                              return FractionallySizedBox(
                                widthFactor: 1.0,
                                heightFactor: value,
                                child: child,
                              );
                            },
                            child: Column(
                              children: [
                                Lottie.asset(
                                  'assets/Animation/waves_bottom.json',
                                  reverse: true,
                                ),
                                Flexible(
                                  child: Container(
                                    color: AppColors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/waterBottle.png',
                                  height: 160.h,
                                ),
                                76.h.heightBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    '${(water.drinkGlass! * 100) ~/ water.totalGlass!} '
                                        .text
                                        .bold
                                        .size(144.sp)
                                        .color(AppColors.black)
                                        .make(),
                                    '%'
                                        .text
                                        .bold
                                        .size(64.sp)
                                        .color(AppColors.black)
                                        .make(),
                                  ],
                                ),
                                20.h.heightBox,
                                '${water.drinkGlass} / ${water.totalGlass} glass'
                                    .text
                                    .size(52.sp)
                                    .color(AppColors.TextColorLight)
                                    .make(),
                                80.h.heightBox,
                                'Tap to drink water'
                                    .text
                                    .size(64.sp)
                                    .bold
                                    .color(AppColors.blue)
                                    .make(),
                              ],
                            ).pOnly(bottom: 200.h).onInkTap(() async {
                              await Future.delayed(Duration(milliseconds: 600));

                              if (water.drinkGlass! < water.totalGlass!) {
                                context.read(waterIntakeDao).insertWaterIntake(
                                    water.copyWith(
                                        drinkGlass: water.drinkGlass! + 1));
                                await Future.delayed(
                                    Duration(milliseconds: 600));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            WaterIntakDoneScreen()));
                                setState(() {});
                              } else {
                                context.read(waterIntakeDao).insertWaterIntake(
                                    water.copyWith(
                                        drinkGlass: water.drinkGlass! + 1,
                                        totalGlass: water.totalGlass! + 3));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            WaterIntakDoneScreen()));
                              }
                            }),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            loading: () => loading(),
            error: error);
      },
    ));
  }
}

class WaterintakeSheet {
  Future<bool> showWaterSettingSheet(
      BuildContext context, WaterInTake water, User user) async {
    return await showSlidingBottomSheet(context, builder: (context) {
      int numberofGlass = water.totalGlass!;
      int interval = water.reminderInterval!;
      TimeOfDay sleeptime =
          TimeOfDay.fromDateTime(DateFormat.jm().parse(water.sleepTime!));

      return SlidingSheetDialog(
        color: Colors.white,
        backdropColor: AppColors.cardColor.withOpacity(0.4),
        elevation: 8,
        cornerRadius: 0,
        snapSpec: const SnapSpec(
          snappings: [0.9, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return StatefulBuilder(builder: (BuildContext context, reload) {
            return Container(
              height: user.ip! ? 1900.h : 1500.h,
              child: Material(
                child: Container(
                  child: Container(
                    color: AppColors.white,
                    child: SizedBox.expand(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // if (user.ip!) NativeAdBanner(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              70.h.heightBox,
                              Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.close,
                                  size: 70.h,
                                  color: AppColors.TextColorLight,
                                ),
                              ).onTap(() {
                                context.pop();
                              }),
                              Center(
                                child: Text(
                                  "Set Water Reminder",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 68.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              160.h.heightBox,
                              Text(
                                "How much glass of water you want to drink in a day?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.TextColorLight,
                                    fontSize: 53.sp,
                                    fontWeight: FontWeight.normal),
                              ).w(832.w),
                              130.h.heightBox,
                              LineWidget(
                                title: 'Number of Glass',
                                value: numberofGlass.toString(),
                                function: () async {
                                  numberofGlass = await Alertbox().numberDailog(
                                      context: context,
                                      value: water.totalGlass ?? 0,
                                      title: 'Number of Glass',
                                      maxvalue: 18,
                                      minvalue: 4);
                                  reload(() {});
                                },
                              ),
                              120.h.heightBox,
                              LineWidget(
                                title: 'Remind me every',
                                value: '$interval hrs',
                                function: () async {
                                  interval = await Alertbox().numberDailog(
                                      maxvalue: 5,
                                      minvalue: 1,
                                      context: context,
                                      value: water.reminderInterval!,
                                      title: 'Remind me every');
                                  reload(() {});
                                },
                              ),
                              120.h.heightBox,
                              LineWidget(
                                title: 'Sleep time',
                                value: sleeptime.format(context),
                                function: () async {
                                  sleeptime = await showTimePicker(
                                          context: context,
                                          initialTime: sleeptime) ??
                                      sleeptime;
                                  reload(() {});
                                },
                              ),
                              100.h.heightBox,
                              Center(
                                child: CustomButton(
                                    color: AppColors.blue,
                                    width: 590,
                                    onpressed: () async {
                                      await cancleWaterNotification();
                                      await setWaternotification(
                                          sleeptime: TimeOfDay.fromDateTime(
                                              DateFormat.jm()
                                                  .parse(water.sleepTime!)),
                                          reminderInterval:
                                              water.reminderInterval!);
                                      context
                                          .read(waterIntakeDao)
                                          .insertWaterIntake(water.copyWith(
                                              totalGlass: numberofGlass,
                                              reminderInterval: interval,
                                              sleepTime:
                                                  sleeptime.format(context)));
                                      FirebaseAnalytics().logEvent(
                                          name: 'Water_Reminder_Set',
                                          parameters: {
                                            'Sleep_Time':
                                                sleeptime.format(context)
                                          });
                                      await context.read(userDao).insertUser(
                                          user.copyWith(
                                              dailyWaterRemainder:
                                                  !user.dailyWaterRemainder!));
                                      context.pop(true);
                                    },
                                    title: 'Save'),
                              ),
                            ],
                          ).px(91.w)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      );
    });
  }

  Future<bool> showWorkoutSheet(
      BuildContext context, WaterInTake water, User user) async {
    return await showSlidingBottomSheet(context, builder: (context) {
      TimeOfDay workoutTime = TimeOfDay.fromDateTime(DateTime.now());
      return SlidingSheetDialog(
        color: Colors.white,
        backdropColor: AppColors.cardColor.withOpacity(0.4),
        elevation: 8,
        cornerRadius: 0,
        snapSpec: const SnapSpec(
          snappings: [0.9, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return StatefulBuilder(builder: (BuildContext context, reload) {
            return Container(
              height: user.ip! ? 1500.h : 1100.h,
              child: Material(
                child: Container(
                  child: Container(
                    color: AppColors.white,
                    child: SizedBox.expand(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // if (user.ip!) NativeAdBanner(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              70.h.heightBox,
                              Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.close,
                                  size: 70.h,
                                  color: AppColors.TextColorLight,
                                ),
                              ).onTap(() {
                                context.pop();
                              }),
                              Center(
                                child: Text(
                                  "Set Workout Reminder",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 68.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              160.h.heightBox,
                              Text(
                                "In which time of the day you do workout more often?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.TextColorLight,
                                    fontSize: 53.sp,
                                    fontWeight: FontWeight.normal),
                              ).w(832.w),
                              130.h.heightBox,
                              LineWidget(
                                title: 'Workout Time',
                                value: workoutTime.format(context),
                                function: () async {
                                  workoutTime = await showTimePicker(
                                          context: context,
                                          initialTime: workoutTime) ??
                                      workoutTime;
                                  reload(() {});
                                },
                              ),
                              100.h.heightBox,
                              Center(
                                child: CustomButton(
                                    width: 590,
                                    onpressed: () async {
                                      await cancleNotification(10);
                                      await setnotification(
                                          10,
                                          'Time to Workout',
                                          workoutTime.hour,
                                          workoutTime.minute);

                                      context
                                          .read(waterIntakeDao)
                                          .insertWaterIntake(water.copyWith(
                                              workoutTime:
                                                  workoutTime.format(context)));
                                      await context.read(userDao).insertUser(
                                          user.copyWith(
                                              dailyWorkoutRemainder: !user
                                                  .dailyWorkoutRemainder!));
                                      FirebaseAnalytics().logEvent(
                                          name: 'Workout_Time_notification_Set',
                                          parameters: {
                                            'Workout_Time':
                                                workoutTime.format(context)
                                          });
                                      context.pop(true);
                                    },
                                    title: 'Save'),
                              ),
                            ],
                          ).px(91.w)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      );
    });
  }

  setWaternotification(
      {required TimeOfDay sleeptime, required int reminderInterval}) async {
    int id = 100;
    int hours = 8;
    print(sleeptime.hour);
    loop:
    for (var i = 0; hours <= sleeptime.hour; i++) {
      print("time:$hours");
      await NotificationPlugin().timeToDrinkWaterDailyNotification(
          id,
          'It’s time to hydrate!',
          'Drinking water increases more \ncalories burning.',
          hours,
          sleeptime.minute);
      hours += reminderInterval;
      if (id == 20) break loop;
      id++;
    }
  }

  setsimple() async {
    await NotificationPlugin().showNotificationWithNoBody();
  }

  cancleWaterNotification() async {
    int id = 100;
    for (var i = 0; i < 10; i++) {
      await NotificationPlugin().cancelNotification(id);
      id++;
    }
  }

  setnotification(int id, String title, int hours, int mint) async {
    await NotificationPlugin().workoutDailyNotification(
        id,
        title,
        'Set target to burn more calories to achieve maximum results.',
        hours,
        mint);
  }

  cancleNotification(int id) async {
    await NotificationPlugin().cancelNotification(id);
  }
}
