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
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fat_loss_for_women/InApp/ConsumableStore.dart';
import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

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
  bool _isAvailable = false;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics().logEvent(
      name: 'Premium_Screen_View',
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    //
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      print(error);
    });
    initStoreInfo();
  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      setState(() {
        _isAvailable = isAvailable;
        _products = [];
        _purchases = [];
        _notFoundIds = [];
        _loading = false;
      });
      return;
    }
    if (Platform.isIOS) {
      var iosPlatformAddition = _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails(kProductIds);
    if (productDetailResponse.error != null) {
      setState(() {
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = [];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _loading = false;
      });
      print(_notFoundIds);
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      setState(() {
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = [];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _loading = false;
      });
      return;
    }

    setState(() {
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _notFoundIds = productDetailResponse.notFoundIDs;
      _loading = false;
    });
  }

  @override
  void dispose() {
    if (Platform.isIOS) {
      var iosPlatformAddition = _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    _subscription.cancel();
    super.dispose();
  }

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
                  top: 155.h,
                  left: 0,
                  right: 0,
                  child: Center(
                      child: Lottie.asset('assets/Animation/premium.json',
                          animate: true, height: 898.h)),
                ),
                Positioned(
                    top: 1050.h,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        'Upgrade to Premium'
                            .text
                            .size(72.sp)
                            .color(AppColors.black)
                            .extraBold
                            .make(),
                        84.h.heightBox,
                        'Unlimited Access to All Premium Features'
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
                        // 95.h.heightBox,
                        // PremiumDoneList(title: 'Ultimate diet plans for free'),
                        95.h.heightBox,
                        83.h.heightBox,
                        'Pay 5.99\$ and get premium for Lifetime'
                            .text
                            .center
                            .size(52.sp)
                            .color(AppColors.TextColorLight)
                            .make()
                            .w(942.w),
                        90.h.heightBox,
                        'Restore Purchase'
                            .text
                            .underline
                            .center
                            .bold
                            .size(48.sp)
                            .color(AppColors.black)
                            .make()
                            .onTap(() async {
                          await InAppPurchase.instance.restorePurchases();
                        }),
                        60.h.heightBox,
                        CustomChildButton(
                            onpressed: () async {
                              if (_isAvailable) {
                                if (_products.length != 0) {
                                  Map<String, PurchaseDetails> purchases =
                                      Map.fromEntries(_purchases
                                          .map((PurchaseDetails purchase) {
                                    if (purchase.pendingCompletePurchase) {
                                      _inAppPurchase.completePurchase(purchase);
                                    }
                                    return MapEntry<String, PurchaseDetails>(
                                        purchase.productID, purchase);
                                  }));
                                  PurchaseParam purchaseParam;

                                  ProductDetails productDetails = _products[0];

                                  purchaseParam = PurchaseParam(
                                    productDetails: productDetails,
                                    applicationUserName: null,
                                  );

                                  if (productDetails.id == 'kConsumableId') {
                                    _inAppPurchase.buyConsumable(
                                        purchaseParam: purchaseParam,
                                        autoConsume: Platform.isIOS);
                                  } else {
                                    _inAppPurchase.buyNonConsumable(
                                        purchaseParam: purchaseParam);
                                  }
                                } else {
                                  context.showToast(
                                      msg:
                                          'Product Not Avaiable Right Now\nPlease Check After Some Time',
                                      bgColor: AppColors.primaryColor,
                                      textColor: Colors.white,
                                      textSize: 48.sp,
                                      position: VxToastPosition.top);
                                }
                              } else {
                                context.showToast(
                                    msg: 'Plaease Wait Connecting to Store',
                                    bgColor: AppColors.primaryColor,
                                    textColor: Colors.white,
                                    textSize: 48.sp,
                                    position: VxToastPosition.top);
                              }
                            },
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

                        53.h.heightBox,

                        53.h.heightBox,
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
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.close,
                    size: 70.h,
                    color: AppColors.TextColorLight,
                  ),
                ).pSymmetric(h: 105.w, v: 130.h).onTap(() async {
                  final interstitial = context.read(interstitialAdProvider);
                  final bool isAdShow =
                      context.read(purchasedProvider).data?.value ?? false;
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
                }),
              ],
            ),
    );
  }

  // Widget _buildProductList() {
  //   if (_loading) {
  //     return Card(
  //         child: (ListTile(
  //             leading: CircularProgressIndicator(),
  //             title: Text('Fetching products...'))));
  //   }
  //   if (!_isAvailable) {
  //     return Card();
  //   }
  //   List<Widget> productList = <Widget>[];
  //   if (_notFoundIds.isNotEmpty) {
  //     productList.add(ListTile(
  //         title: Text('[${_notFoundIds.join(", ")}] not found',
  //             style: TextStyle(color: ThemeData.light().errorColor)),
  //         subtitle: Text('not found')));
  //   }
  //   // This loading previous purchases code is just a demo. Please do not use this as it is.
  //   // In your app you should always verify the purchase data using the `verificationData` inside the [PurchaseDetails] object before trusting it.
  //   // We recommend that you use your own server to verify the purchase data.
  //   Map<String, PurchaseDetails> purchases =
  //       Map.fromEntries(_purchases.map((PurchaseDetails purchase) {
  //     if (purchase.pendingCompletePurchase) {
  //       _inAppPurchase.completePurchase(purchase);
  //     }
  //     return MapEntry<String, PurchaseDetails>(purchase.productID, purchase);
  //   }));
  //   _products = _products.sortedBy((a, b) =>
  //       getintFromString(a.price).compareTo(getintFromString(b.price)));
  //   productList.addAll(_products.map(
  //     (ProductDetails productDetails) {
  //       // PurchaseDetails previousPurchase = purchases[productDetails.id];
  //       print(productDetails.price);
  //       return Container(
  //         height: 135,
  //         width: 110,
  //         child: Stack(children: [
  //           Text("dafl"),
  //           Image.asset(
  //             'assets/Icons/New Tag.png',
  //             height: 50,
  //           )
  //         ]),
  //       ).onTap(
  //         () {
  //           PurchaseParam purchaseParam;
  //           if (Platform.isAndroid) {
  //             final oldSubscription =
  //                 _getOldSubscription(productDetails, purchases);
  //             purchaseParam = GooglePlayPurchaseParam(
  //                 productDetails: productDetails,
  //                 applicationUserName: null,
  //                 changeSubscriptionParam: (oldSubscription != null)
  //                     ? ChangeSubscriptionParam(
  //                         oldPurchaseDetails: oldSubscription,
  //                         prorationMode:
  //                             ProrationMode.immediateWithTimeProration,
  //                       )
  //                     : null);
  //           } else {
  //             purchaseParam = PurchaseParam(
  //               productDetails: productDetails,
  //               applicationUserName: null,
  //             );
  //           }
  //           if (productDetails.id == 'kConsumableId') {
  //             _inAppPurchase.buyConsumable(
  //                 purchaseParam: purchaseParam,
  //                 autoConsume: true || Platform.isIOS);
  //           } else {
  //             _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  //           }
  //         },
  //       );
  //       // ListTile(
  //       //     title: Text(
  //       //       productDetails.title,
  //       //     ),
  //       //     subtitle: Text(
  //       //       productDetails.description,
  //       //     ),
  //       //     trailing: previousPurchase != null
  //       //         ? Icon(Icons.check)
  //       //         : TextButton(
  //       //             child: Text(productDetails.price),
  //       //             style: TextButton.styleFrom(
  //       //               backgroundColor: Colors.green[800],
  //       //               primary: Colors.white,
  //       //             ),
  //       //           ));
  //     },
  //   ));
  //   return Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: productList)
  //       .px(30);
  // }
  // GooglePlayPurchaseDetails? _getOldSubscription(
  //     ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {
  //   GooglePlayPurchaseDetails? oldSubscription;
  //   if (productDetails.id == item1m && purchases[item1m] != null) {
  //     oldSubscription = purchases[item1m] as GooglePlayPurchaseDetails;
  //   }
  //   return oldSubscription;
  // }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.error) {
        print('[${purchaseDetails.productID}] purchase failed');
        print(purchaseDetails.error);
        return;
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        bool valid = await _verifyPurchase(purchaseDetails);
        if (valid) {
          deliverProduct(purchaseDetails);
        } else {
          // _handleInvalidPurchase(purchaseDetails);
          return;
        }
      }

      if (purchaseDetails.pendingCompletePurchase) {
        await _inAppPurchase.completePurchase(purchaseDetails);
      }
    });
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    return Future<bool>.value(true);
  }

  void deliverProduct(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.productID == item1m) {
      await context.read(userDao).getUserfuture().then((value) {
        context.read(userDao).insertUser(User(
              id: value.id,
              age: value.age,
              ip: false,
            ));
      });
      await ConsumableStore.save(purchaseDetails.purchaseID!);

      setState(() {});
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
      });
    }
  }
}

class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/icons/ProTick.png',
          color: AppColors.primaryColor,
          height: 66.h,
        ),
        88.w.widthBox,
        title.text.size(56.sp).color(AppColors.black).make(),
      ],
    ).w(855.w).pOnly(left: 40.w);
  }
}
