import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class FatChart extends StatefulWidget {
  const FatChart({Key? key}) : super(key: key);

  @override
  _FatChartState createState() => _FatChartState();
}

class _FatChartState extends State<FatChart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              context.pop();
            }),
            132.h.heightBox,
            Text(
              "Ideal Body Fat % Chart",
              style: TextStyle(fontSize: 68.sp, fontWeight: FontWeight.bold),
            ),
            117.h.heightBox,
            Text(
              "There is no ideal body weight for each person, but there are ranges for healthy body weight.",
              maxLines: 4,
              style: TextStyle(fontSize: 46.sp),
            ),
            122.h.heightBox,
            Image.asset(
              "assets/icons/fat_chart.png",
              height: 976.h,
            )
          ],
        ).px(109.w),
      ),
    );
  }
}
