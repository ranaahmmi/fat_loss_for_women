import 'dart:async';
import 'dart:io';

import 'package:fat_loss_for_women/Screens/HomeScreen/HomeScreen.dart';
import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
import 'package:fat_loss_for_women/Shared/PageAnimation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fat_loss_for_women/InApp/ConsumableStore.dart';
import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';

class ProScreen extends StatefulWidget {
  const ProScreen({Key? key}) : super(key: key);

  @override
  _ProScreenState createState() => _ProScreenState();
}

class _ProScreenState extends State<ProScreen> {
  //Ad Variable
  // Inapp variable
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<String> _notFoundIds = [];
  List<ProductDetails> _products = [];
  List<PurchaseDetails> _purchases = [];
  List<String?> _consumables = [];
  bool _isAvailable = true;
  bool _purchasePending = false;
  bool _loading = false;
  late String? _queryProductError;

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics().logEvent(
      name: 'Premium_Screen_View',
    );
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // final Stream<List<PurchaseDetails>> purchaseUpdated =
    //     _inAppPurchase.purchaseStream;
    // _subscription = purchaseUpdated.listen((purchaseDetailsList) {
    //   _listenToPurchaseUpdated(purchaseDetailsList);
    // }, onDone: () {
    //   _subscription.cancel();
    // }, onError: (error) {
    //   // handle error here.
    // });
    // initStoreInfo();
  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      setState(() {
        _isAvailable = isAvailable;
        _products = [];
        _purchases = [];
        _notFoundIds = [];
        _consumables = [];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails(["inappsku"].toSet());
    if (productDetailResponse.error != null) {
      setState(() {
        _queryProductError = productDetailResponse.error!.message;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = [];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = [];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      setState(() {
        _queryProductError = null;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = [];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = [];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    List<String?> consumables = await ConsumableStore.load();
    setState(() {
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _notFoundIds = productDetailResponse.notFoundIDs;
      _consumables = consumables;
      _purchasePending = false;
      _loading = false;
    });
  }

  @override
  void dispose() {
    // _subscription.cancel();
    super.dispose();
  }

  int select = 2;
  Color color = AppColors.primaryColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? loading()
          : Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset('assets/icons/Premium_Back.png')),
                Positioned(
                    top: 223.h,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        'Upgrade to Premium'
                            .text
                            .size(72.sp)
                            .color(AppColors.black)
                            .extraBold
                            .make(),
                        84.h.heightBox,
                        'Premium Membership Includes'
                            .text
                            .size(52.sp)
                            .color(AppColors.primaryColor)
                            .make(),
                        195.h.heightBox,
                        PremiumDoneList(title: 'No more annoying ads'),
                        95.h.heightBox,
                        PremiumDoneList(title: 'Get all premium plans to free'),
                        95.h.heightBox,
                        PremiumDoneList(title: 'Unlimited workout coachings'),
                        95.h.heightBox,
                        PremiumDoneList(title: 'Ultimate diet plans for free'),
                        95.h.heightBox,
                        Container(
                          height: 760.h,
                          child: Center(
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 40.h,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 590.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            AppColors.greyDim.withOpacity(0.2)),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          bottom: 0,
                                          right: context.screenWidth * 0.6,
                                          child: PrimeCard(
                                                  height: select == 1
                                                      ? 670.h
                                                      : 590.h,
                                                  discount: '45% off',
                                                  price: '9.99\$',
                                                  month: '6 Months',
                                                  subtitle: '(\$ 1.60/ month)',
                                                  color: select == 1
                                                      ? Colors.white
                                                      : AppColors.greyDim
                                                          .withOpacity(0.2))
                                              .onTap(() {
                                            select = 1;

                                            setState(() {});
                                          }),
                                        ),
                                        Center(
                                          child: PrimeCard(
                                            height: select == 2 ? 670.h : 590.h,
                                            discount: '0% off',
                                            price: '1.99\$',
                                            month: '1 Months',
                                            subtitle: '  ',
                                            color: select == 2
                                                ? Colors.white
                                                : AppColors.greyDim
                                                    .withOpacity(0.2),
                                          ).onTap(() {
                                            select = 2;

                                            setState(() {});
                                          }),
                                        ),
                                        Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: PrimeCard(
                                            height: select == 3 ? 670.h : 590.h,
                                            discount: '60% off',
                                            price: '18.99\$',
                                            month: '1 Year',
                                            subtitle: '(\$ 1.58/ month)',
                                            color: select == 3
                                                ? Colors.white
                                                : AppColors.greyDim
                                                    .withOpacity(0.2),
                                          ).onTap(() {
                                            select = 3;

                                            setState(() {});
                                          }),
                                        ),
                                      ],
                                    ),
                                  ).px(58.w),
                                ),
                                AnimatedPositioned(
                                    duration: Duration(milliseconds: 400),
                                    bottom: 0,
                                    left: select == 2
                                        ? 0
                                        : select == 1
                                            ? 1
                                            : context.screenWidth * 0.64,
                                    right: select == 2
                                        ? 0
                                        : select == 1
                                            ? context.screenWidth * 0.64
                                            : 0,
                                    child: Center(
                                      child: Container(
                                        height: 721.h,
                                        width: 493.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: AppColors.primaryColor,
                                                width: 1)),
                                      ),
                                    ).px(5)),
                                AnimatedPositioned(
                                    duration: Duration(milliseconds: 400),
                                    top: 0,
                                    left: select == 2
                                        ? 0
                                        : select == 1
                                            ? 1
                                            : context.screenWidth * 0.64,
                                    right: select == 2
                                        ? 0
                                        : select == 1
                                            ? context.screenWidth * 0.64
                                            : 0,
                                    child: Center(
                                      child: Container(
                                        height: 101.h,
                                        width: 407.w,
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: AppColors.Adcolor,
                                                width: 1)),
                                        child: Text(select == 2
                                                ? 'Best Value'
                                                : select == 1
                                                    ? 'Gold'
                                                    : 'Platinum')
                                            .text
                                            .size(46.sp)
                                            .color(AppColors.white)
                                            .extraBold
                                            .makeCentered(),
                                      ).px(43.w),
                                    ).px(5))
                              ],
                            ),
                          ),
                        ),
                        103.h.heightBox,
                        'Subscription will automatically renewed after Mentioned time period.'
                            .text
                            .center
                            .size(52.sp)
                            .color(AppColors.TextColorLight)
                            .make()
                            .w(942.w),
                        103.h.heightBox,
                        CustomChildButton(
                            onpressed: () {},
                            child: Center(
                              child: Stack(
                                children: [
                                  'Continue'
                                      .text
                                      .center
                                      .extraBold
                                      .size(56.sp)
                                      .color(AppColors.white)
                                      .makeCentered(),
                                  Positioned(
                                    right: 75.w,
                                    top: 0,
                                    bottom: 0,
                                    child: Image.asset(
                                      'assets/icons/premium_proceed_arrow.png',
                                      width: 43.w,
                                    ),
                                  )
                                ],
                              ),
                            )),
                        103.h.heightBox,
                        'Start using with ADS'
                            .text
                            .underline
                            .center
                            .bold
                            .size(48.sp)
                            .color(AppColors.primaryColor)
                            .make()
                            .onTap(() async {
                          final interstitial =
                              context.read(interstitialAdProvider);
                          final bool isAdShow =
                              context.read(purchasedProvider).data?.value ??
                                  false;
                          if (isAdShow) {
                            if (!interstitial.isAvailable) {
                              interstitial.load();
                              Navigator.of(context).pushAndRemoveUntil(
                                  SlideBouttomRoute(page: HomeScreen()),
                                  (route) => false);
                            } else {
                              await interstitial.show();
                              Navigator.of(context).pushAndRemoveUntil(
                                  SlideBouttomRoute(page: HomeScreen()),
                                  (route) => false);
                            }
                          } else {
                            Navigator.of(context).pushAndRemoveUntil(
                                SlideBouttomRoute(page: HomeScreen()),
                                (route) => false);
                          }
                        })
                      ],
                    )),
                // _isAvailable
                //     ? Column(
                //         mainAxisSize: MainAxisSize.max,
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         children: [
                //           _buildProductList(),
                //           30.heightBox,
                //           'An Auto-renewable subscription will be activated at the end of the selected priod'
                //               .text
                //               .center
                //               .white
                //               .size(14)
                //               .make()
                //               .w(context.screenWidth * 0.75),
                //           20.heightBox,
                //           'Subscribe to go ads free & get premium access'
                //               .text
                //               .maxLines(1)
                //               .center
                //               .bold
                //               .white
                //               .size(20)
                //               .make()
                //               .w(context.screenWidth * 0.80),
                //           30.heightBox,
                //           'No, Start with Ads'
                //               .text
                //               .underline
                //               .center
                //               .heightRelaxed
                //               .bold
                //               .white
                //               .size(24)
                //               .make()
                //               .onTap(() async {
                //             // final interstitalAd = context.read(adServices);
                //             // final bool isAdShow =
                //             //     context.read(purchasedProvider).state;

                //             // if (isAdShow &&
                //             //     await interstitalAd.interstitialAd
                //             //         .isLoaded()) {
                //             //   interstitalAd.interstitialAd.show();
                //             //   Adchecker().saveData();
                //             // }
                //             // Navigator.pushAndRemoveUntil(
                //             //     context,
                //             //     SlideBouttomRoute(page: HomeScreen()),
                //             //     (route) => false);
                //           }).w(context.screenWidth * 0.75)
                //         ],
                //       ).py(40)
                //     : Column(
                //         mainAxisSize: MainAxisSize.max,
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           20.heightBox,
                //           'Store is not Available \n Please Check after sometime'
                //               .text
                //               .center
                //               .bold
                //               .white
                //               .size(20)
                //               .makeCentered(),
                //           30.heightBox,
                //           'No, Start with Ads'
                //               .text
                //               .underline
                //               .center
                //               .heightRelaxed
                //               .bold
                //               .white
                //               .size(24)
                //               .make()
                //               .onTap(() async {
                //             // final interstitalAd = context.read(adServices);
                //             // final bool isAdShow =
                //             //     context.read(purchasedProvider).state;

                //             // if (isAdShow &&
                //             //     await interstitalAd.interstitialAd
                //             //         .isLoaded()) {
                //             //   interstitalAd.interstitialAd.show();
                //             //   Adchecker().saveData();
                //             // }
                //             // Navigator.pushAndRemoveUntil(
                //             //     context,
                //             //     SlideBouttomRoute(page: HomeScreen()),
                //             //     (route) => false);
                //           }).w(context.screenWidth * 0.75)
                //         ],
                //       ).py(40)
              ],
            ),
    );
  }

  Widget _buildProductList() {
    if (_loading) {
      return Card(
          child: (ListTile(
              leading: CircularProgressIndicator(),
              title: Text('Fetching products...'))));
    }
    if (!_isAvailable) {
      return Card();
    }

    List<Widget> productList = <Widget>[];
    if (_notFoundIds.isNotEmpty) {
      productList.add(ListTile(
          title: Text('[${_notFoundIds.join(", ")}] not found',
              style: TextStyle(color: ThemeData.light().errorColor)),
          subtitle: Text('not found')));
    }

    // This loading previous purchases code is just a demo. Please do not use this as it is.
    // In your app you should always verify the purchase data using the `verificationData` inside the [PurchaseDetails] object before trusting it.
    // We recommend that you use your own server to verify the purchase data.
    Map<String, PurchaseDetails> purchases =
        Map.fromEntries(_purchases.map((PurchaseDetails purchase) {
      if (purchase.pendingCompletePurchase) {
        _inAppPurchase.completePurchase(purchase);
      }
      return MapEntry<String, PurchaseDetails>(purchase.productID, purchase);
    }));
    _products = _products.sortedBy((a, b) =>
        getintFromString(a.price).compareTo(getintFromString(b.price)));
    productList.addAll(_products.map(
      (ProductDetails productDetails) {
        // PurchaseDetails previousPurchase = purchases[productDetails.id];
        print(productDetails.price);

        return Container(
          height: 135,
          width: 110,
          child: Stack(children: [
            Text("dafl"),
            Image.asset(
              'assets/Icons/New Tag.png',
              height: 50,
            )
          ]),
        ).onTap(
          () {
            PurchaseParam purchaseParam;

            if (Platform.isAndroid) {
              final oldSubscription =
                  _getOldSubscription(productDetails, purchases);

              purchaseParam = GooglePlayPurchaseParam(
                  productDetails: productDetails,
                  applicationUserName: null,
                  changeSubscriptionParam: (oldSubscription != null)
                      ? ChangeSubscriptionParam(
                          oldPurchaseDetails: oldSubscription,
                          prorationMode:
                              ProrationMode.immediateWithTimeProration,
                        )
                      : null);
            } else {
              purchaseParam = PurchaseParam(
                productDetails: productDetails,
                applicationUserName: null,
              );
            }

            if (productDetails.id == 'kConsumableId') {
              _inAppPurchase.buyConsumable(
                  purchaseParam: purchaseParam,
                  autoConsume: true || Platform.isIOS);
            } else {
              _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
            }
          },
        );

        // ListTile(
        //     title: Text(
        //       productDetails.title,
        //     ),
        //     subtitle: Text(
        //       productDetails.description,
        //     ),
        //     trailing: previousPurchase != null
        //         ? Icon(Icons.check)
        //         : TextButton(
        //             child: Text(productDetails.price),
        //             style: TextButton.styleFrom(
        //               backgroundColor: Colors.green[800],
        //               primary: Colors.white,
        //             ),
        //           ));
      },
    ));

    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: productList)
        .px(30);
  }

  GooglePlayPurchaseDetails? _getOldSubscription(
      ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {
    GooglePlayPurchaseDetails? oldSubscription;
    if (productDetails.id == item1m && purchases[item1m] != null) {
      oldSubscription = purchases[item1m] as GooglePlayPurchaseDetails;
    } else if (productDetails.id == item1m && purchases[item3m] != null) {
      oldSubscription = purchases[item3m] as GooglePlayPurchaseDetails;
    } else if (productDetails.id == item1y && purchases[item1y] != null) {
      oldSubscription = purchases[item1y] as GooglePlayPurchaseDetails;
    }
    return oldSubscription;
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        setState(() {
          _purchasePending = true;
        });
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          setState(() {
            _purchasePending = false;
          });
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            deliverProduct(purchaseDetails);
          } else {
            // _handleInvalidPurchase(purchaseDetails);
            return;
          }
        }
        if (Platform.isAndroid) {
          if (!true && purchaseDetails.productID == 'kConsumableId') {
            final InAppPurchaseAndroidPlatformAddition androidAddition =
                _inAppPurchase.getPlatformAddition<
                    InAppPurchaseAndroidPlatformAddition>();
            await androidAddition.consumePurchase(purchaseDetails);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    });
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

  void deliverProduct(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.productID == "widget.inappsku") {
      await context.read(userDao).getUserfuture().then((value) {
        context.read(userDao).insertUser(User(
              id: value.id,
              age: value.age,
              ip: false,
            ));
      });
      await ConsumableStore.save(purchaseDetails.purchaseID);

      List<String?> consumables = await ConsumableStore.load();

      setState(() {
        _purchasePending = false;
        _consumables = consumables;
      });
    } else {
      await context.read(userDao).getUserfuture().then((value) {
        context.read(userDao).insertUser(User(
              id: value.id,
              age: value.age,
              ip: false,
            ));
      });

      setState(() {
        _purchases.add(purchaseDetails);

        _purchasePending = false;
      });
    }
  }
}

class PrimeCard extends StatelessWidget {
  final String discount, price, month, subtitle;
  final Color color;
  final double height;
  const PrimeCard({
    Key? key,
    required this.subtitle,
    required this.discount,
    required this.price,
    required this.month,
    required this.color,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: color,
      width: 440.w,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          discount.text.size(42.sp).color(AppColors.red).make(),
          price.text.size(72.sp).color(AppColors.black).make(),
          'for'.text.size(48.sp).color(AppColors.greyDim).make(),
          month.text.size(72.sp).color(AppColors.TextColorLight).make(),
          subtitle.text.size(42.sp).color(AppColors.greyDim).make(),
        ],
      ).pOnly(top: 78.h, bottom: 46.h),
    );
  }
}

class PremiumDoneList extends StatelessWidget {
  final String title;
  const PremiumDoneList({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/ProTick.png',
          height: 66.h,
        ),
        88.w.widthBox,
        title.text.size(56.sp).color(AppColors.black).make(),
      ],
    ).pOnly(left: 123.w);
  }
}
