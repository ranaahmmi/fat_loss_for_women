import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Screens/ProScreen/ProScreen.dart';
import 'package:fat_loss_for_women/Screens/Utilities/WaterIntak/WaterIntakScreen.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterHeader extends ConsumerWidget {
  final bool isAdshow;
  const WaterHeader({
    Key? key,
    required this.isAdshow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final waterdata = watch(waterIntakeStream);
    return waterdata.when(
        data: (water) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              40.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/drawer_icon.png',
                    height: 45.h,
                  ),
                  Row(
                    children: [
                      if (isAdshow)
                        Center(
                                child: Lottie.asset(
                                    'assets/Animation/premium.json',
                                    height: 198.h))
                            .onTap(() {
                          Navigator.push(
                              context, SlideRightRoute(page: ProScreen()));
                        }),
                      80.w.widthBox,
                      Stack(alignment: Alignment(0, 0), children: [
                        CircularProgressIndicator(
                          value: water.drinkGlass! / water.totalGlass!,
                          color: Vx.blue300,
                          backgroundColor:
                              AppColors.TextColorLight.withOpacity(0.1),
                        ).wh(150.h, 150.h),
                        Image.asset(
                          'assets/icons/glass.png',
                          height: 110.h,
                        ),
                        Positioned(
                          top: 0,
                          right: 0.w,
                          child: water.drinkGlass
                              .toString()
                              .text
                              .bold
                              .white
                              .sm
                              .makeCentered()
                              .p(5.5)
                              .box
                              .roundedFull
                              .blue300
                              .make(),
                        )
                      ]).wh(200.h, 200.h).onTap(() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        bool _seen = (prefs.getBool('HOME_SEEN') ?? false);
                        if (!_seen) {
                          WaterInTake water = await context
                              .read(waterIntakeDao)
                              .getWaterIntakefuture();
                          await WaterintakeSheet().showWaterSettingSheet(
                              context,
                              water,
                              await context.read(userDao).getUserfuture());
                          await prefs.setBool('HOME_SEEN', true);
                          context.nextPage(WaterIntakScreen());
                        } else {
                          context.nextPage(WaterIntakScreen());
                        }
                      }),
                    ],
                  ),
                ],
              )
            ],
          );
        },
        loading: loading,
        error: error);
  }
}
