import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BarChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Color barBackgroundColor = const Color(0xFFF1F1F1);
  final Duration animDuration = const Duration(milliseconds: 250);
  late List<BarChartGroupData> barChartData;
  int touchedIndex = -1;
  @override
  void initState() {
    super.initState();
    barChartData = showingGroups();
    getActivitydata();
    setState(() {});
  }

  getActivitydata() async {
    final dao = context.read(planDao);
    final a = await dao.getDayProgressFuture();
    int i = 0;
    a.forEach((element) {
      if (element.planProgress == 100.0) {
        i++;
        barChartData[i - 1] =
            makeGroupData(i - 1, 20, isTouched: i == touchedIndex);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
      swapAnimationDuration: animDuration,
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = AppColors.primaryColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [AppColors.black] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(30, (i) {
      return makeGroupData(i, 0, isTouched: i == touchedIndex);
    });
  }

  BarChartData mainBarData() {
    return BarChartData(
      groupsSpace: 30,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                (groupIndex + 1).toString() + 'Day' + '\n',
                TextStyle(
                  color: AppColors.greyDim,
                  fontWeight: FontWeight.normal,
                  fontSize: 36.sp,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style: TextStyle(
                      color: AppColors.greyDim,
                      fontWeight: FontWeight.normal,
                      fontSize: 36.sp,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! PointerUpEvent &&
                barTouchResponse.touchInput is! PointerExitEvent) {
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(
            color: AppColors.greyDim,
            fontWeight: FontWeight.normal,
            fontSize: 36.sp,
          ),
          margin: 16,
          getTitles: (double value) {
            return 'day ' + (value + 1).toStringAsFixed(0);
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: barChartData,
    );
  }
}
