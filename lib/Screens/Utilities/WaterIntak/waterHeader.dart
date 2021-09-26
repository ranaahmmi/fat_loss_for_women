import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Screens/Utilities/WaterIntak/WaterIntakScreen.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterHeader extends ConsumerWidget {
  const WaterHeader({
    Key? key,
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
              140.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/drawer_icon.png',
                    height: 45.h,
                  ),
                  Stack(alignment: Alignment(0, 0), children: [
                    CircularProgressIndicator(
                      value: water.drinkGlass! / water.totalGlass!,
                      color: AppColors.blue,
                      backgroundColor:
                          AppColors.TextColorLight.withOpacity(0.1),
                    ).wh(150.h, 150.h),
                    Image.asset(
                      'assets/icons/waterBottle.png',
                      height: 88.h,
                    ),
                  ]),
                ],
              ).onTap(() async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                bool _seen = (prefs.getBool('HOME_SEEN') ?? false);
                if (!_seen) {
                  WaterInTake water =
                      await context.read(waterIntakeDao).getWaterIntakefuture();
                  await WaterintakeSheet().showWaterSettingSheet(context, water,
                      await context.read(userDao).getUserfuture());
                  await prefs.setBool('HOME_SEEN', true);
                  context.nextPage(WaterIntakScreen());
                } else {
                  context.nextPage(WaterIntakScreen());
                }
              }),
            ],
          );
        },
        loading: loading,
        error: error);
  }
}
