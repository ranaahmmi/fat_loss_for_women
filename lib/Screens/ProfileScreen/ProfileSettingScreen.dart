import 'dart:io';

import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Screens/Utilities/ProtienCalculator/Protien_Calculator.dart';
import 'package:fat_loss_for_women/Shared/Aleartbox.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Shared/GetPic.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:riverpod/riverpod.dart';

class ProfileSetting extends StatefulWidget {
  final User user;
  const ProfileSetting({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  TextEditingController nameController = TextEditingController();

  int age = 23;
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  bool isloading = false;
  bool isUsUnit = true;

  File? img;

  @override
  void dispose() {
    nameController.dispose();
    height.dispose();
    weight.dispose();
    super.dispose();
  }

  @override
  void initState() {
    age = widget.user.age;
    nameController.text = widget.user.name!;
    weight.text = widget.user.weight!;
    height.text = widget.user.height!;

    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isloading,
      color: AppColors.black,
      progressIndicator: loading(),
      child: Scaffold(
        body: ListView(
          children: [
            108.h.heightBox,
            Container(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                "assets/icons/back_arrow.png",
                height: 56.54.h,
                width: 76.98.w,
              ).onTap(() {
                context.pop();
              }),
            ),
            132.h.heightBox,
            "Edit Profile".text.size(72.sp).bold.color(AppColors.black).make(),
            82.h.heightBox,
            Center(
              child: Container(
                height: 551.w,
                width: 551.w,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 551.w,
                        width: 551.w,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primaryColor, width: 3),
                            shape: BoxShape.circle),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9999),
                              color: Colors.black,
                              image: DecorationImage(
                                  image: (img != null)
                                      ? FileImage(img!)
                                      : AssetImage(
                                              "assets/icons/emptyProfile.jpeg")
                                          as ImageProvider,
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30.h,
                      right: 20.w,
                      child: Image.asset(
                        'assets/icons/edit.png',
                        color: AppColors.white,
                        height: 50.h,
                      )
                          .p(38.h)
                          .box
                          .color(AppColors.primaryColor)
                          .roundedFull
                          .make()
                          .onTap(() async {
                        img = await SetProfilePic().getFromGallery();
                        getImage();
                        setState(() {});
                      }),
                    )
                  ],
                ),
              ),
            ),
            135.h.heightBox,
            if (isloading)
              loading()
            else
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    autofocus: false,
                    maxLines: 1,
                    maxLength: 20,
                    controller: nameController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 64.sp,
                        height: 1.4,
                        fontWeight: FontWeight.bold),
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
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
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(5.0)),
                        borderSide: const BorderSide(
                            color: AppColors.primaryColor, width: 1.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 66.h, horizontal: 74.w),
                    ),
                    validator: ((value) =>
                        value!.isEmpty ? "Username is required" : null),
                  ).h(199.h),
                  157.h.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'Us Units'
                          .text
                          .color(isUsUnit
                              ? AppColors.white
                              : AppColors.primaryColor)
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
                          .color(!isUsUnit
                              ? AppColors.white
                              : AppColors.primaryColor)
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
                    value: age.toString(),
                    function: () async {
                      final val = await Alertbox().numberDailog(
                          context: context,
                          value: age,
                          title: 'Your Age',
                          maxvalue: 80,
                          minvalue: 12);
                      age = val;
                      setState(() {});
                    },
                  ),
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
                  200.h.heightBox,
                ],
              ),
            CustomButton(
                onpressed: () async {
                  isloading = true;
                  setState(() {});

                  final dao = ProviderContainer().read(userDao);
                  await dao.insertUser(widget.user.copyWith(
                      name: nameController.text,
                      weight: weight.text,
                      height: height.text,
                      age: age));
                  isloading = false;
                  setState(() {});
                  context.pop();
                },
                title: "Update Data")
          ],
        ).px(108.w),
      ),
    );
  }

  getImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imagpath = prefs.getString('profile');
    if (imagpath != null) img = File(imagpath);
    setState(() {});
  }
}
