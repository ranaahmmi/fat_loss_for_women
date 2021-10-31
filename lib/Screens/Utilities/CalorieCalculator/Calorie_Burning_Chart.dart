import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class CalorieBurningChart extends StatefulWidget {
  const CalorieBurningChart({Key? key}) : super(key: key);

  @override
  _CalorieBurningChartState createState() => _CalorieBurningChartState();
}

class _CalorieBurningChartState extends State<CalorieBurningChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          187.h.heightBox,
          Image.asset(
            'assets/icons/back_arrow.png',
            height: 56.54.h,
            width: 76.98.w,
          ).p(5).onInkTap(() {
            Navigator.pop(context);
          }),
          127.h.heightBox,
          Text(
            "Calories Burning Chart",
            style: TextStyle(
                fontSize: 68.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black),
          ),
          117.h.heightBox,
          Text(
            "Some great high calorie burning exercises.",
            style:
                TextStyle(fontSize: 46.sp, color: AppColors.TextColorLight),
            maxLines: 4,
          ),
          40.h.heightBox,
          // NativeAdsFull(),
          80.h.heightBox,
          Image.asset(
            "assets/icons/calories_chart.png",
            height: 1778.h,
          )
        ],
      ).px(109.w),
    );
  }
}
