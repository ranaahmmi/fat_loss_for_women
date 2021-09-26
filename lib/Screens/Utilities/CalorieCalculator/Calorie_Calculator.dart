import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fat_loss_for_women/Screens/Utilities/CalorieCalculator/Calorie_Burning_Chart.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';

class CalorieCalculator extends StatefulWidget {
  final User user;

  const CalorieCalculator({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _CalorieCalculatorState createState() => _CalorieCalculatorState();
}

class _CalorieCalculatorState extends State<CalorieCalculator> {
  bool isUsUnit = true;
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController bmRate = TextEditingController();
  TextEditingController exerciseTime = TextEditingController();

  @override
  void initState() {
    age.text = widget.user.age.toString();
    height.text = widget.user.height!;
    weight.text = widget.user.weight!;

    super.initState();
  }

  @override
  void dispose() {
    age.dispose();
    weight.dispose();
    height.dispose();
    bmRate.dispose();
    exerciseTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            108.h.heightBox,
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
                  'assets/icons/info_icon.png',
                  width: 120.w,
                ).onInkTap(() {
                  context.nextPage(CalorieBurningChart());
                }),
              ],
            ),
            127.h.heightBox,
            Text(
              "Calories Calculator",
              style: TextStyle(fontSize: 72.sp, fontWeight: FontWeight.bold),
            ),
            107.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'Us Units'
                    .text
                    .color(isUsUnit ? AppColors.white : AppColors.primaryColor)
                    .size(48.sp)
                    .makeCentered()
                    .pSymmetric(v: 35.h, h: 100.w)
                    .box
                    .roundedLg
                    .color(isUsUnit ? AppColors.primaryColor : AppColors.white)
                    .border(
                        color: isUsUnit
                            ? AppColors.white
                            : AppColors.TextColorLight.withOpacity(0.4),
                        width: isUsUnit ? 0 : 1)
                    .make()
                    .onInkTap(() {
                  isUsUnit = true;
                  setState(() {});
                }),
                52.w.widthBox,
                'Metric Units'
                    .text
                    .color(!isUsUnit ? AppColors.white : AppColors.primaryColor)
                    .size(48.sp)
                    .makeCentered()
                    .pSymmetric(v: 35.h, h: 100.w)
                    .box
                    .roundedLg
                    .color(!isUsUnit ? AppColors.primaryColor : AppColors.white)
                    .border(
                        color: !isUsUnit
                            ? AppColors.white
                            : AppColors.TextColorLight.withOpacity(0.4),
                        width: !isUsUnit ? 0 : 1)
                    .make()
                    .onInkTap(() {
                  isUsUnit = false;
                  setState(() {});
                }),
              ],
            ),
            201.h.heightBox,
            CalculatorLineWidget(
              title: 'Your age',
              controller: age,
            ),
            125.h.heightBox,
            CalculatorLineWidget(
              title: 'Weight',
              controller: weight,
            ),
            131.h.heightBox,
            CalculatorLineWidget(
              title: 'Heart Rate (BPM) ',
              controller: bmRate,
            ),
            131.h.heightBox,
            Text(
              "How long will you exercise for?",
              style: TextStyle(fontSize: 53.sp, fontWeight: FontWeight.bold),
            ),
            120.h.heightBox,
            CalculatorLineWidget(
              title: 'Exercise Time',
              controller: exerciseTime,
            ),
            223.h.heightBox,
            CustomButton(onpressed: () {}, title: 'Calculate'),
            189.h.heightBox,
            Text(
              "You Burned",
              style: TextStyle(fontSize: 53.sp),
            ),
            124.h.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "233.5",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 144.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "calories",
                  style:
                      TextStyle(fontSize: 64.sp, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ).px(109.w),
      )),
    );
  }
}
