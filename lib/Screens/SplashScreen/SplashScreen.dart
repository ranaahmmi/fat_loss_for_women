import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Repository/PlanRepo.dart';
import 'package:fat_loss_for_women/Screens/HomeScreen/HomeScreen.dart';
import 'package:fat_loss_for_women/Screens/onboarding/Onboarding.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    // if (_seen) {
    //   WorkoutRepo().addPlanToDatabase(context);
    // }
    Future.delayed(const Duration(seconds: 2), () async {
      if (_seen) {
        final waterIntake = context.read(waterIntakeDao);
        WaterInTake water = await waterIntake.getWaterIntakefuture();

        if (DateTime.now().day != DateTime.parse(water.dayTime!).day) {
          waterIntake.insertWaterIntake(water.copyWith(
              dayTime: DateTime.now().toString(), drinkGlass: 0));
        }
        // await WorkoutsRepo().addWorkoutToDatabase(context);
        PlansRepo().addPlanToDatabase(context);

        Navigator.of(context)
            .pushReplacement(SlideBouttomRoute(page: HomeScreen()));
      } else {
        // await WorkoutsRepo().addWorkoutToDatabase(context);
        // await PlansRepo().addPlanToDatabase(context);
        FirebaseAnalytics().logEvent(
          name: 'New_User',
        );
        Navigator.of(context)
            .pushReplacement(SlideRightRoute(page: Onboarding()));
      }
    });
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));

    checkFirstSeen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ElasticIn(
        duration: Duration(milliseconds: 2200),
        child: Hero(
          tag: 'splashScreen',
          child: Center(
            child: Image.asset(
              'assets/icons/splash_logo.png',
              height: 272.h,
            ),
          ),
        ),
      ),
    );
  }
}
