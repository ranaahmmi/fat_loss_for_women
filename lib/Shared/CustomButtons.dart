import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fat_loss_for_women/Style/Colors.dart';

class CustomChildButton extends StatelessWidget {
  final VoidCallback onpressed;

  final Color color;

  final double elevation;

  final double height;
  final Color shadowColor;
  final double width;
  final Widget child;

  const CustomChildButton({
    Key? key,
    required this.onpressed,
    this.color = AppColors.primaryColor,
    this.elevation = 0,
    this.height = 203,
    this.shadowColor = AppColors.primaryColor,
    this.width = 1216,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: elevation,
              animationDuration: Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              primary: color,
              shadowColor: shadowColor),
          onPressed: onpressed,
          child: child),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String title;
  final Color color;
  final Color textcolor;
  final double fontsize;
  final double elevation;
  final bool isBoldtitle;
  final double height;
  final Color shadowColor;
  final double width;

  const CustomButton({
    Key? key,
    required this.onpressed,
    required this.title,
    this.color = Colors.transparent,
    this.textcolor = AppColors.white,
    this.fontsize = 14.0,
    this.elevation = 0,
    this.isBoldtitle = true,
    this.height = 203,
    this.shadowColor = AppColors.primaryColor,
    this.width = 1216,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
          gradient:
              color == Colors.transparent ? AppColors.themeGradient : null,
          borderRadius: BorderRadius.circular(99),
          color: color == Colors.transparent ? null : color),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(width, 50)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onpressed,
        child: title.text
            .color(textcolor)
            .fontWeight(isBoldtitle ? FontWeight.bold : FontWeight.normal)
            .size(fontsize.sp)
            .makeCentered(),
      ),
    );
  }
}

class CustomButtonOutline extends StatelessWidget {
  final VoidCallback onpressed;
  final String title;
  final Color color;
  final Color textcolor;
  final double fontsize;
  final double elevation;
  final bool isBoldtitle;
  final double height;
  final double width;

  const CustomButtonOutline({
    Key? key,
    required this.onpressed,
    required this.title,
    this.color = AppColors.primaryColor,
    this.textcolor = AppColors.white,
    this.fontsize = 14.0,
    this.elevation = 0,
    this.isBoldtitle = true,
    this.height = 40,
    this.width = 270,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          animationDuration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          primary: Colors.white,
          side: BorderSide(color: textcolor),
        ),
        onPressed: onpressed,
        child: title.text
            .color(textcolor)
            .fontWeight(isBoldtitle ? FontWeight.bold : FontWeight.normal)
            .size(fontsize.sp)
            .makeCentered(),
      ),
    );
  }
}

class CalculatorLineWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const CalculatorLineWidget({
    Key? key,
    required this.title,
    required this.controller,
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
        Expanded(
          child: TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 58.sp,
              height: 1.3,
            ),
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(2, 3, 3, 0),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
