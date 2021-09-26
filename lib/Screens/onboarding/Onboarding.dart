import 'package:fat_loss_for_women/Screens/onboarding/UserInfo/NameScreen.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  OnboardingState createState() => new OnboardingState();
}

class OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/icons/login_bg.png',
            ),
          ),
          Positioned(
            top: 20.h,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/icons/person_image.png',
            ),
          ),
          Positioned(
            top: 2198.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/time_to_lose_fat.png',
                  height: 218.h,
                ),
                'Please login to proceed to fat lose trainings'
                    .text
                    .size(52.sp)
                    .color(AppColors.TextColorLight)
                    .make(),
                100.h.heightBox,
                CustomButton(
                    onpressed: () {
                      Navigator.of(context).pushReplacement(
                          SlideBouttomRoute(page: NameScreen()));
                    },
                    title: 'Continue')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
