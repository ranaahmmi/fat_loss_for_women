import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';

class WaterIntakDoneScreen extends StatefulWidget {
  @override
  _WaterIntakDoneScreenState createState() => _WaterIntakDoneScreenState();
}

class _WaterIntakDoneScreenState extends State<WaterIntakDoneScreen> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              187.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/back_arrow.png',
                    height: 56.h,
                    width: 76.w,
                  ).p(5).onInkTap(() {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
                  Spacer()
                ],
              ).px(110.w),
              isAdShow ? 50.h.heightBox : 187.h.heightBox,
              // if (isAdShow) NativeAdsFull().px(20.w),
              95.h.heightBox,
              Center(
                  child: Lottie.asset('assets/Animation/well_done.json',
                      repeat: false, height: 728.h)),
              90.h.heightBox,
              'Water helps with workouts.'
                  .text
                  .center
                  .color(AppColors.TextColorLight)
                  .size(52.sp)
                  .makeCentered(),
              175.h.heightBox,
              Center(
                child: CustomButton(
                    color: AppColors.blue,
                    onpressed: () async {
                      final interstitial = context.read(interstitialAdProvider);

                      if (isAdShow) {
                        if (!interstitial.isAvailable) {
                          interstitial.load();
                          context.pop();
                          context.pop();
                        } else {
                          await interstitial.show();
                          context.pop();
                          context.pop();
                        }
                      } else {
                        context.pop();
                        context.pop();
                      }
                    },
                    title: 'Done'),
              )
            ]),
      ),
    );
  }
}
