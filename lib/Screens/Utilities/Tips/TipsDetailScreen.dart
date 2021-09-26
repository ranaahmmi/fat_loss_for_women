// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:fat_loss_for_women/Style/Colors.dart';
// import 'package:fat_loss_for_women/database/app_database.dart';
// import 'package:flutter/material.dart';

// import 'package:velocity_x/velocity_x.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TipsDetailScreen extends StatefulWidget {
//   final DailyTip dailyTip;
//   const TipsDetailScreen({Key? key, required this.dailyTip}) : super(key: key);

//   @override
//   _TipsDetailScreenState createState() => _TipsDetailScreenState();
// }

// class _TipsDetailScreenState extends State<TipsDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           187.h.heightBox,
//           Row(
//             children: [
//               Image.asset(
//                 'assets/icons/back_arrow.png',
//                 height: 56.h,
//                 width: 76.w,
//               ).onInkTap(() {
//                 context.pop();
//               }),
//             ],
//           ),
//           132.h.heightBox,
//           Text(
//             'Daily Tips',
//             style: TextStyle(
//               fontSize: 68.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           132.h.heightBox,
//           Container(
//             height: 800.h,
//             width: context.screenWidth,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                       color: AppColors.greyDim.withOpacity(0.6),
//                       blurRadius: 20,
//                       offset: Offset(12, 12))
//                 ],
//                 image: DecorationImage(
//                     image: CachedNetworkImageProvider(
//                       widget.dailyTip.imgUrl!,
//                     ),
//                     colorFilter: ColorFilter.mode(
//                         Colors.black.withOpacity(0.2), BlendMode.darken),
//                     fit: BoxFit.cover)),
//           ),
//           112.h.heightBox,
//           widget.dailyTip.title!.text.extraBold
//               .color(AppColors.primaryColor)
//               .size(76.sp)
//               .make(),
//           Container(
//             width: context.screenWidth,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       color: AppColors.greyDim.withOpacity(0.6),
//                       blurRadius: 20,
//                       offset: Offset(12, 12))
//                 ]),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 10.heightBox,
//                 widget.dailyTip.description!.text.size(15.sp).gray500.make()
//               ],
//             ).pSymmetric(v: 20, h: 15),
//           ).py(10),
//         ],
//       ).px(109.w),
//     );
//   }
// }
