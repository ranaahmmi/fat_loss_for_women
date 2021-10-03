import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Repository/PlanRepo.dart';
import 'package:fat_loss_for_women/Shared/ShimmerLoading.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fat_loss_for_women/Screens/ProScreen/ProScreen.dart';

import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';

class Compeletboarding extends StatefulWidget {
  final User user;
  const Compeletboarding({
    Key? key,
    required this.user,
  }) : super(key: key);
  @override
  CompeletboardingState createState() => new CompeletboardingState();
}

class CompeletboardingState extends State<Compeletboarding> {
  @override
  void initState() {
    userUploadandFatchData();
    super.initState();
  }

  userUploadandFatchData() async {
    await Future.delayed(Duration(seconds: 4), () {});
    final dao = context.read(userDao);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseAnalytics().logEvent(name: 'Onbording_Compelete', parameters: {
      'user_name': widget.user.name,
      'user_age': widget.user.age
    });
    await dao.insertUser(widget.user);
    await PlansRepo().addPlanToDatabase(context);
    await context.read(waterIntakeDao).insertWaterIntake(WaterInTake(
        id: 0,
        drinkGlass: 0,
        totalGlass: 8,
        reminderInterval: 2,
        sleepTime: TimeOfDay(hour: 23, minute: 00).format(context),
        wakeupTime: TimeOfDay(hour: 10, minute: 00).format(context),
        dayTime: DateTime.now().toString(),
        workoutTime: TimeOfDay(hour: 21, minute: 00).format(context)));
    prefs.setBool('seen', true);

    Navigator.of(context).pushAndRemoveUntil(
        SlideRightRoute(page: ProScreen()), (route) => false);
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
