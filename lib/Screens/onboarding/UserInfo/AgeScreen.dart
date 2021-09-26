import 'package:fat_loss_for_women/Screens/onboarding/UserInfo/HeightScreen.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';

class AgeScreen extends StatefulWidget {
  final User user;
  const AgeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);
  @override
  AgeScreenState createState() => new AgeScreenState();
}

class AgeScreenState extends State<AgeScreen> {
  TextEditingController _age = TextEditingController();
  @override
  void dispose() {
    _age.dispose();
    super.dispose();
  }

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
          'Your Age? '
              .text
              .color(AppColors.black)
              .extraBold
              .size(102.sp)
              .make(),
          64.h.heightBox,
          'To give you a customize experience we need to know your age.'
              .text
              .color(AppColors.TextColorLight)
              .size(50.sp)
              .make()
              .w(921.w),
          Spacer(),
          TextFormField(
            autofocus: true,
            maxLines: 1,
            maxLength: 2,
            controller: _age,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 55.sp, height: 1.4),
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              counterText: '',
              counterStyle: TextStyle(fontSize: 0),
              hintText: 'Enter your Age',
              filled: true,
              fillColor: Colors.white,
              errorStyle: TextStyle(
                fontSize: 30.sp,
                height: 0.4,
              ),
              focusColor: AppColors.primaryColor,
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(5.0)),
                borderSide:
                    const BorderSide(color: AppColors.primaryColor, width: 1.0),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 66.h, horizontal: 74.w),
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              )),
            ),
            validator: ((value) =>
                value!.isEmpty ? "Username is required" : null),
          ).h(199.h),
          Spacer(
            flex: 5,
          ),
          CustomButton(
              onpressed: () {
                if (_age.text == '') {
                  context.showToast(
                      msg: 'Age is required',
                      bgColor: AppColors.primaryColor,
                      textColor: Colors.white,
                      textSize: 48.sp,
                      position: VxToastPosition.center);
                } else {
                  Navigator.of(context).push(SlideRightRoute(
                      page: HeightScreen(
                    user: widget.user.copyWith(age: int.parse(_age.text)),
                  )));
                }
              },
              title: 'Continue'),
          136.h.heightBox,
        ],
      ).px(112.w),
    );
  }
}
