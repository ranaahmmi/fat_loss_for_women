import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Screens/Utilities/BMIChart/BmiPage.dart';
import 'package:fat_loss_for_women/Screens/Utilities/ProtienCalculator/Protien_Calculator.dart';
import 'package:fat_loss_for_women/Screens/Utilities/WaterIntak/WaterIntakScreen.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';

class UtitlitiesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    User users = watch(userStream).data?.value ??
        User(
          id: 0,
          age: 23,
          weight: 84.toString(),
          height: 182.toString(),
          ip: true,
        );
    WaterInTake water = watch(waterIntakeStream).data!.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        160.h.heightBox,
        Image.asset(
          'assets/icons/drawer_icon.png',
          height: 45.h,
        ).px(112.w),
        72.h.heightBox,
        Container(
          height: 626.h,
          width: 1457.w,
          color: Color(0xffE0FAFF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 103.h.heightBox,
                  Text(
                    "Water",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 72.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Intake Reminder",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 72.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/icons/premium_proceed_arrow.png",
                          color: AppColors.black,
                          height: 39.h,
                          width: 47.w,
                        ),
                      )
                    ],
                  ),
                  // 105.h.heightBox,
                  // Text(
                  //   "Your next water intake in ",
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 48.sp,
                  //   ),
                  // ),
                  // 19.h.heightBox,
                  // Text(
                  //   "Here goes the timer",
                  //   style: TextStyle(
                  //     fontSize: 64.sp,
                  //   ),
                  // )
                ],
              ).px(50.w),
              Stack(alignment: Alignment(0, 0), children: [
                CircularProgressIndicator(
                  value: water.drinkGlass! / water.totalGlass!,
                  color: AppColors.blue,
                  backgroundColor: AppColors.TextColorLight.withOpacity(0.2),
                ).wh(432.h, 432.h),
                Image.asset(
                  'assets/icons/waterBottle.png',
                  height: 260.h,
                ),
              ]),
            ],
          ),
        ).onInkTap(() {
          context.nextPage(WaterIntakScreen());
        }),
        52.h.heightBox,
        Container(
          // color: Colors.amber,
          height: 150.h,
          width: MediaQuery.of(context).size.width,
          child: Text(
            "Other Utilities",
            style: TextStyle(fontSize: 48.sp),
          ).px(60.w),
        ),
        Expanded(
          child: ListView(
            children: [
              166.h.heightBox,
              UtilitiesCard(
                imgUrl: "assets/icons/calculator_bmi.png",
                title: "BMI Calculator",
                subtitle:
                    "Calculate your body mass index so that\n you would  know where your body mass lie.",
                function: () async {
                  FirebaseAnalytics().logEvent(
                    name: 'Bmi_Calculator_Screen_View',
                  );

                  final interstitial = context.read(interstitialAdProvider);

                  if (users.ip!) {
                    if (!interstitial.isAvailable) {
                      interstitial.load();
                      context.nextPage(BmiMeterPage(
                        user: users,
                      ));
                    } else {
                      await interstitial.show();
                      context.nextPage(BmiMeterPage(
                        user: users,
                      ));
                    }
                  } else {
                    context.nextPage(BmiMeterPage(
                      user: users,
                    ));
                  }
                },
              ).px(113.w),

              if (users.ip!) NativeAdBanner(),
              50.h.heightBox,
              UtilitiesCard(
                imgUrl: "assets/icons/calculator_fat.png",
                title: "Calories Calculator",
                subtitle:
                    "Calculate body fat percentage so that you \ncan get to know how much body fat\n you have to burn.",
                function: () async {
                  FirebaseAnalytics().logEvent(
                    name: 'Bmi_Calculator_Screen_View',
                  );
                  final interstitial = context.read(interstitialAdProvider);

                  if (users.ip!) {
                    if (!interstitial.isAvailable) {
                      interstitial.load();
                      context.nextPage(ProtienCalculator(
                        user: users,
                      ));
                    } else {
                      await interstitial.show();
                      context.nextPage(ProtienCalculator(
                        user: users,
                      ));
                    }
                  } else {
                    context.nextPage(ProtienCalculator(
                      user: users,
                    ));
                  }
                },
              ).px(113.w),
              // UtilitiesCard(
              //   imgUrl: "assets/icons/protien_calculator.png",
              //   title: "Fat Calculator",
              //   subtitle:
              //       "Calculates how much protein your body\n needed according to the intensity of\n workout.",
              //   function: () {
              //     context.nextPage(FatCalculator(
              //       user: users,
              //     ));
              //   },
              // ),
              // UtilitiesCard(
              //   imgUrl: "assets/icons/calculator_calories.png",
              //   title: "Calories Burner",
              //   subtitle:
              //       "Calculates how much calories you burn \naccording to workout intensity",
              //   function: () {
              //     context.nextPage(CalorieCalculator(
              //       user: users,
              //     ));
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class UtilitiesCard extends StatelessWidget {
  final String title, subtitle, imgUrl;
  final VoidCallback function;
  const UtilitiesCard({
    Key? key,
    required this.subtitle,
    required this.title,
    required this.imgUrl,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imgUrl,
              color: AppColors.primaryColor,
              height: 79.h,
              width: 78.24.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 64.sp, fontWeight: FontWeight.bold),
                ).px(101.w),
                SizedBox(
                  height: 43.h,
                ),
                Text(
                  subtitle,
                  maxLines: 3,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 46.sp, color: AppColors.TextColorLight),
                ).px(90.w),
              ],
            ),
            Image.asset(
              "assets/icons/premium_proceed_arrow.png",
              color: AppColors.primaryColor,
              height: 39.h,
              width: 47.w,
            ),
          ],
        ).onInkTap(function),
        100.h.heightBox,
        Container(
          height: 1.h,
          width: 1068.w,
          color: AppColors.greyDim,
        ),
      ],
    );
  }
}
