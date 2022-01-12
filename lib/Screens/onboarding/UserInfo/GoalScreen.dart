import 'package:fat_loss_for_women/Screens/onboarding/UserInfo/CompeleteBoarding.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';

class GoalScreen extends StatefulWidget {
  final User user;
  const GoalScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  GoalScreenState createState() => new GoalScreenState();
}

class GoalScreenState extends State<GoalScreen> {
  TextEditingController _age = TextEditingController();
  bool iskg = true;
  int kg = 76;
  @override
  void dispose() {
    _age.dispose();
    super.dispose();
  }

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              188.h.heightBox,
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/icons/back_arrow.png',
                  width: 76.w,
                ).p(5).onInkTap(() {
                  context.pop();
                }),
              ),
              Center(
                child: Image.asset(
                  'assets/icons/weight_goal_image.png',
                  width: 1070.w,
                ),
              ),
              108.h.heightBox,
              'Set Weight Goal'
                  .text
                  .extraBold
                  .size(102.sp)
                  .color(AppColors.black)
                  .make(),
              83.h.heightBox,
              'Goals can help you work towards a healthier lifestyle'
                  .text
                  .center
                  .color(AppColors.TextColorLight)
                  .size(50.sp)
                  .make()
                  .w(724.w),
              154.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
              ),
              140.h.heightBox,
              Center(
                child: Column(
                  children: [
                    iskg
                        ? 'kg'
                            .text
                            .size(48.sp)
                            .color(AppColors.primaryColor)
                            .make()
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
                      maxValue: 170,
                      step: 1,
                      axis: Axis.horizontal,
                      onChanged: (value) => setState(() => kg = value),
                    ),
                    Image.asset(
                      'assets/icons/Polygon 2.png',
                      color: AppColors.primaryColor,
                      height: 10,
                    ),
                  ],
                ),
              ),
              246.h.heightBox,
              CustomButton(
                  onpressed: () async {
                    Navigator.of(context).push(SlideBouttomRoute(
                        page: Compeletboarding(
                            user: widget.user.copyWith(
                                goal: iskg
                                    ? kg.toString()
                                    : (kg * 2.20462).toStringAsFixed(2)))));
                  },
                  title: 'Let’s Get Started'),
              136.h.heightBox,
            ],
          ).px(112.w),
        ),
    );
  }
}
