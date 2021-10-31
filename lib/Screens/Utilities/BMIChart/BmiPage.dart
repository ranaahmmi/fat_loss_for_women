import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fat_loss_for_women/Screens/Utilities/BMIChart/BMI_Chart.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/UtitlitesModel/BmiModel.dart';
import 'package:fat_loss_for_women/plugins/HorizontalPicker.dart';

class BmiMeterPage extends StatefulWidget {
  final User user;
  BmiMeterPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _BmiMeterPageState createState() => _BmiMeterPageState();
}

class _BmiMeterPageState extends State<BmiMeterPage> {
  bool isUsUnit = true;
  double height = 182;
  int weight = 82;
  @override
  void initState() {
    super.initState();
    height = double.parse(widget.user.height!);
    weight = double.parse(widget.user.weight!).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final CalculatorBMI bmi =
        CalculatorBMI(height: height, weight: weight.toDouble());
    return Scaffold(
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
              }),
              Image.asset(
                'assets/icons/info_icon.png',
                width: 120.w,
              ).onInkTap(() {
                FirebaseAnalytics().logEvent(
                  name: 'Bmi_Chart_View',
                );
                context.nextPage(BMIChart());
              }),
            ],
          ),
          127.h.heightBox,
          Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 68.sp, fontWeight: FontWeight.bold),
          ),
          117.h.heightBox,
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
          200.h.heightBox,
          'Your Height'.text.color(AppColors.black).bold.size(53.sp).make(),
          30.h.heightBox,
          isUsUnit
              ? '${((height ~/ 2.54) ~/ 12).toInt()}-${((height ~/ 2.54) % 12).toInt()}'
                  .richText
                  .withTextSpanChildren([
                    " ft-in  ".textSpan.color(AppColors.primaryColor).make()
                  ])
                  .black
                  .size(53.sp)
                  .maxLines(1)
                  .fontFamily('AeroRegularSWFTE')
                  .make()
              : ' ${height.toStringAsFixed(1)}'
                  .richText
                  .withTextSpanChildren(
                      [" Cm  ".textSpan.color(AppColors.primaryColor).make()])
                  .black
                  .size(53.sp)
                  .maxLines(1)
                  .fontFamily('AeroRegularSWFTE')
                  .make(),
          30.h.heightBox,
          Container(
            child: HorizontalPicker(
              header: '',
              initialPosition: 140,
              minValue: 122,
              showNumber: true,
              maxValue: 220,
              showCursor: false,
              // divisions: 220,
              backgroundColor: Colors.transparent,
              activeItemTextColor: AppColors.black,
              passiveItemsTextColor: AppColors.TextColorLight,
              onChanged: (value) {
                height = value;
                setState(() {});
              },
            ),
          ),
          'Your Weight'.text.color(AppColors.black).bold.size(53.sp).make(),
          30.h.heightBox,
          isUsUnit
              ? '${weight.toStringAsFixed(1)}'
                  .richText
                  .withTextSpanChildren(
                      [" Kg  ".textSpan.color(AppColors.primaryColor).make()])
                  .black
                  .size(53.sp)
                  .maxLines(1)
                  .fontFamily('AeroRegularSWFTE')
                  .make()
              : '${(weight * 2.20462).round()}'
                  .richText
                  .withTextSpanChildren(
                      [" lbs".textSpan.color(AppColors.primaryColor).make()])
                  .black
                  .size(53.sp)
                  .maxLines(1)
                  .fontFamily('AeroRegularSWFTE')
                  .make(),
          Center(
            child: Column(
              children: [
                'kg'.text.size(48.sp).color(AppColors.primaryColor).make(),
                NumberPicker(
                  selectedTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 33,
                      fontWeight: FontWeight.bold),
                  value: weight,
                  minValue: 30,
                  maxValue: 180,
                  step: 1,
                  axis: Axis.horizontal,
                  onChanged: (value) => setState(() => weight = value),
                ),
                Image.asset(
                  'assets/icons/Polygon 2.png',
                  color: AppColors.primaryColor,
                  height: 10,
                ),
              ],
            ),
          ),
          50.h.heightBox,
          'Your Bmi is'.text.color(AppColors.black).bold.size(53.sp).make(),
          50.h.heightBox,
          Center(
            child: '${bmi.getBMI()} '
                .richText
                .withTextSpanChildren([
                  "BPM".textSpan.color(AppColors.black).size(64.sp).make()
                ])
                .black
                .size(144.sp)
                .color(AppColors.primaryColor)
                .maxLines(1)
                .bold
                .fontFamily('AeroRegularSWFTE')
                .make(),
          ),
          10.heightBox,
          Center(
            child: 'Which is ${bmi.getResult()}'
                .text
                .black
                .color(
                    bmi.getResult() == "Normal" ? Colors.green : Colors.red)
                .size(60.sp)
                .maxLines(1)
                .fontFamily('AeroRegularSWFTE')
                .make(),
          ),
        ],
      ).px(110.w),
    );
  }
}
