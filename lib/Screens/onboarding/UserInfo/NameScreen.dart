import 'package:fat_loss_for_women/Screens/onboarding/UserInfo/AgeScreen.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class NameScreen extends StatefulWidget {
  @override
  NameScreenState createState() => new NameScreenState();
}

class NameScreenState extends State<NameScreen> {
  TextEditingController _username = TextEditingController();
  User user = User(
    id: 1,
    age: 23,
  );

  @override
  void dispose() {
    _username.dispose();
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
          Spacer(),
          'Your Name?'.text.color(AppColors.black).bold.size(102.sp).make(),
          64.h.heightBox,
          'So that we know how to call you.'
              .text
              .color(AppColors.TextColorLight)
              .size(50.sp)
              .make(),
          Spacer(),
          TextFormField(
            autofocus: false,
            maxLines: 1,
            maxLength: 20,
            controller: _username,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: 55.sp, height: 1.4),
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              counterText: '',
              counterStyle: TextStyle(fontSize: 0),
              hintText: 'Enter full name',
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
            flex: 4,
          ),
          CustomButton(
              onpressed: () {
                if (_username.text == '') {
                  context.showToast(
                      msg: 'Name is required',
                      bgColor: AppColors.primaryColor,
                      textColor: Colors.white,
                      textSize: 48.sp,
                      position: VxToastPosition.center);
                } else {
                  Navigator.of(context).push(SlideRightRoute(
                      page: AgeScreen(
                    user: user.copyWith(name: _username.text),
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
