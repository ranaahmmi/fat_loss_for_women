import 'dart:io';

import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Screens/PlanScreen/PlanDetail.dart';
import 'package:fat_loss_for_women/Screens/ProfileScreen/ProfileSettingScreen.dart';
import 'package:fat_loss_for_women/Screens/Utilities/WaterIntak/WaterIntakScreen.dart';
import 'package:fat_loss_for_women/Shared/Aleartbox.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Shared/GetPic.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  File? img;
  String version = '0.0.1';

  @override
  void initState() {
    super.initState();
    getImage();
    getVersion();
  }

  getImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imagpath = prefs.getString('profile');
    if (imagpath != null) img = File(imagpath);
    setState(() {});
  }

  getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    print(packageInfo.appName);
    print(packageInfo.packageName);
    setState(() {});
  }

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isloading,
      color: AppColors.black,
      progressIndicator: loading(),
      child: Scaffold(
        body: Consumer(builder: (context, watch, child) {
          final userdata = watch(userStream);

          return userdata.when(
              data: (user) {
                return ListView(
                  children: [
                    130.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icons/drawer_icon.png',
                          height: 45.h,
                        ),
                        Container(
                          height: 260.w,
                          width: 260.w,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 3),
                              shape: BoxShape.circle),
                          child: GestureDetector(
                            onTap: () async {
                              FirebaseAnalytics().logEvent(
                                name: 'Set_ProfilePic',
                              );
                              img = await SetProfilePic().getFromGallery();
                              getImage();
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(99),
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: (img != null)
                                          ? FileImage(img!)
                                          : AssetImage(
                                                  "assets/icons/emptyProfile.jpeg")
                                              as ImageProvider,
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    54.h.heightBox,
                    user.name!.text
                        .size(102.sp)
                        .extraBold
                        .color(AppColors.black)
                        .make(),
                    140.h.heightBox,
                    'Prrimary'.text.size(48.sp).color(AppColors.greyDim).make(),
                    80.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'Profile'
                            .text
                            .size(56.sp)
                            .color(AppColors.black)
                            .make(),
                        'Edit Profile'
                            .text
                            .size(48.sp)
                            .color(AppColors.primaryColor)
                            .make()
                            .onInkTap(() {
                          FirebaseAnalytics().logEvent(
                            name: 'Edit_Profile',
                          );
                          context.nextPage(ProfileSetting(
                            user: user,
                          ));
                        }),
                      ],
                    ),
                    // 140.h.heightBox,
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     'Set Language'
                    //         .text
                    //         .size(56.sp)
                    //         .color(AppColors.black)
                    //         .make(),
                    //     Row(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         'English (USA)'
                    //             .text
                    //             .size(48.sp)
                    //             .color(AppColors.primaryColor)
                    //             .make(),
                    //         12.w.widthBox,
                    //         Icon(
                    //           Icons.arrow_drop_down,
                    //           color: AppColors.TextColorLight,
                    //           size: 80.w,
                    //         )
                    //       ],
                    //     ).onTap(() {
                    //       FirebaseAnalytics().logEvent(
                    //         name: 'Click_Language',
                    //       );
                    //       context.showToast(
                    //           msg: 'Language Coming Soon',
                    //           bgColor: AppColors.primaryColor,
                    //           textColor: Colors.white,
                    //           textSize: 48.sp,
                    //           position: VxToastPosition.top);
                    //     }),
                    //   ],
                    // ),
                    160.h.heightBox,
                    'Notifications'
                        .text
                        .size(48.sp)
                        .color(AppColors.greyDim)
                        .make(),
                    78.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'Daily Water Reminder'
                            .text
                            .size(56.sp)
                            .color(AppColors.black)
                            .make(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            'Update'
                                .text
                                .size(48.sp)
                                .color(AppColors.primaryColor)
                                .make(),
                            72.w.widthBox,
                            FlutterSwitch(
                              width: 50.0,
                              height: 25.0,
                              value: user.dailyWaterRemainder!,
                              borderRadius: 30.0,
                              padding: 2.0,
                              activeColor: Color(0xFFE0E0E0),
                              inactiveColor: Color(0xFFE0E0E0),
                              activeToggleColor: AppColors.primaryColor,
                              onToggle: (val) async {
                                if (!val) {
                                  await WaterintakeSheet()
                                      .cancleWaterNotification();
                                  final dao = watch(userDao);
                                  await dao.insertUser(user.copyWith(
                                      dailyWaterRemainder:
                                          !user.dailyWaterRemainder!));
                                } else {
                                  await WaterintakeSheet()
                                      .showWaterSettingSheet(
                                          context,
                                          await watch(waterIntakeDao)
                                              .getWaterIntakefuture(),
                                          user);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    78.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'Daily Workout Reminder'
                            .text
                            .size(56.sp)
                            .color(AppColors.black)
                            .make(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            'Update'
                                .text
                                .size(48.sp)
                                .color(AppColors.primaryColor)
                                .make(),
                            72.w.widthBox,
                            FlutterSwitch(
                              width: 50.0,
                              height: 25.0,
                              value: user.dailyWorkoutRemainder!,
                              borderRadius: 30.0,
                              padding: 2.0,
                              activeColor: Color(0xFFE0E0E0),
                              inactiveColor: Color(0xFFE0E0E0),
                              activeToggleColor: AppColors.primaryColor,
                              onToggle: (val) async {
                                if (!val) {
                                  WaterintakeSheet().cancleNotification(10);
                                  final dao = watch(userDao);
                                  await dao.insertUser(user.copyWith(
                                      dailyWorkoutRemainder:
                                          !user.dailyWorkoutRemainder!));
                                } else {
                                  await WaterintakeSheet().showWorkoutSheet(
                                      context,
                                      await watch(waterIntakeDao)
                                          .getWaterIntakefuture(),
                                      user);
                                  final dao = watch(userDao);
                                  await dao.insertUser(user.copyWith(
                                      dailyWorkoutRemainder:
                                          !user.dailyWorkoutRemainder!));
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    160.h.heightBox,
                    'Extras'.text.size(48.sp).color(AppColors.greyDim).make(),
                    78.h.heightBox,
                    "Privacy Policy"
                        .text
                        .size(56.sp)
                        .color(AppColors.black)
                        .make()
                        .onTap(() async {
                      FirebaseAnalytics().logEvent(
                        name: 'Privacy_Policy_View',
                      );
                      const url =
                          'https://docs.google.com/document/d/1Lm8hrmLgtQLRnEivcrWejLkt8S7EGmWN7jeRemIu02k/edit?usp=sharing';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => PrivacyPolicyScreen()));
                    }),
                    // 78.h.heightBox,
                    // "Share with Friends"
                    //     .text
                    //     .size(56.sp)
                    //     .color(AppColors.black)
                    //     .make()
                    //     .onTap(() {
                    //   FirebaseAnalytics().logEvent(
                    //     name: 'Click_on_Share',
                    //   );
                    //   Share.share(
                    //       'https://play.google.com/store/apps/details?id=com.innovidio.mensfitnesshome');
                    // }),
                    // 78.h.heightBox,
                    // "Rate Us"
                    //     .text
                    //     .size(56.sp)
                    //     .color(AppColors.black)
                    //     .make()
                    //     .onTap(() async {
                    //   FirebaseAnalytics().logEvent(
                    //     name: 'Click_on_RateUs',
                    //   );
                    //   const url =
                    //       'https://play.google.com/store/apps/details?id=com.innovidio.mensfitnesshome';
                    //   if (await canLaunch(url)) {
                    //     await launch(url);
                    //   } else {
                    //     throw 'Could not launch $url';
                    //   }
                    // }),
                    78.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Version"
                            .text
                            .size(56.sp)
                            .color(AppColors.black)
                            .make()
                            .onTap(() {
                          context
                              .read(userDao)
                              .insertUser(user.copyWith(ip: !user.ip!));
                        }),
                        version.text
                            .size(56.sp)
                            .color(AppColors.greyDim)
                            .make(),
                      ],
                    ),
                    100.h.heightBox,
                    "Reset All Progress"
                        .text
                        .size(56.sp)
                        .color(AppColors.red)
                        .make()
                        .onTap(() {
                      // isloading = true;
                      // setState(() {});
                      FirebaseAnalytics().logEvent(
                        name: 'Reset_AllPlans_Progress',
                      );
                      final planIds = watch(planinitList).data?.value ?? [];
                      Alertbox().resetProgress(context, () async {
                        final interstitial =
                            context.read(interstitialAdProvider);
                        final bool isAdShow =
                            context.read(purchasedProvider).data?.value ??
                                false;
                        if (isAdShow) {
                          if (!interstitial.isAvailable) {
                            await interstitial.load();
                            await Navigator.pushReplacement(
                              context,
                              SlideRightRoute(
                                page: InitPlanLoading(
                                  plan: WorkoutPlan(id: 1),
                                  isAdShow: isAdShow,
                                  planlist: planIds,
                                ),
                              ),
                            );
                            // context.pop(true);
                          } else {
                            await interstitial.show();
                            await Navigator.pushReplacement(
                              context,
                              SlideRightRoute(
                                page: InitPlanLoading(
                                  plan: WorkoutPlan(id: 1),
                                  isAdShow: isAdShow,
                                  planlist: planIds,
                                ),
                              ),
                            );
                            // context.pop(true);
                          }
                        } else {
                          await Navigator.pushReplacement(
                            context,
                            SlideRightRoute(
                              page: InitPlanLoading(
                                plan: WorkoutPlan(id: 1),
                                isAdShow: isAdShow,
                                planlist: planIds,
                              ),
                            ),
                          );
                          // context.pop(true);
                        }
                      });
                    }),
                    // 125.h.heightBox,
                    // "Logout".text.size(56.sp).color(AppColors.red).make(),
                    125.h.heightBox,
                  ],
                ).px(112.w);
              },
              loading: loading,
              error: error);
        }),
      ),
    );
  }
}
