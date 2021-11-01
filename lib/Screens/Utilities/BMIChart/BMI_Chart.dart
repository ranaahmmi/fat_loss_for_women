import 'dart:ui';

import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class BMIChart extends StatefulWidget {
  const BMIChart({Key? key}) : super(key: key);

  @override
  _BMIChartState createState() => _BMIChartState();
}

class _BMIChartState extends State<BMIChart> {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            187.h.heightBox,
            Image.asset(
              'assets/icons/back_arrow.png',
              height: 56.54.h,
              width: 76.98.w,
            ).p(5).onInkTap(() {
              context.pop();
            }),
            132.h.heightBox,
            Text(
              "BMI Chart",
              style: TextStyle(
                fontSize: 68.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            117.h.heightBox,
            Text(
              "Body mass index (BMI) is a measure of body fat based on your weight in relation to your height. BMI percentile is the best assessment of body fat.",
              maxLines: 4,
              style: TextStyle(fontSize: 46.sp),
            ),
            40.h.heightBox,
            if (isAdShow) NativeAdsFull(),
            80.h.heightBox,
            Image.asset(
              "assets/icons/bmi_chart.png",
              height: 1268.h,
            )
          ],
        ).px(109.w),
      ),
    );
  }
}
