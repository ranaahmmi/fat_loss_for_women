import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Shared/Aleartbox.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fat_loss_for_women/Screens/Utilities/ProtienCalculator/Protien_Intake_Chart.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';

class ProtienCalculator extends StatefulWidget {
  final User user;
  const ProtienCalculator({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ProtienCalculatorState createState() => _ProtienCalculatorState();
}

class _ProtienCalculatorState extends State<ProtienCalculator> {
  int radioItem = 1;
  bool isUsUnit = true;
  double protine = 2072.2;

  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            108.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/icons/back_arrow.png',
                  height: 56.54.h,
                  width: 76.98.w,
                ).p(5).onInkTap(() {
                  context.pop();
                }),
                Image.asset(
                  'assets/icons/info_icon.png',
                  height: 142.h,
                  width: 142.w,
                ).onInkTap(() {
                  FirebaseAnalytics().logEvent(
                    name: 'Protein_Chart_View',
                  );
                  context.nextPage(ProtienIntakeChart());
                })
              ],
            ),
            127.h.heightBox,
            Text(
              "Calories Calculator",
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
            LineWidget(
                title: 'Your Age',
                value: age.text,
                function: () async {
                  final val = await Alertbox().numberDailog(
                      context: context,
                      value: int.parse(age.text),
                      title: 'Your Age',
                      maxvalue: 80,
                      minvalue: 12);
                  age.text = val.toString();
                  setState(() {});
                }),
            120.h.heightBox,
            LineWidget(
              title: 'Weight',
              value: isUsUnit
                  ? '${weight.text} kg'
                  : '${(double.parse(weight.text) * 2.20462).toStringAsFixed(2)} lbs',
              function: () async {
                final val = await Alertbox().weightDailog(
                  context: context,
                  value: int.parse(weight.text),
                  isUsUnit: isUsUnit,
                );
                weight.text = val.toString();
                setState(() {});
              },
            ),
            120.h.heightBox,
            LineWidget(
              title: 'Height',
              value: isUsUnit
                  ? '${((double.parse(height.text) ~/ 2.54) ~/ 12).toInt()}-${((double.parse(height.text) ~/ 2.54) % 12).toInt()} ft-in'
                  : '${height.text} cm',
              function: () async {
                final val = await Alertbox().heightDailog(
                  context: context,
                  value: double.parse(height.text).toInt(),
                  isUsUnit: isUsUnit,
                );
                height.text = val.toString();
                setState(() {});
              },
            ),
            159.h.heightBox,
            Text(
              "Select your workout intensity",
              style: TextStyle(fontSize: 53.sp, fontWeight: FontWeight.bold),
            ),
            39.h.heightBox,
            RadioListTile(
              groupValue: radioItem,
              title: 'Lightly Active (workout 1-3 times/ week)'
                  .text
                  .fontWeight(
                      radioItem == 1 ? FontWeight.bold : FontWeight.normal)
                  .color(radioItem == 1
                      ? AppColors.black
                      : AppColors.TextColorLight)
                  .size(54.sp)
                  .make(),
              value: 1,
              selectedTileColor: AppColors.backColor,
              activeColor: AppColors.primaryColor,
              onChanged: (val) {
                setState(() {
                  radioItem = val as int;
                });
              },
            ),
            29.h.heightBox,
            RadioListTile(
              groupValue: radioItem,
              title: 'Moderately Active (workout 3-5 times/ week)'
                  .text
                  .fontWeight(
                      radioItem == 2 ? FontWeight.bold : FontWeight.normal)
                  .color(radioItem == 2
                      ? AppColors.black
                      : AppColors.TextColorLight)
                  .size(54.sp)
                  .make(),
              value: 2,
              selectedTileColor: AppColors.backColor,
              activeColor: AppColors.primaryColor,
              onChanged: (val) {
                setState(() {
                  radioItem = val as int;
                });
              },
            ),
            29.h.heightBox,
            RadioListTile(
              groupValue: radioItem,
              title: 'Very Active (workout 6-7 times/ week)'
                  .text
                  .fontWeight(
                      radioItem == 3 ? FontWeight.bold : FontWeight.normal)
                  .color(radioItem == 3
                      ? AppColors.black
                      : AppColors.TextColorLight)
                  .size(54.sp)
                  .make(),
              value: 3,
              selectedTileColor: AppColors.backColor,
              activeColor: AppColors.primaryColor,
              onChanged: (val) {
                setState(() {
                  radioItem = val as int;
                });
              },
            ),
            29.h.heightBox,
            RadioListTile(
              groupValue: radioItem,
              title: 'Extra Active (workout or physical job)'
                  .text
                  .fontWeight(
                      radioItem == 4 ? FontWeight.bold : FontWeight.normal)
                  .color(radioItem == 4
                      ? AppColors.black
                      : AppColors.TextColorLight)
                  .size(54.sp)
                  .make(),
              value: 4,
              selectedTileColor: AppColors.backColor,
              activeColor: AppColors.primaryColor,
              onChanged: (val) {
                setState(() {
                  radioItem = val as int;
                });
              },
            ),
            104.h.heightBox,
            CustomButton(
                onpressed: () {
                  final interstitial = context.read(interstitialAdProvider);
                  final bool isAdShow =
                      context.read(purchasedProvider).data?.value ?? false;
                  if (isAdShow) {
                    if (!interstitial.isAvailable) {
                      interstitial.load();
                    } else {
                      interstitial.show();
                    }
                  }

                  double rawProtine = 66.5 +
                      (13.75 * double.parse(weight.text)) +
                      (5.003 * double.parse(height.text)) -
                      (6.755 * int.parse(age.text));
                  if (radioItem == 1) {
                    protine = rawProtine * 1.2;
                  } else if (radioItem == 2) {
                    protine = rawProtine * 1.375;
                  } else if (radioItem == 3) {
                    protine = rawProtine * 1.55;
                  } else {
                    protine = rawProtine * 1.725;
                  }
                  FirebaseAnalytics().logEvent(
                    name: 'Calories_Calculator',
                  );
                  setState(() {});
                },
                title: 'Calculate'),
            124.h.heightBox,
            Text(
              "Required Calories is",
              style: TextStyle(fontSize: 53.sp, fontWeight: FontWeight.bold),
            ),
            124.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  protine.toStringAsFixed(2),
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 144.sp,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Text(
                    "grams",
                    style:
                        TextStyle(fontSize: 64.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            200.h.heightBox,
          ],
        ).px(109.w),
      )),
    );
  }
}

class LineWidget extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback function;
  const LineWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 53.sp, color: AppColors.TextColorLight),
        ).pOnly(right: 10.w),
        Expanded(
          flex: 1,
          child: Text(''),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 1.h,
            color: AppColors.TextColorLight,
          ),
        ),
        Spacer(),
        FittedBox(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                value
                    .toString()
                    .text
                    .bold
                    .size(58.sp)
                    .color(AppColors.black)
                    .make(),
                32.w.widthBox,
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.TextColorLight,
                  size: 70.w,
                )
              ],
            ).onInkTap(function)),
      ],
    );
  }
}
