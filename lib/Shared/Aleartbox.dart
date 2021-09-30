import 'package:dio/dio.dart';
import 'package:fat_loss_for_women/plugins/HorizontalPicker.dart';
import 'package:flutter/material.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:lottie/lottie.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CustomButtons.dart';

class Alertbox {
  alertBox(
    String title,
    discription,
    Function onPressrd,
  ) {
    return AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        20.heightBox,
        Text(
          discription,
        ),
        20.heightBox,
        RoundButton(
          function: onPressrd,
          title: 'Back',
        )
      ],
    ));
  }

  showResetPlanDailog({
    required BuildContext context,
    required VoidCallback function,
  }) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 200.h,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  width: context.screenWidth,
                  color: AppColors.red,
                  child: Icon(
                    Icons.error_outline,
                    size: 50,
                    color: AppColors.white,
                  ),
                )),
                Expanded(
                    child: Container(
                  color: AppColors.black,
                  child: SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Confirm Reset?",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.white),
                        ),
                        Text(
                          "Do you really want to reset this plan! ",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No")),
                            ElevatedButton(
                                onPressed: function, child: Text("Yes")),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (context, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  showDialogBottomAnimation({
    required BuildContext context,
    required String title,
    String description = '',
    required String buttonTitle,
    Function? function,
  }) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              width: context.screenWidth * 0.8,
              height: 250,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      3.heightBox,
                      Divider().px(80)
                    ],
                  ),
                  20.heightBox,
                  Text(
                    description,
                  ),
                  20.heightBox,
                  RoundButton(
                    function: function,
                    title: buttonTitle,
                  )
                ],
              ).py(10),
            ));
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  bottomAnimationDailog({
    required BuildContext context,
    required Widget child,
  }) async {
    await showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
            alignment: Alignment.center,
            child: Material(
              child: child,
            ));
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  showAdFreeDailog({
    required BuildContext context,
  }) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              width: context.screenWidth * 0.8,
              height: 270,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Ad Free App',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      3.heightBox,
                      Divider().px(80)
                    ],
                  ),
                  Image.asset(
                    'assets/images/noads.png',
                    height: 90,
                  ),
                  'Make Planet Gym & Fitness AD Free'.text.extraBlack.make(),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      'Never show'
                          .text
                          .extraBlack
                          .white
                          .makeCentered()
                          .box
                          .size(100, 35)
                          .color(AppColors.primaryColor)
                          .withRounded(value: 10)
                          .make()
                          .onTap(() {
                        Navigator.pop(context);
                      }),
                      'Later'
                          .text
                          .extraBlack
                          .white
                          .makeCentered()
                          .box
                          .size(100, 35)
                          .color(AppColors.primaryColor)
                          .withRounded(value: 10)
                          .make()
                          .onTap(() {
                        Navigator.pop(context);
                      }),
                      'Buy'
                          .text
                          .extraBlack
                          .white
                          .makeCentered()
                          .box
                          .size(100, 35)
                          .color(AppColors.primaryColor)
                          .withRounded(value: 10)
                          .make()
                          .onTap(() {
                        Navigator.pop(context);
                      }),
                    ],
                  )
                ],
              ).py(10),
            ));
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  Future<int> numberDailog(
      {required BuildContext context,
      required int value,
      required int maxvalue,
      required int minvalue,
      required String title}) async {
    int newvalue = value;
    await Alertbox().bottomAnimationDailog(
      context: context,
      child: StatefulBuilder(
        builder: (BuildContext context, reload) {
          return Container(
            height: 1200.h,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                title.text.bold.size(108.sp).color(AppColors.black).make(),
                Spacer(),
                NumberPicker(
                  selectedTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 33,
                      fontWeight: FontWeight.bold),
                  value: newvalue,
                  minValue: minvalue,
                  itemCount: 5,
                  maxValue: maxvalue,
                  step: 1,
                  itemWidth: 250.w,
                  axis: Axis.horizontal,
                  onChanged: (value) => reload(() => newvalue = value),
                ),
                Spacer(),
                CustomButton(
                        onpressed: () {
                          Navigator.pop(context, newvalue);
                        },
                        title: 'Set')
                    .w(600.w)
              ],
            ).py(60.h),
          );
        },
      ),
    );
    return newvalue;
  }

  Future<int> weightDailog({
    required BuildContext context,
    required int value,
    required bool isUsUnit,
  }) async {
    int newvalue = value;
    await Alertbox().bottomAnimationDailog(
      context: context,
      child: StatefulBuilder(
        builder: (BuildContext context, reload) {
          return Container(
            height: 1200.h,
            width: context.screenWidth * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                'Your Weight'
                    .text
                    .bold
                    .size(108.sp)
                    .color(AppColors.black)
                    .make(),
                Spacer(),
                if (!isUsUnit)
                  Center(
                    child: '${(newvalue * 2.20462).toStringAsFixed(2)}'
                        .richText
                        .withTextSpanChildren([
                          " lbs ".textSpan.color(AppColors.primaryColor).make()
                        ])
                        .black
                        .size(103.sp)
                        .maxLines(1)
                        .fontFamily('AeroRegularSWFTE')
                        .make(),
                  ),
                50.h.heightBox,
                NumberPicker(
                  selectedTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 33,
                      fontWeight: FontWeight.bold),
                  value: newvalue,
                  minValue: 35,
                  maxValue: 200,
                  itemCount: 5,
                  itemWidth: 250.w,
                  step: 1,
                  axis: Axis.horizontal,
                  onChanged: (value) => reload(() => newvalue = value),
                ),
                Spacer(),
                CustomButton(
                        onpressed: () {
                          context.pop(newvalue);
                        },
                        title: 'Set')
                    .w(600.w)
              ],
            ).py(60.h),
          );
        },
      ),
    );
    return newvalue;
  }

  Future<int> heightDailog({
    required BuildContext context,
    required int value,
    required bool isUsUnit,
  }) async {
    int newvalue = value;
    await Alertbox().bottomAnimationDailog(
      context: context,
      child: StatefulBuilder(
        builder: (BuildContext context, reload) {
          return Container(
            height: 1600.h,
            width: context.screenWidth * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                'Your Height'
                    .text
                    .bold
                    .size(108.sp)
                    .color(AppColors.black)
                    .make(),
                Spacer(),
                if (isUsUnit)
                  Center(
                    child:
                        '${((newvalue ~/ 2.54) ~/ 12).toInt()}-${((newvalue ~/ 2.54) % 12).toInt()}'
                            .richText
                            .withTextSpanChildren([
                              " ft-in"
                                  .textSpan
                                  .color(AppColors.primaryColor)
                                  .make()
                            ])
                            .black
                            .size(103.sp)
                            .maxLines(1)
                            .fontFamily('AeroRegularSWFTE')
                            .make(),
                  ),
                150.h.heightBox,
                Container(
                  child: HorizontalPicker(
                    header: 'Cm',
                    initialPosition: value,
                    minValue: 130,
                    showNumber: true,
                    maxValue: 210,
                    showCursor: false,
                    backgroundColor: Colors.transparent,
                    activeItemTextColor: AppColors.black,
                    passiveItemsTextColor: AppColors.TextColorLight,
                    onChanged: (value) {
                      newvalue = value.toInt();
                      reload(() {});
                    },
                  ),
                ).px(60.w),
                Spacer(),
                CustomButton(
                        onpressed: () {
                          context.pop(newvalue);
                        },
                        title: 'Set')
                    .w(600.w)
              ],
            ).py(60.h),
          );
        },
      ),
    );
    return newvalue;
  }

  resetProgress(BuildContext context, VoidCallback function) async {
    return await showSlidingBottomSheet(context, builder: (context) {
      return SlidingSheetDialog(
        color: Colors.white,
        backdropColor: AppColors.cardColor.withOpacity(0.4),
        elevation: 8,
        cornerRadius: 0,
        snapSpec: const SnapSpec(
          snappings: [0.9, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return Container(
            height: 1110.h,
            child: Material(
              child: Container(
                child: Container(
                  color: AppColors.white,
                  child: SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.close,
                            size: 70.h,
                            color: AppColors.TextColorLight,
                          ),
                        ).onTap(() {
                          context.pop();
                        }).px(91.w),
                        Text(
                          "Reset Progress!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 68.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Lottie.asset('assets/Animation/warning_reset.json',
                            height: 250.h),
                        Text(
                          "Are you sure you want to reset all your current\nprogress?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.TextColorLight,
                              fontSize: 46.sp,
                              fontWeight: FontWeight.normal),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                                width: 590,
                                onpressed: () {
                                  Navigator.pop(context);
                                },
                                title: "No"),
                            CustomButton(
                                color: AppColors.greyDim,
                                width: 590,
                                onpressed: function,
                                title: 'Yes'),
                          ],
                        )
                      ],
                    ).py(50.h),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });

    // This is the result.
  }

  showCustomDialogBottomAnimation({required BuildContext context}) {
    return showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Material(
          color: Colors.transparent,
          child: Align(
              alignment: Alignment.center,
              child: Center(
                child: Container(
                  height: 200,
                  width: context.screenWidth * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      30.h.heightBox,
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.close,
                          size: 70.h,
                          color: AppColors.TextColorLight,
                        ),
                      ).px(30.w).onTap(() {
                        context.pop();
                      }),
                      Spacer(),
                      'Do you really want to exit'.text.xl2.black.make(),
                      Spacer(
                        flex: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                              width: 500,
                              height: 155,
                              title: 'NO',
                              onpressed: () => Navigator.pop(context, false)),
                          20.widthBox,
                          CustomButton(
                              width: 500,
                              height: 155,
                              color: AppColors.greyDim,
                              title: 'Yes',
                              onpressed: () {
                                Navigator.pop(context, true);
                              }),
                        ],
                      )
                    ],
                  ).p(10),
                ),
              )),
        );
      },
      transitionBuilder: (context, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}

class RoundButton extends StatelessWidget {
  final Function? function;
  final String title;
  final Color? color;
  final double? height, width;

  const RoundButton(
      {Key? key,
      this.function,
      required this.title,
      this.color,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function as void Function()?,
      child: Container(
        width: width == null ? context.screenWidth * 0.7 : width,
        height: height == null ? 50 : height,
        decoration: BoxDecoration(
            color: color == null ? AppColors.primaryColor : color,
            borderRadius: BorderRadius.circular(10)),
        child: title.text.white.bold.makeCentered(),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final String icon;
  final Function function;

  const RoundIconButton({required this.icon, required this.function});

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: Image.asset(
      icon,
    ))
        .height(60)
        .width(60)
        .roundedFull
        .color(AppColors.primaryColor.withOpacity(0.8))
        .make()
        .onTap(function as void Function());
  }
}
