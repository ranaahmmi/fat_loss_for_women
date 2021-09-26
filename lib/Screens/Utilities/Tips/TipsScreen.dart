// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
// import 'package:fat_loss_for_women/Repository/DaiyTipsRepo.dart';
// import 'package:fat_loss_for_women/Screens/Utilities/WaterIntak/WaterIntakScreen.dart';
// import 'package:fat_loss_for_women/Shared/Constants.dart';
// import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
// import 'package:fat_loss_for_women/Style/Colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:loading_overlay/loading_overlay.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'TipsDetailScreen.dart';

// class DeitPlanScreen extends StatefulWidget {
//   @override
//   _DeitPlanScreenState createState() => _DeitPlanScreenState();
// }

// class _DeitPlanScreenState extends State<DeitPlanScreen> {
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return LoadingOverlay(
//       isLoading: isLoading,
//       color: AppColors.white,
//       progressIndicator: loading(),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             160.h.heightBox,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset(
//                   'assets/icons/drawer_icon.png',
//                   height: 45.h,
//                 ),
//                 Image.asset(
//                   'assets/icons/waterIntake.png',
//                   height: 162.h,
//                 ),
//               ],
//             ).onTap(() {
//               context.nextPage(WaterIntakScreen());
//             }),
//             74.h.heightBox,
//             'Effective Tips'
//                 .text
//                 .size(102.sp)
//                 .bold
//                 .color(AppColors.black)
//                 .make()
//                 .px(50.w),
//             50.h.heightBox,
//             'Recommended by coach'
//                 .text
//                 .size(52.sp)
//                 .color(AppColors.primaryColor)
//                 .make()
//                 .px(50.w),
//             107.h.heightBox,
//             Consumer(builder: (context, watch, child) {
//               final tipListFuture = watch(dailyTipsFuture);

//               return tipListFuture.when(
//                 data: (tiplist) {
//                   print(tiplist);
//                   if (tiplist.length == 0) {
//                     DailyTipsRepo().addDailyTipsToDatabase(context);
//                     return Center(child: loading());
//                   }
//                   return ListView.builder(
//                       shrinkWrap: true,
//                       physics: BouncingScrollPhysics(),
//                       itemCount: tiplist.length,
//                       itemBuilder: (context, index) {
//                         final tip = tiplist[index];
//                         return ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           clipBehavior: Clip.hardEdge,
//                           child: Container(
//                             height: 761.h,
//                             child: Stack(
//                               clipBehavior: Clip.hardEdge,
//                               children: [
//                                 CachedNetworkImage(
//                                   imageUrl: tip.imgUrl!,
//                                   fit: BoxFit.cover,
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                   placeholder: (context, url) => loading(),
//                                   errorWidget: (context, url, error) =>
//                                       Icon(Icons.error),
//                                 ),
//                                 Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Spacer(),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           tip.title!,
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 72.sp,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         26.h.heightBox,
//                                         Row(
//                                           children: [
//                                             'View Tips'
//                                                 .text
//                                                 .size(42.sp)
//                                                 .color(AppColors.white)
//                                                 .make(),
//                                             36.w.widthBox,
//                                             Image.asset(
//                                               'assets/icons/premium_proceed_arrow.png',
//                                               width: 50.w,
//                                               color: AppColors.primaryColor,
//                                             )
//                                           ],
//                                         ),
//                                         66.h.heightBox,
//                                       ],
//                                     ),
//                                   ],
//                                 ).pSymmetric(h: 60.w),
//                               ],
//                             ),
//                           ).onTap(() async {
//                             Navigator.push(
//                                 context,
//                                 SlideRightRoute(
//                                     page: TipsDetailScreen(dailyTip: tip)));

//                             // if (!planinit.contains(plan.id)) {
//                             //   FirebaseAnalytics().logEvent(
//                             //       name: 'Continue_Plan',
//                             //       parameters: {'Plan_ID': plan.id});
//                             //   Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //         builder: (context) => PlanDetailScreen(
//                             //               workoutPlan: plan,
//                             //             )),
//                             //   );
//                             // } else {
//                             // FirebaseAnalytics().logEvent(
//                             //     name: 'Continue_Plan',
//                             //     parameters: {'Plan_ID': plan.id});
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //       builder: (context) => PlanWeeksScreen(
//                             //             workoutPlan: plan,
//                             //           )),
//                             // );
//                             // }
//                           }),
//                         ).pOnly(bottom: 10);
//                       });
//                 },
//                 loading: () => Center(child: loading()),
//                 error: (e, st) => Text('Error: $e'),
//               );
//             }),
//           ],
//         ).px(70.w),
//       ),
//     );
//   }
// }
