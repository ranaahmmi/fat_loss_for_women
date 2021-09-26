import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/plugins/Ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class DietDetailPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  const DietDetailPage({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  _DietDetailPageState createState() => _DietDetailPageState();
}

class _DietDetailPageState extends State<DietDetailPage> {
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
              Image.asset(
                "assets/icons/back_arrow.png",
                height: 56.54.h,
                width: 76.98.w,
              ).onTap(() {
                context.pop();
              }).pOnly(left: 103.w),
              132.h.heightBox,
              Text(widget.title,
                  style: TextStyle(
                    fontSize: 68.sp,
                    fontWeight: FontWeight.bold,
                  )).pOnly(left: 103.w),
              77.h.heightBox,
              if (isAdShow) NativeAdBanner(),
              50.h.heightBox,
              Image.asset(
                widget.imageUrl,
                //height: 2012.h,
                width: double.infinity,
              ).px(103.w),
              200.h.heightBox
            ]),
      ),
    ));
  }
}
