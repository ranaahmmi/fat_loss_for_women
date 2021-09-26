import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Screens/ProScreen/ProScreen.dart';
import 'package:fat_loss_for_women/Screens/Utilities/WaterIntak/waterHeader.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:fat_loss_for_women/Shared/Variables.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'DietPlanDayScreen.dart';

class DietPlanScreen extends StatefulWidget {
  const DietPlanScreen({Key? key}) : super(key: key);

  @override
  _DietPlanScreenState createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
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
            WaterHeader().px(70.w),
            74.h.heightBox,
            Text(
              "Effective Diet Plans",
              style: TextStyle(fontSize: 102.sp, fontWeight: FontWeight.bold),
            ).pOnly(left: 112.w),
            50.h.heightBox,
            Text(
              "Recommended by coach",
              style: TextStyle(color: AppColors.primaryColor, fontSize: 52.sp),
            ).pOnly(left: 112.w),
            105.h.heightBox,
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: planScreen.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index == 1 && isAdShow)
                      NativeAdsFull().px(70.w).pOnly(bottom: 50.h),
                    Container(
                      width: 1301.w,
                      height: 761.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.w),
                          image: DecorationImage(
                              image: AssetImage(planScreen[index].imageUrl),
                              fit: BoxFit.cover)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          index == 2
                              ? Column(
                                  children: [
                                    54.h.heightBox,
                                    Image.asset(
                                      'assets/icons/premium_plans_card_icon.png',
                                      width: 211.w,
                                    ),
                                    281.h.heightBox,
                                  ],
                                )
                              : 536.h.heightBox,
                          Text(
                            planScreen[index].title,
                            style: TextStyle(
                                fontSize: 72.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          18.h.heightBox,
                          Text(
                            planScreen[index].subtitle,
                            style:
                                TextStyle(color: Colors.white, fontSize: 42.sp),
                          ),
                        ],
                      ).pOnly(left: 60.w),
                    ).px(70.w).pOnly(bottom: 50.h).onTap(() async {
                      FirebaseAnalytics().logEvent(
                          name: 'Diet_Plan_Open',
                          parameters: {
                            'Diet_Plan_name': planScreen[index].title
                          });
                      if (isAdShow) {
                        final interstitial =
                            context.read(interstitialAdProvider);
                        if (!interstitial.isAvailable) {
                          interstitial.load();
                          if (index == 2) {
                            if (isAdShow) {
                              Navigator.push(
                                  context, SlideRightRoute(page: ProScreen()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DietPlanDayScreen(
                                            istitle: true,
                                            dietPlan: planScreen[index],
                                          )));
                            }
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DietPlanDayScreen(
                                          dietPlan: planScreen[index],
                                        )));
                          }
                        } else {
                          await interstitial.show();
                          if (index == 2) {
                            if (isAdShow) {
                              Navigator.push(
                                  context, SlideRightRoute(page: ProScreen()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DietPlanDayScreen(
                                            istitle: true,
                                            dietPlan: planScreen[index],
                                          )));
                            }
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DietPlanDayScreen(
                                          dietPlan: planScreen[index],
                                        )));
                          }
                        }
                      } else {
                        if (index == 2) {
                          if (isAdShow) {
                            Navigator.push(
                                context, SlideRightRoute(page: ProScreen()));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DietPlanDayScreen(
                                          istitle: true,
                                          dietPlan: planScreen[index],
                                        )));
                          }
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DietPlanDayScreen(
                                        dietPlan: planScreen[index],
                                      )));
                        }
                      }
                    }),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
