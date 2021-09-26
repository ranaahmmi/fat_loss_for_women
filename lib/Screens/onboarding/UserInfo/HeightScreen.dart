import 'package:fat_loss_for_women/Screens/onboarding/UserInfo/weightScreen.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/plugins/HorizontalPicker.dart';

class HeightScreen extends StatefulWidget {
  final User user;
  const HeightScreen({
    Key? key,
    required this.user,
  }) : super(key: key);
  @override
  HeightScreenState createState() => new HeightScreenState();
}

class HeightScreenState extends State<HeightScreen> {
  bool iscm = true;
  double cm = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          188.h.heightBox,
          Image.asset(
            'assets/icons/back_arrow.png',
            width: 76.w,
          ).p(5).onInkTap(() {
            context.pop();
          }),
          134.h.heightBox,
          'Your Height?'
              .text
              .color(AppColors.black)
              .extraBold
              .size(102.sp)
              .make(),
          64.h.heightBox,
          'How tall are you?'
              .text
              .color(AppColors.TextColorLight)
              .size(50.sp)
              .make()
              .w(921.w),
          219.h.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              'Height'.text.color(AppColors.black).extraBold.size(53.sp).make(),
              Row(
                children: [
                  'cm'
                      .text
                      .color(iscm ? AppColors.white : AppColors.primaryColor)
                      .size(48.sp)
                      .makeCentered()
                      .box
                      .roundedLg
                      .color(iscm ? AppColors.primaryColor : AppColors.white)
                      .border(
                          color: iscm
                              ? AppColors.white
                              : AppColors.TextColorLight.withOpacity(0.4),
                          width: iscm ? 0 : 1)
                      .size(275.w, 100.h)
                      .make()
                      .onInkTap(() {
                    iscm = true;
                    setState(() {});
                  }),
                  52.w.widthBox,
                  'ft+in'
                      .text
                      .color(!iscm ? AppColors.white : AppColors.primaryColor)
                      .size(48.sp)
                      .makeCentered()
                      .box
                      .roundedLg
                      .color(!iscm ? AppColors.primaryColor : AppColors.white)
                      .border(
                          color: !iscm
                              ? AppColors.white
                              : AppColors.TextColorLight.withOpacity(0.4),
                          width: !iscm ? 0 : 1)
                      .size(275.w, 100.h)
                      .make()
                      .onInkTap(() {
                    iscm = false;
                    setState(() {});
                  }),
                ],
              )
            ],
          ),
          100.h.heightBox,
          if (!iscm)
            Center(
              child:
                  '${((cm ~/ 2.54) ~/ 12).toInt()}-${((cm ~/ 2.54) % 12).toInt()}'
                      .richText
                      .withTextSpanChildren([
                        " ft-in  ".textSpan.color(AppColors.primaryColor).make()
                      ])
                      .black
                      .size(103.sp)
                      .maxLines(1)
                      .fontFamily('AeroRegularSWFTE')
                      .make(),
            ),
          116.h.heightBox,
          Container(
            child: HorizontalPicker(
              header: 'Cm',
              initialPosition: 170,
              minValue: 130,
              showNumber: true,
              maxValue: 210,
              showCursor: false,
              backgroundColor: Colors.transparent,
              activeItemTextColor: AppColors.black,
              passiveItemsTextColor: AppColors.TextColorLight,
              onChanged: (value) {
                cm = value;
                setState(() {});
              },
            ),
          ),
          Spacer(
            flex: 4,
          ),
          CustomButton(
              onpressed: () {
                Navigator.of(context).push(SlideRightRoute(
                    page: WeightScreen(
                  user: widget.user.copyWith(height: cm.toString()),
                )));
              },
              title: 'Continue'),
          136.h.heightBox,
        ],
      ).px(112.w),
    );
  }
}
