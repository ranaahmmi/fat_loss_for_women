import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Shared/ShimmerLoading.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class NativeAdsFull extends StatefulWidget {
//   const NativeAdsFull({Key? key}) : super(key: key);

//   @override
//   _NativeAdsFullState createState() => _NativeAdsFullState();
// }

// class _NativeAdsFullState extends State<NativeAdsFull>
//     with AutomaticKeepAliveClientMixin {
//   final controller = NativeAdController();

//   @override
//   void initState() {
//     super.initState();
//     controller.load();
//     controller.onEvent.listen((event) {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   // ignore: must_call_super
//   Widget build(BuildContext context) {
//     return controller.isLoaded
//         ? NativeAd(
//             controller: controller,
//             height: 1000.h,
//             loading: ShimmerLoading().fullSizeLoading(),
//             error: Text('Ads failed to load'),
//             body: AdTextView(
//               width: 680.w,
//               style: TextStyle(
//                   fontSize: 46.sp,
//                   fontWeight: FontWeight.normal,
//                   color: AppColors.TextColorLight),
//               maxLines: 2,
//             ),
//             icon: AdImageView(size: 248.w),
//             headline: AdTextView(
//               width: 680.w,
//               padding: EdgeInsets.only(bottom: 0),
//               style: TextStyle(
//                   fontSize: 58.sp,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.black),
//               maxLines: 1,
//             ),
//             media: AdMediaView(
//               height: 600.h,
//               width: MATCH_PARENT,
//             ),
//             attribution: AdTextView(
//               width: WRAP_CONTENT,
//               text: 'Ad',
//               decoration: AdDecoration(
//                   border: BorderSide(color: Colors.grey, width: 2),
//                   borderRadius: AdBorderRadius.all(4)),
//               style:
//                   TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
//               padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 2.0),
//             ),
//             advertiser: AdTextView(
//               style: TextStyle(
//                   fontSize: 48.sp,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.black),
//               maxLines: 1,
//             ),
//             button: AdButtonView(
//                 elevation: 3,
//                 decoration: AdDecoration(
//                     backgroundColor: AppColors.Adcolor,
//                     borderRadius: AdBorderRadius.all(6)),
//                 textStyle: TextStyle(color: Colors.white),
//                 height: 308.w,
//                 width: MATCH_PARENT),
//             buildLayout: fullBuilder,
//           )
//         : ShimmerLoading().fullSizeLoading();
//   }

//   @override
//   bool get wantKeepAlive => true;
// }

// class NativeAdBanner extends StatefulWidget {
//   const NativeAdBanner({Key? key}) : super(key: key);

//   @override
//   _NativeAdBannerState createState() => _NativeAdBannerState();
// }

// class _NativeAdBannerState extends State<NativeAdBanner>
//     with AutomaticKeepAliveClientMixin {
//   final controller = NativeAdController();

//   @override
//   void initState() {
//     super.initState();
//     controller.load();
//     controller.onEvent.listen((event) {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   // ignore: must_call_super
//   Widget build(BuildContext context) {
//     return controller.isLoaded
//         ? Container(
//             child: NativeAd(
//               controller: controller,
//               height: 424.h,
//               loading: ShimmerLoading().fullSizeLoading(),
//               error: Text('Ads failed to load'),
//               body: AdTextView(
//                 width: 800.w,
//                 style: TextStyle(
//                     fontSize: 46.sp,
//                     fontWeight: FontWeight.normal,
//                     color: AppColors.TextColorLight),
//                 maxLines: 2,
//               ),
//               icon: AdImageView(size: 248.w),
//               headline: AdTextView(
//                 width: 800.w,
//                 padding: EdgeInsets.only(bottom: 0),
//                 style: TextStyle(
//                     fontSize: 58.sp,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.black),
//                 maxLines: 1,
//               ),
//               attribution: AdTextView(
//                 width: WRAP_CONTENT,
//                 text: 'Ad',
//                 decoration: AdDecoration(
//                     border: BorderSide(color: Colors.grey, width: 2),
//                     borderRadius: AdBorderRadius.all(4)),
//                 style:
//                     TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
//                 padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 2.0),
//               ),
//               button: AdButtonView(
//                   elevation: 3,
//                   decoration: AdDecoration(
//                       backgroundColor: AppColors.Adcolor,
//                       borderRadius: AdBorderRadius.all(6)),
//                   textStyle: TextStyle(color: Colors.white),
//                   height: 308.w,
//                   width: MATCH_PARENT),
//               advertiser: AdTextView(
//                 style: TextStyle(
//                     fontSize: 48.sp,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.black),
//                 maxLines: 1,
//               ),
//               buildLayout: bannarAdBuilder,
//             ),
//           )
//         : ShimmerLoading().mediumLoading();
//   }

//   @override
//   bool get wantKeepAlive => true;
// }

// AdLayoutBuilder get fullBuilder => (ratingBar, media, icon, headline,
//         advertiser, body, price, store, attribuition, button) {
//       return AdLinearLayout(
//         decoration: AdDecoration(
//           backgroundColor: AppColors.AdBgcolor,
//         ),
//         padding: EdgeInsets.all(3),
//         width: MATCH_PARENT,
//         children: [
//           media,
//           AdLinearLayout(
//             children: [
//               icon,
//               AdLinearLayout(
//                   gravity: LayoutGravity.left,
//                   children: [
//                     AdLinearLayout(
//                         gravity: LayoutGravity.center,
//                         orientation: HORIZONTAL,
//                         elevation: 0,
//                         children: [attribuition, advertiser]),
//                     headline,
//                     body,
//                   ],
//                   width: WRAP_CONTENT,
//                   margin: EdgeInsets.only(left: 10, right: 10)),
//               button,
//             ],
//             gravity: LayoutGravity.center,
//             margin: EdgeInsets.all(0),
//             padding: EdgeInsets.all(0),
//             orientation: HORIZONTAL,
//             // margin: EdgeInsets.only(top: 6),
//           ),
//         ],
//       );
//     };
// AdLayoutBuilder get bannarAdBuilder => (ratingBar, media, icon, headline,
//         advertiser, body, price, store, attribuition, button) {
//       return AdLinearLayout(
//         decoration: AdDecoration(
//           backgroundColor: AppColors.AdBgcolor,
//         ),
//         padding: EdgeInsets.all(3),
//         width: MATCH_PARENT,
//         elevation: 5,
//         children: [
//           AdLinearLayout(
//             children: [
//               icon,
//               AdLinearLayout(
//                   gravity: LayoutGravity.left,
//                   children: [
//                     AdLinearLayout(
//                         gravity: LayoutGravity.center,
//                         orientation: HORIZONTAL,
//                         elevation: 0,
//                         children: [attribuition, advertiser]),
//                     headline,
//                     body,
//                   ],
//                   width: WRAP_CONTENT,
//                   margin: EdgeInsets.only(left: 10, right: 10)),
//               button,
//             ],
//             gravity: LayoutGravity.center,
//             margin: EdgeInsets.all(0),
//             padding: EdgeInsets.all(0),
//             orientation: HORIZONTAL,
//             // margin: EdgeInsets.only(top: 6),
//           ),
//         ],
//       );
//     };
class NativeAdBanner extends StatefulWidget {
  const NativeAdBanner();

  @override
  State createState() => _NativeAdBannerState();
}

class _NativeAdBannerState extends State<NativeAdBanner>
    with AutomaticKeepAliveClientMixin {
  late NativeAd _ad;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();

    _ad = NativeAd(
      adUnitId: nativeAdUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();

          throw 'Ad load failed (code=${error.code} message=${error.message})';
        },
      ),
    );

    // COMPLETE: Load an ad
    _ad.load();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_isAdLoaded) {
      return Container(
        child: SizedBox(height: 200, child: AdWidget(ad: _ad)),
        height: 424.h,
      );
    }
    return ShimmerLoading().mediumLoading();
  }

  @override
  void dispose() {
    _ad.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class NativeAdsFull extends StatefulWidget {
  const NativeAdsFull();

  @override
  State createState() => _NativeAdsFullState();
}

class _NativeAdsFullState extends State<NativeAdsFull>
    with AutomaticKeepAliveClientMixin {
  late NativeAd _ad;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();

    _ad = NativeAd(
      adUnitId: nativeAdUnitId,
      factoryId: 'listTileFull',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();

          throw 'Ad load failed (code=${error.code} message=${error.message})';
        },
      ),
    );

    // COMPLETE: Load an ad
    _ad.load();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_isAdLoaded) {
      return Container(
        child: SizedBox(height: 200, child: AdWidget(ad: _ad)),
        height: 880.h,
      );
    }
    return ShimmerLoading().fullSizeLoading();
  }

  @override
  void dispose() {
    _ad.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
