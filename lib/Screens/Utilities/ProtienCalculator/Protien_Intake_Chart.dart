import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ProtienIntakeChart extends StatefulWidget {
  const ProtienIntakeChart({Key? key}) : super(key: key);

  @override
  _ProtienIntakeChartState createState() => _ProtienIntakeChartState();
}

class _ProtienIntakeChartState extends State<ProtienIntakeChart> {
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
              "Protein Intake Chart",
              style: TextStyle(fontSize: 68.sp, fontWeight: FontWeight.bold),
            ),
            117.h.heightBox,
            Text(
              "Optimal daily protein intake for healthy, sedentary adults.",
              style: TextStyle(fontSize: 46.sp),
              maxLines: 4,
            ),
            40.h.heightBox,
            if (isAdShow) NativeAdsFull(),
            80.h.heightBox,
            Image.asset(
              "assets/icons/protein_chart.png",
              height: 1360.h,
            )
          ],
        ).px(109.w),
      ),
    );
  }
}
