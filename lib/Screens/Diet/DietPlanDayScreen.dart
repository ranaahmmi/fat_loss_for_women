import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Screens/Diet/DietDetailPage.dart';
import 'package:fat_loss_for_women/Shared/Variables.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietPlanDayScreen extends StatefulWidget {
  final DietPlanSub dietPlan;
  final bool istitle;
  const DietPlanDayScreen(
      {Key? key, required this.dietPlan, this.istitle = false})
      : super(key: key);

  @override
  _DietPlanDayScreenState createState() => _DietPlanDayScreenState();
}

class _DietPlanDayScreenState extends State<DietPlanDayScreen> {
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
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.dietPlan.imageUrl),
                    fit: BoxFit.fill)),
            height: 1232.h,
            width: 1440.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                187.h.heightBox,
                Image.asset(
                  "assets/icons/back_arrow.png",
                  height: 56.54.h,
                  width: 76.98.w,
                  color: Colors.white,
                ).onTap(() {
                  context.pop();
                }).pOnly(left: 99.w),
                787.h.heightBox,
                Text(
                  widget.dietPlan.title,
                  //"Diet Plan for “Shredded Body”",
                  style: TextStyle(
                      fontSize: 72.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ).px(294.w),
              ],
            ),
          ),
          128.h.heightBox,
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.dietPlan.planDetail.length,
            itemBuilder: (context, index) {
              if (widget.istitle) {
                return Column(
                  children: [
                    if (index == 0 && isAdShow)
                      NativeAdsFull().pOnly(bottom: 100.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 184.h.heightBox,
                        Text(
                          widget.dietPlan.planDetail[index].mainImage,
                          style: TextStyle(
                              fontSize: 48.sp, fontWeight: FontWeight.bold),
                        ).pOnly(left: 101.w),
                        Container(
                          width: 551.w,
                          height: 128.h,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              "Show Diet Plan",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 48.sp),
                            ),
                          ),
                        ).px(100.w).onTap(() {
                          FirebaseAnalytics().logEvent(
                              name: 'Diet_Plan_Day_view',
                              parameters: {
                                'Diet_Plan_Day': "Day-${index + 1}"
                              });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DietDetailPage(
                                        imageUrl: widget.dietPlan
                                            .planDetail[index].childImage,
                                        title: "Day-${index + 1}",
                                      )));
                        }),
                      ],
                    ),
                    166.h.heightBox,
                    Divider(
                      endIndent: 186.w,
                      indent: 186.w,
                    ),
                    166.h.heightBox,
                  ],
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index % 2 == 0 && index != 0 && isAdShow)
                    NativeAdsFull().pOnly(bottom: 128.h),
                  Image.asset(
                    widget.dietPlan.planDetail[index].mainImage,
                    width: 1234.w,
                    height: 420.h,
                  ).pOnly(left: 101.w, right: 107.w),
                  87.h.heightBox,
                  Container(
                    width: 551.w,
                    height: 128.h,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Show Diet Plan",
                        style: TextStyle(color: Colors.white, fontSize: 48.sp),
                      ),
                    ),
                  ).pOnly(left: 790.w, right: 99.w).onTap(() {
                    FirebaseAnalytics().logEvent(
                        name: 'Diet_Plan_Day_view',
                        parameters: {'Diet_Plan_Day': "Day-${index + 1}"});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DietDetailPage(
                                  imageUrl: widget
                                      .dietPlan.planDetail[index].childImage,
                                  title: "Day-${index + 1}",
                                )));
                  }),
                  75.h.heightBox,
                  Divider(
                    endIndent: 186.w,
                    indent: 186.w,
                  ),
                  128.h.heightBox,
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
