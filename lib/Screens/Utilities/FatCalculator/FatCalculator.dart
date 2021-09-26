import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fat_loss_for_women/Screens/Utilities/FatCalculator/FatChart.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';

class FatCalculator extends StatefulWidget {
  final User user;

  const FatCalculator({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _FatCalculatorState createState() => _FatCalculatorState();
}

class _FatCalculatorState extends State<FatCalculator> {
  bool isUsUnit = true;

  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController neckSize = TextEditingController();
  TextEditingController waist = TextEditingController();
  TextEditingController hip = TextEditingController();

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
    neckSize.dispose();
    waist.dispose();
    hip.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                context.nextPage(FatChart());
              }),
            ],
          ),
          127.h.heightBox,
          Text(
            "Fat Calculator",
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
                    .linearGradient(isUsUnit
                        ? [Color(0xFFFF488F), Color(0xFFFF8AB9)]
                        : [AppColors.white, AppColors.white])
                    .border(
                        color: isUsUnit
                            ? AppColors.white
                            : AppColors.primaryColor.withOpacity(0.4),
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
                    .linearGradient(!isUsUnit
                        ? [Color(0xFFFF488F), Color(0xFFFF8AB9)]
                        : [AppColors.white, AppColors.white])
                    .border(
                        color: !isUsUnit
                            ? AppColors.white
                            : AppColors.primaryColor.withOpacity(0.4),
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
            title: 'Height',
            controller: height,
          ),
          131.h.heightBox,
          CalculatorLineWidget(
            title: 'Neck Size',
            controller: neckSize,
          ),
          131.h.heightBox,
          CalculatorLineWidget(
            title: 'Waist',
            controller: waist,
          ),
          131.h.heightBox,
          CalculatorLineWidget(
            title: 'Hip',
            controller: hip,
          ),
          162.h.heightBox,
          Center(child: CustomButton(onpressed: () {}, title: 'Calculate')),
          126.h.heightBox,
          Text(
            "Your Body Fat Percantage is",
            style: TextStyle(fontSize: 53.sp, fontWeight: FontWeight.bold),
          ),
          124.h.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "23.8 ",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 144.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "%",
                style: TextStyle(fontSize: 64.sp, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ).px(109.w),
    );
  }
}
