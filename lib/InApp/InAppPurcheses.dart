// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
// import 'package:fat_loss_for_women/Shared/Constants.dart';
// import 'package:fat_loss_for_women/Shared/CustomButtons.dart';
// import 'package:fat_loss_for_women/Style/Colors.dart';
// import 'package:fat_loss_for_women/database/app_database.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:in_app_purchase_android/billing_client_wrappers.dart';
// import 'package:in_app_purchase_android/in_app_purchase_android.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'dart:async';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'ConsumableStore.dart';

// const bool _kAutoConsume = true;

// class ProScreen extends StatefulWidget {
//   final String inappsku;

//   const ProScreen({Key? key, required this.inappsku}) : super(key: key);

//   @override
//   _ProScreenState createState() => _ProScreenState();
// }

// class _ProScreenState extends State<ProScreen> {
//   //Ad Variable
//   // Inapp variable
//   final InAppPurchase _inAppPurchase = InAppPurchase.instance;
//   late StreamSubscription<List<PurchaseDetails>> _subscription;
//   List<String> _notFoundIds = [];
//   List<ProductDetails> _products = [];
//   List<PurchaseDetails> _purchases = [];
//   List<String?> _consumables = [];
//   bool _isAvailable = true;
//   bool _purchasePending = false;
//   bool _loading = true;
//   late String? _queryProductError;

//   @override
//   void initState() {
//     super.initState();
//     final Stream<List<PurchaseDetails>> purchaseUpdated =
//         _inAppPurchase.purchaseStream;
//     _subscription = purchaseUpdated.listen((purchaseDetailsList) {
//       _listenToPurchaseUpdated(purchaseDetailsList);
//     }, onDone: () {
//       _subscription.cancel();
//     }, onError: (error) {
//       // handle error here.
//     });
//     initStoreInfo();
//   }

//   Future<void> initStoreInfo() async {
//     final bool isAvailable = await _inAppPurchase.isAvailable();
//     if (!isAvailable) {
//       setState(() {
//         _isAvailable = isAvailable;
//         _products = [];
//         _purchases = [];
//         _notFoundIds = [];
//         _consumables = [];
//         _purchasePending = false;
//         _loading = false;
//       });
//       return;
//     }

//     ProductDetailsResponse productDetailResponse =
//         await _inAppPurchase.queryProductDetails([widget.inappsku].toSet());
//     if (productDetailResponse.error != null) {
//       setState(() {
//         _queryProductError = productDetailResponse.error!.message;
//         _isAvailable = isAvailable;
//         _products = productDetailResponse.productDetails;
//         _purchases = [];
//         _notFoundIds = productDetailResponse.notFoundIDs;
//         _consumables = [];
//         _purchasePending = false;
//         _loading = false;
//       });
//       return;
//     }

//     if (productDetailResponse.productDetails.isEmpty) {
//       setState(() {
//         _queryProductError = null;
//         _isAvailable = isAvailable;
//         _products = productDetailResponse.productDetails;
//         _purchases = [];
//         _notFoundIds = productDetailResponse.notFoundIDs;
//         _consumables = [];
//         _purchasePending = false;
//         _loading = false;
//       });
//       return;
//     }

//     List<String?> consumables = await ConsumableStore.load();
//     setState(() {
//       _isAvailable = isAvailable;
//       _products = productDetailResponse.productDetails;
//       _notFoundIds = productDetailResponse.notFoundIDs;
//       _consumables = consumables;
//       _purchasePending = false;
//       _loading = false;
//     });
//   }

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }

//   Color color = AppColors.primaryColor;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: context.screenHeight,
//         width: context.screenWidth,
//         decoration: BoxDecoration(),
//         child: _loading
//             ? loading()
//             : Stack(
//                 children: [
//                   _isAvailable
//                       ? Column(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             _buildProductList(),
//                             30.heightBox,
//                             'Subscribe to go ads free & get premium access of Plans'
//                                 .text
//                                 .maxLines(1)
//                                 .center
//                                 .bold
//                                 .black
//                                 .size(20)
//                                 .make()
//                                 .w(context.screenWidth * 0.80),
//                             30.heightBox,
//                             'No, Start with Ads'
//                                 .text
//                                 .underline
//                                 .center
//                                 .heightRelaxed
//                                 .bold
//                                 .black
//                                 .size(24)
//                                 .make()
//                                 .onTap(() async {
//                               context.pop();
//                             }).w(context.screenWidth * 0.75)
//                           ],
//                         ).py(40)
//                       : Column(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             20.heightBox,
//                             'Store is not Available \n Please Check after sometime'
//                                 .text
//                                 .center
//                                 .bold
//                                 .black
//                                 .size(20)
//                                 .makeCentered(),
//                             30.heightBox,
//                             'No, Start with Ads'
//                                 .text
//                                 .underline
//                                 .center
//                                 .heightRelaxed
//                                 .bold
//                                 .color(AppColors.primaryColor)
//                                 .size(24)
//                                 .make()
//                                 .onTap(() async {
//                               context.pop();
//                             }).w(context.screenWidth * 0.75)
//                           ],
//                         ).py(40)
//                 ],
//               ),
//       ),
//     );
//   }

//   Widget _buildProductList() {
//     if (_loading) {
//       return Card(
//           child: (ListTile(
//               leading: CircularProgressIndicator(),
//               title: Text('Fetching products...'))));
//     }
//     if (!_isAvailable) {
//       return Card();
//     }

//     List<Widget> productList = <Widget>[];
//     if (_notFoundIds.isNotEmpty) {
//       productList.add(ListTile(
//           title: Text('[${_notFoundIds.join(", ")}] not found',
//               style: TextStyle(color: ThemeData.light().errorColor)),
//           subtitle: Text('not found')));
//     }

//     // This loading previous purchases code is just a demo. Please do not use this as it is.
//     // In your app you should always verify the purchase data using the `verificationData` inside the [PurchaseDetails] object before trusting it.
//     // We recommend that you use your own server to verify the purchase data.
//     Map<String, PurchaseDetails> purchases =
//         Map.fromEntries(_purchases.map((PurchaseDetails purchase) {
//       if (purchase.pendingCompletePurchase) {
//         _inAppPurchase.completePurchase(purchase);
//       }
//       return MapEntry<String, PurchaseDetails>(purchase.productID, purchase);
//     }));

//     productList.addAll(_products.map(
//       (ProductDetails productDetails) {
//         PurchaseDetails? previousPurchase = purchases[productDetails.id];
//         print((previousPurchase?.productID ?? 'null').toString());
//         return Container(
//           height: 135,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               productDetails.title.text.bold.xl2.make().w(210.w),
//               previousPurchase != null
//                   ? Icon(
//                       Icons.check,
//                       color: Colors.green,
//                     )
//                   : CustomButton(
//                           onpressed: () {
//                             PurchaseParam purchaseParam;

//                             if (Platform.isAndroid) {
//                               final GooglePlayPurchaseDetails? oldSubscription =
//                                   _getOldSubscription(
//                                       productDetails, purchases);

//                               purchaseParam = GooglePlayPurchaseParam(
//                                   productDetails: productDetails,
//                                   applicationUserName: null,
//                                   changeSubscriptionParam: (oldSubscription !=
//                                           null)
//                                       ? ChangeSubscriptionParam(
//                                           oldPurchaseDetails: oldSubscription,
//                                           prorationMode: ProrationMode
//                                               .immediateWithTimeProration,
//                                         )
//                                       : null);
//                             } else {
//                               purchaseParam = PurchaseParam(
//                                 productDetails: productDetails,
//                                 applicationUserName: null,
//                               );
//                             }

//                             if (productDetails.id == widget.inappsku) {
//                               _inAppPurchase.buyConsumable(
//                                   purchaseParam: purchaseParam,
//                                   autoConsume: _kAutoConsume || Platform.isIOS);
//                             } else {
//                               _inAppPurchase.buyNonConsumable(
//                                   purchaseParam: purchaseParam);
//                             }
//                           },
//                           title: productDetails.price)
//                       .h(40)
//                       .w(100)
//             ],
//           ),
//         );
//       },
//     ));

//     return Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: productList)
//         .px(30);
//   }

//   GooglePlayPurchaseDetails? _getOldSubscription(
//       ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {
//     GooglePlayPurchaseDetails? oldSubscription;
//     if (productDetails.id == item1m && purchases[item1m] != null) {
//       oldSubscription = purchases[item1m] as GooglePlayPurchaseDetails;
//     } else if (productDetails.id == item1m && purchases[item3m] != null) {
//       oldSubscription = purchases[item3m] as GooglePlayPurchaseDetails;
//     } else if (productDetails.id == item1y && purchases[item1y] != null) {
//       oldSubscription = purchases[item1y] as GooglePlayPurchaseDetails;
//     }
//     return oldSubscription;
//   }

//   void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
//     purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
//       if (purchaseDetails.status == PurchaseStatus.pending) {
//         setState(() {
//           _purchasePending = true;
//         });
//       } else {
//         if (purchaseDetails.status == PurchaseStatus.error) {
//           setState(() {
//             _purchasePending = false;
//           });
//         } else if (purchaseDetails.status == PurchaseStatus.purchased) {
//           bool valid = await _verifyPurchase(purchaseDetails);
//           if (valid) {
//             deliverProduct(purchaseDetails);
//           } else {
//             // _handleInvalidPurchase(purchaseDetails);
//             return;
//           }
//         }
//         if (purchaseDetails.pendingCompletePurchase) {
//           await _inAppPurchase.completePurchase(purchaseDetails);
//         }
//       }
//     });
//   }

//   Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
//     return Future<bool>.value(true);
//   }

//   void deliverProduct(PurchaseDetails purchaseDetails) async {
//     if (purchaseDetails.productID == widget.inappsku) {
//       await context.read(userDao).getUserfuture().then((value) {
//         context.read(userDao).insertUser(User(
//               id: value.id,
//               age: value.age,
//               ip: false,
//             ));
//       });
//       await ConsumableStore.save(purchaseDetails.purchaseID);

//       List<String?> consumables = await ConsumableStore.load();

//       setState(() {
//         _purchasePending = false;
//         _consumables = consumables;
//       });
//     } else {
//       await context.read(userDao).getUserfuture().then((value) {
//         context.read(userDao).insertUser(User(
//               id: value.id,
//               age: value.age,
//               ip: false,
//             ));
//       });

//       setState(() {
//         _purchases.add(purchaseDetails);

//         _purchasePending = false;
//       });
//     }
//   }
// }
