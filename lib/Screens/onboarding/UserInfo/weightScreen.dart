import 'package:fat_loss_for_women/Screens/onboarding/UserInfo/ExerciseAWeek.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';

class WeightScreen extends StatefulWidget {
  final User user;
  const WeightScreen({
    Key? key,
    required this.user,
  }) : super(key: key);
  @override
  WeightScreenState createState() => new WeightScreenState();
}

class WeightScreenState extends State<WeightScreen> {
  TextEditingController _age = TextEditingController();
  bool iskg = true;
  int kg = 70;
  @override
  void dispose() {
    _age.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          188.h.heightBox,
          Image.asset(
            'assets/icons/back_arrow.png',
            width: 76.w,
          ).onInkTap(() {
            context.pop();
          }),
          134.h.heightBox,
          'Your Weight?'
              .text
              .color(AppColors.black)
              .extraBold
              .size(102.sp)
              .make(),
          64.h.heightBox,
          'Tell us your weight so that we can estimate fat percentage'
              .text
              .color(AppColors.TextColorLight)
              .size(50.sp)
              .make()
              .w(921.w),
          219.h.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              'Weight'.text.color(AppColors.black).extraBold.size(53.sp).make(),
              Row(
                children: [
                  'kg'
                      .text
                      .color(iskg ? AppColors.white : AppColors.primaryColor)
                      .size(48.sp)
                      .makeCentered()
                      .box
                      .roundedLg
                      .color(iskg ? AppColors.primaryColor : AppColors.white)
                      .border(
                          color: iskg
                              ? AppColors.white
                              : AppColors.TextColorLight.withOpacity(0.4),
                          width: iskg ? 0 : 1)
                      .size(275.w, 100.h)
                      .make()
                      .onInkTap(() {
                    iskg = true;
                    setState(() {});
                  }),
                  52.w.widthBox,
                  'lbs'
                      .text
                      .color(!iskg ? AppColors.white : AppColors.primaryColor)
                      .size(48.sp)
                      .makeCentered()
                      .box
                      .roundedLg
                      .color(!iskg ? AppColors.primaryColor : AppColors.white)
                      .border(
                          color: !iskg
                              ? AppColors.white
                              : AppColors.TextColorLight.withOpacity(0.4),
                          width: !iskg ? 0 : 1)
                      .size(275.w, 100.h)
                      .make()
                      .onInkTap(() {
                    iskg = false;
                    setState(() {});
                  }),
                ],
              )
            ],
          ),
          309.h.heightBox,
          Center(
            child: Column(
              children: [
                iskg
                    ? 'kg'.text.size(48.sp).color(AppColors.primaryColor).make()
                    : 'lbs'
                        .text
                        .size(48.sp)
                        .color(AppColors.primaryColor)
                        .make(),
                NumberPicker(
                  selectedTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 33,
                      fontWeight: FontWeight.bold),
                  value: kg,
                  minValue: 30,
                  itemCount: 5,
                  maxValue: 160,
                  itemWidth: 250.w,
                  step: 1,
                  axis: Axis.horizontal,
                  onChanged: (value) => setState(() => kg = value),
                ),
                Image.asset(
                  'assets/icons/Polygon 2.png',
                  height: 10,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 4,
          ),
          CustomButton(
              onpressed: () {
                Navigator.of(context).push(SlideRightRoute(
                    page: ExerciseAWeekScreen(
                  user: widget.user.copyWith(
                      weight: iskg
                          ? kg.toString()
                          : (kg * 2.20462).toStringAsFixed(2)),
                )));
              },
              title: 'Continue'),
          136.h.heightBox,
        ],
      ).px(112.w),
    );
  }
}
