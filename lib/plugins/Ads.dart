import 'package:fat_loss_for_women/Shared/ShimmerLoading.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NativeAdsFull extends StatefulWidget {
  const NativeAdsFull({Key? key}) : super(key: key);

  @override
  _NativeAdsFullState createState() => _NativeAdsFullState();
}

class _NativeAdsFullState extends State<NativeAdsFull>
    with AutomaticKeepAliveClientMixin {
  final controller = NativeAdController();

  @override
  void initState() {
    super.initState();
    controller.load();
    controller.onEvent.listen((event) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return controller.isLoaded
        ? NativeAd(
            controller: controller,
            height: 1000.h,
            loading: ShimmerLoading().fullSizeLoading(),
            error: Text('Ads failed to load'),
            body: AdTextView(
              width: 680.w,
              style: TextStyle(
                  fontSize: 46.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.TextColorLight),
              maxLines: 2,
            ),
            icon: AdImageView(size: 248.w),
            headline: AdTextView(
              width: 680.w,
              padding: EdgeInsets.only(bottom: 0),
              style: TextStyle(
                  fontSize: 58.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
              maxLines: 1,
            ),
            media: AdMediaView(
              height: 600.h,
              width: MATCH_PARENT,
            ),
            attribution: AdTextView(
              width: WRAP_CONTENT,
              text: 'Ad',
              decoration: AdDecoration(
                  border: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: AdBorderRadius.all(4)),
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 2.0),
            ),
             advertiser: AdTextView(
              style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
              maxLines: 1,
            ),
            button: AdButtonView(
                elevation: 3,
                decoration: AdDecoration(
                    backgroundColor: AppColors.Adcolor,
                    borderRadius: AdBorderRadius.all(6)),
                textStyle: TextStyle(color: Colors.white),
                height: 308.w,
                width: MATCH_PARENT),
            buildLayout: fullBuilder,
          )
        : ShimmerLoading().fullSizeLoading();
  }

  @override
  bool get wantKeepAlive => true;
}

class NativeAdBanner extends StatefulWidget {
  const NativeAdBanner({Key? key}) : super(key: key);

  @override
  _NativeAdBannerState createState() => _NativeAdBannerState();
}

class _NativeAdBannerState extends State<NativeAdBanner>
    with AutomaticKeepAliveClientMixin {
  final controller = NativeAdController();

  @override
  void initState() {
    super.initState();
    controller.load();
    controller.onEvent.listen((event) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return controller.isLoaded
        ? NativeAd(
            controller: controller,
            height: 414.h,
            loading: ShimmerLoading().fullSizeLoading(),
            error: Text('Ads failed to load'),
            body: AdTextView(
              width: 800.w,
              style: TextStyle(
                  fontSize: 46.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.TextColorLight),
              maxLines: 2,
            ),
            icon: AdImageView(size: 248.w),
            headline: AdTextView(
              width: 800.w,
              padding: EdgeInsets.only(bottom: 0),
              style: TextStyle(
                  fontSize: 58.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
              maxLines: 1,
            ),
            attribution: AdTextView(
              width: WRAP_CONTENT,
              text: 'Ad',
              decoration: AdDecoration(
                  border: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: AdBorderRadius.all(4)),
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 2.0),
            ),
             advertiser: AdTextView(
              style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
              maxLines: 1,
            ),
            button: AdButtonView(
                elevation: 3,
                decoration: AdDecoration(
                    backgroundColor: AppColors.Adcolor,
                    borderRadius: AdBorderRadius.all(6)),
                textStyle: TextStyle(color: Colors.white),
                height: 308.w,
                width: MATCH_PARENT),
            buildLayout: bannarAdBuilder,
          )
        : ShimmerLoading().mediumLoading();
  }

  @override
  bool get wantKeepAlive => true;
}

AdLayoutBuilder get fullBuilder => (ratingBar, media, icon, headline,
        advertiser, body, price, store, attribuition, button) {
      return AdLinearLayout(
        decoration: AdDecoration(
          backgroundColor: AppColors.AdBgcolor,
        ),
        padding: EdgeInsets.all(3),
        width: MATCH_PARENT,
        children: [
          media,
          AdLinearLayout(
            children: [
               icon,
              AdLinearLayout(
                  gravity: LayoutGravity.left,
                  children: [
                    AdLinearLayout(
                        gravity: LayoutGravity.center,
                        orientation: HORIZONTAL,
                        elevation: 0,
                        children: [attribuition, advertiser]),
                    headline,
                    body,
                  ],
                  width: WRAP_CONTENT,
                  margin: EdgeInsets.only(left: 10, right: 10)),
              button,
            ],
            gravity: LayoutGravity.center,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            orientation: HORIZONTAL,
            // margin: EdgeInsets.only(top: 6),
          ),
        ],
      );
    };
AdLayoutBuilder get bannarAdBuilder => (ratingBar, media, icon, headline,
        advertiser, body, price, store, attribuition, button) {
      return AdLinearLayout(
        decoration: AdDecoration(
          backgroundColor: AppColors.AdBgcolor,
        ),
        padding: EdgeInsets.all(3),
        width: MATCH_PARENT,
        elevation: 5,
        children: [
          AdLinearLayout(
            children: [
                icon,
              AdLinearLayout(
                  gravity: LayoutGravity.left,
                  children: [
                    AdLinearLayout(
                        gravity: LayoutGravity.center,
                        orientation: HORIZONTAL,
                        elevation: 0,
                        children: [attribuition, advertiser]),
                    headline,
                    body,
                  ],
                  width: WRAP_CONTENT,
                  margin: EdgeInsets.only(left: 10, right: 10)),
              button,
            ],
            gravity: LayoutGravity.center,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            orientation: HORIZONTAL,
            // margin: EdgeInsets.only(top: 6),
          ),
        ],
      );
    };

class BannerAds extends StatefulWidget {
  const BannerAds({Key? key}) : super(key: key);

  @override
  _BannerAdsState createState() => _BannerAdsState();
}

class _BannerAdsState extends State<BannerAds>
    with AutomaticKeepAliveClientMixin {
  Widget? child;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (child != null) return child!;
    return RefreshIndicator(
      onRefresh: () async {
        setState(() => child = SizedBox());
        await Future.delayed(Duration(milliseconds: 20));
        setState(() => child = null);
      },
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          BannerAd(
            builder: (context, child) {
              return Container(
                color: Colors.black,
                child: child,
              );
            },
            loading: Text('loading'),
            error: Text('error'),
            size: BannerSize.ADAPTIVE,
          ),
          SizedBox(height: 10),
          BannerAd(
            builder: (context, child) {
              return Container(
                color: Colors.black,
                child: child,
              );
            },
            loading: Text('loading'),
            error: Text('error'),
            // ignore: deprecated_member_use
            size: BannerSize.SMART_BANNER,
          ),
          SizedBox(height: 10),
          BannerAd(
            builder: (context, child) {
              return Container(
                color: Colors.black,
                child: child,
              );
            },
            loading: Text('loading'),
            error: Text('error'),
            size: BannerSize.BANNER,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
