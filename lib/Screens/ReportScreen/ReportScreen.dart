import 'dart:math';
import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Screens/PlanScreen/PlanWeeksScreen.dart';
import 'package:fat_loss_for_women/Screens/Utilities/BMIChart/BmiPage.dart';
import 'package:fat_loss_for_women/Screens/Utilities/WaterIntak/waterHeader.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ChartData.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
    with SingleTickerProviderStateMixin {
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

  bool weightStatus = false;
  bool heightStatus = false;
  bool ttsVoice = false;
  final List<SalesData> chartData = [
    SalesData(DateTime.now(), 0),
    SalesData(DateTime.now().add(Duration(days: 1)), 10),
    SalesData(DateTime.now().add(Duration(days: 2)), 15),
    SalesData(DateTime.now().add(Duration(days: 3)), 20),
    SalesData(DateTime.now().add(Duration(days: 4)), 30)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        WaterHeader(
          isAdshow: isAdShow,
        ).px(5),
        74.h.heightBox,
        'My Dashboard'
            .text
            .size(102.sp)
            .extraBold
            .color(AppColors.black)
            .make()
            .px(50.w),
        150.h.heightBox,
        Consumer(
          builder: (context, watch, child) {
            final planListFuture = watch(getPlanList);
            final planinit = watch(planinitList).data?.value ?? [];

            return planListFuture.when(
                data: (value) {
                  final List<Widget> titles = [];
                  value.forEach((element) {
                    if (planinit.contains(element.id)) {
                      titles.add(element.planTitle!.text
                          .size(64.sp)
                          .extraBold
                          .color(AppColors.primaryColor)
                          .make()
                          .py(20.h)
                          .onTap(() {
                        context.nextPage(PlanWeeksScreen(workoutPlan: element));
                      }));
                    }
                  });
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          'Plan in progress:'
                              .text
                              .size(46.sp)
                              .color(AppColors.TextColorLight)
                              .make(),
                          Image.asset(
                            'assets/icons/premium_proceed_arrow.png',
                            color: AppColors.primaryColor,
                            height: 40.h,
                          ),
                        ],
                      ),
                      58.h.heightBox,
                      ...titles,
                      134.h.heightBox,
                    ],
                  );
                },
                loading: loading,
                error: error);
          },
        ),
        Consumer(builder: (context, watch, child) {
          final dayprogressStream = watch(dayProgressStream);
          return dayprogressStream.when(
              data: (value) {
                int i = 0;
                for (var item in value) {
                  if (item.planProgress == 100.0) {
                    i++;
                  }
                }
                return Container(
                    height: 380.h,
                    width: context.screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'WORKOUT'
                                .text
                                .size(42.sp)
                                .color(AppColors.TextColorLight)
                                .make(),
                            i
                                .toString()
                                .text
                                .size(16.sp)
                                .semiBold
                                .color(AppColors.black)
                                .make(),
                          ],
                        ),
                        Container(
                          height: double.infinity,
                          width: 1.h,
                          color: Colors.black26,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'KCL'
                                .text
                                .size(42.sp)
                                .color(AppColors.TextColorLight)
                                .make(),
                            (i * 228)
                                .toString()
                                .text
                                .size(16.sp)
                                .semiBold
                                .color(AppColors.black)
                                .make(),
                          ],
                        ),
                        Container(
                          height: double.infinity,
                          width: 1.h,
                          color: Colors.black26,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'DURATION'
                                .text
                                .size(42.sp)
                                .color(AppColors.TextColorLight)
                                .make(),
                            "${i * 15} min"
                                .text
                                .size(16.sp)
                                .semiBold
                                .color(AppColors.black)
                                .make(),
                          ],
                        ),
                      ],
                    ).pSymmetric(v: 60.h, h: 30.w));
              },
              loading: () => CircularProgressIndicator(),
              error: (e, st) => Text('Error: $e'));
        }),
        130.h.heightBox,
        if (isAdShow) NativeAdsFull(),
        90.h.heightBox,
        Row(
          children: [
            Image.asset(
              'assets/icons/arm_icon.png',
              height: 80.h,
              color: AppColors.primaryColor,
            ),
            40.w.widthBox,
            'Progress Via Chart'.text.semiBold.black.size(56.sp).make(),
          ],
        ),
        120.h.heightBox,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 576.h,
            width: 1074,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: BarChartSample1().px(10),
          ),
        ),
        Divider(),
        162.h.heightBox,
        Row(
          children: [
            Image.asset(
              'assets/icons/calculator_calories.png',
              height: 80.h,
              color: AppColors.primaryColor,
            ),
            40.w.widthBox,
            'Calories Chart'.text.semiBold.black.size(56.sp).make(),
          ],
        ),
        160.h.heightBox,
        Container(
          height: 717.h,
          child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: DateTimeAxis(
                majorGridLines: MajorGridLines(width: 0),
                axisLine: AxisLine(width: 0),
              ),
              borderWidth: 0,
              isTransposed: false,
              backgroundColor: AppColors.white,
              borderColor: AppColors.white,
              series: <ChartSeries>[
                LineSeries<SalesData, DateTime>(
                    color: AppColors.primaryColor,
                    animationDuration: 1500,
                    dataSource: chartData,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales)
              ]),
        ),
        140.h.heightBox,
        if (isAdShow) NativeAdsFull(),
        150.h.heightBox,
        Row(
          children: [
            Image.asset(
              'assets/icons/calculator_bmi.png',
              height: 80.h,
              color: AppColors.primaryColor,
            ),
            40.w.widthBox,
            'BMI (kg/m\u00B2 )'.text.semiBold.black.size(56.sp).make(),
          ],
        ),
        160.h.heightBox,
        Consumer(builder: (context, watch, child) {
          final userStreams = watch(userStream);
          return userStreams.when(
              data: (user) {
                final String bmi = getBMI(double.parse(user.weight!).toInt(),
                    double.parse(user.height!).toInt());

                return Container(
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Container(
                            width: 300,
                            height: 20,
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 400 * (double.parse(bmi) / 100),
                                    child:
                                        bmi.toString().text.bold.make().w(30)),
                              ],
                            )),
                      ),
                      Center(
                        child: Container(
                          height: 20,
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 0.1),
                            gradient: LinearGradient(colors: [
                              Colors.blue,
                              Colors.green,
                              Colors.orange,
                              Colors.red
                            ], stops: [
                              0.2,
                              0.35,
                              0.45,
                              0.7
                            ]),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 480 * (double.parse(bmi) / 100),
                                child: Container(
                                  height: 20,
                                  width: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          VxBox()
                              .color(getResultColor(double.parse(bmi)))
                              .roundedFull
                              .size(25, 25)
                              .make(),
                          10.widthBox,
                          getResult(double.parse(bmi))
                              .text
                              .black
                              .wide
                              .semiBold
                              .make(),
                        ],
                      )
                    ],
                  ).onTap(() {
                    Navigator.push(context,
                        SlideRightRoute(page: BmiMeterPage(user: user)));
                  }).pSymmetric(v: 10, h: 10),
                );
              },
              loading: () => CircularProgressIndicator(),
              error: (e, st) => Text('Error: $e'));
        }),
        160.h.heightBox,
      ],
    ).px(109.w);
  }

  String getResult(double bmi) {
    if (bmi > 30)
      return 'Obesity';
    else if (bmi > 25)
      return 'Overweight';
    else if (bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getBMI(int weight, int height) {
    final bmis = weight / pow(height / 100, 2);
    return bmis.toStringAsFixed(1);
  }

  Color getResultColor(double bmi) {
    if (bmi > 30)
      return Colors.red;
    else if (bmi > 25)
      return Colors.orange;
    else if (bmi > 18.5)
      return Colors.green;
    else
      return Colors.blue;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
