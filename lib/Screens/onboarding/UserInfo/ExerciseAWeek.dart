import 'package:fat_loss_for_women/Screens/onboarding/UserInfo/GoalScreen.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';

class ExerciseAWeekScreen extends StatefulWidget {
  final User user;
  const ExerciseAWeekScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  ExerciseAWeekScreenState createState() => new ExerciseAWeekScreenState();
}

class ExerciseAWeekScreenState extends State<ExerciseAWeekScreen> {
  String radioItem = '';

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
          ).p(5).onInkTap(() {
            context.pop();
          }),
          134.h.heightBox,
          'How often\ndo you exercise?'
              .text
              .color(AppColors.black)
              .extraBold
              .size(102.sp)
              .make()
              .w(775.w),
          184.h.heightBox,
          RadioListTile(
            groupValue: radioItem,
            title: 'Everyday'
                .text
                .fontWeight(radioItem == "Everyday"
                    ? FontWeight.bold
                    : FontWeight.normal)
                .color(radioItem == "Everyday"
                    ? AppColors.black
                    : AppColors.TextColorLight)
                .size(54.sp)
                .make(),
            value: 'Everyday',
            selectedTileColor: AppColors.black,
            activeColor: AppColors.primaryColor,
            onChanged: (val) {
              setState(() {
                radioItem = val as String;
              });
            },
          ),
          RadioListTile(
            groupValue: radioItem,
            title: '3-4 days per week'
                .text
                .fontWeight(radioItem == "3-4 days per week"
                    ? FontWeight.bold
                    : FontWeight.w400)
                .color(radioItem == "3-4 days per week"
                    ? AppColors.black
                    : AppColors.TextColorLight)
                .size(54.sp)
                .make(),
            value: '3-4 days per week',
            toggleable: true,
            selectedTileColor: AppColors.backColor,
            activeColor: AppColors.primaryColor,
            onChanged: (val) {
              setState(() {
                radioItem = val as String;
              });
            },
          ),
          RadioListTile(
            groupValue: radioItem,
            title: '3-4 weeks in a month'
                .text
                .fontWeight(radioItem == "3-4 weeks in a month"
                    ? FontWeight.bold
                    : FontWeight.normal)
                .color(radioItem == "3-4 weeks in a month"
                    ? AppColors.black
                    : AppColors.TextColorLight)
                .size(54.sp)
                .make(),
            value: '3-4 weeks in a month',
            selectedTileColor: AppColors.backColor,
            activeColor: AppColors.primaryColor,
            onChanged: (val) {
              setState(() {
                radioItem = val as String;
              });
            },
          ),
          RadioListTile(
            groupValue: radioItem,
            title: 'I Don\'t'
                .text
                .fontWeight(radioItem == "I Don\'t"
                    ? FontWeight.bold
                    : FontWeight.normal)
                .color(radioItem == "I Don\'t"
                    ? AppColors.black
                    : AppColors.TextColorLight)
                .size(54.sp)
                .make(),
            value: 'I Don\'t',
            selectedTileColor: AppColors.backColor,
            activeColor: AppColors.primaryColor,
            onChanged: (val) {
              setState(() {
                radioItem = val as String;
              });
            },
          ),
          Spacer(
            flex: 4,
          ),
          CustomButton(
              onpressed: () {
                if (radioItem == '') {
                  context.showToast(
                      msg: 'Please Select One of these',
                      bgColor: AppColors.primaryColor,
                      textColor: Colors.white,
                      textSize: 48.sp,
                      position: VxToastPosition.center);
                } else {
                  Navigator.of(context).push(SlideRightRoute(
                      page: GoalScreen(
                    user: widget.user.copyWith(fitnessLevel: radioItem),
                  )));
                }
              },
              title: 'Continue'),
          136.h.heightBox,
        ],
      ).px(112.w),
    );
  }
}
