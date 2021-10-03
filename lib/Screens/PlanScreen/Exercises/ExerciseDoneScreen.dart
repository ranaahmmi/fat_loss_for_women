import 'package:cached_network_image/cached_network_image.dart';
import 'package:fat_loss_for_women/Screens/HomeScreen/HomeScreen.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
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

class ExerciseDoneScreen extends StatefulWidget {
  @override
  _ExerciseDoneScreenState createState() => _ExerciseDoneScreenState();
}

class _ExerciseDoneScreenState extends State<ExerciseDoneScreen> {
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
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
          isAdShow ? 50.h.heightBox : 220.h.heightBox,
          Center(
            child: Image.asset(
              'assets/icons/AllExerciseDone.png',
              width: 800.w,
            ),
          ),
          50.h.heightBox,
          // if (isAdShow) NativeAdBanner(),
          isAdShow ? 30.h.heightBox : 140.h.heightBox,
          Center(
            child: 'Congratulations, You Have Finished Your Workout'
                .text
                .color(AppColors.black)
                .size(96.sp)
                .center
                .bold
                .make()
                .w(1113.w),
          ),
          70.h.heightBox,
          Center(
            child:
                'Exercises is king and nutrition is queen. Combine the two and you will have a kingdom'
                    .text
                    .color(AppColors.TextColorLight)
                    .size(48.sp)
                    .center
                    .make()
                    .w(1053.w),
          ),
          29.h.heightBox,
          Center(
            child: '-Jack Lalanne'
                .text
                .color(AppColors.TextColorLight)
                .size(48.sp)
                .center
                .make()
                .w(1053.w),
          ),
          isAdShow ? 80.h.heightBox : 250.h.heightBox,
          CustomButton(
            title: 'Back to home',
            onpressed: () async {
              FirebaseAnalytics().logEvent(name: 'All_Exercise_Done');
              Navigator.pushAndRemoveUntil(context,
                  SlideRightRoute(page: HomeScreen()), (route) => false);
            },
          ).h(50).py12().px(100.w),
        ],
      ),
    );
  }
}
