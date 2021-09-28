import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/ExerciseListModal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Style/Colors.dart';

const String appId = '7c19926c-0ebf-45f0-9004-3009113bca48';
const String defaultDate = '2019-01-01T00:00:00';
const String baseUrl = "https://apps.innovidio.com:8443/gym/api";
const String errorUrl =
    'https://upl.stack.com/wp-content/uploads/2020/03/11113000/Morning-Workout.jpg';

Widget loading({Color? color = AppColors.primaryColor}) {
  return Material(
    color: Colors.transparent,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCircle(
            color: color,
            size: 70.0,
          ),
          10.heightBox,
          'please wait'.text.white.bold.xl.makeCentered()
        ],
      ),
    ),
  );
}

int getintFromString(String text) {
  return int.parse(text.replaceAll(new RegExp(r'[^0-9]'), ''));
}

Widget error(Object e, StackTrace? st) {
  return Center(child: 'Error: $e'.text.center.red600.makeCentered());
}

const String item1m = 'item_1m';
const String item3m = 'item_3m';
const String item1y = 'item_1year';
const List<String> kProductIds = <String>[item1m, item3m, item1y];

void printAdDetails(NativeAdController controller) async {
  /// Just for showcasing the ability to access
  /// NativeAd's details via its controller.
  print("------- NATIVE AD DETAILS: -------");
  print(controller.headline);
  print(controller.body);
  print(controller.price);
  print(controller.store);
  print(controller.callToAction);
  print(controller.advertiser);
  print(controller.iconUri);
  print(controller.imagesUri);
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
  print("jkjl");
}

final List<MainScreenCard> getCardList = [
  MainScreenCard(
      title: "ARMS WORKOUTS",
      image: "assets/images/biceps.webp",
      subtext: "3 programmes",
      muscle: armslist,
      headerImage: 'assets/images/armsheader.webp'),
  MainScreenCard(
      title: "ABS WORKOUTS",
      subtext: "3 programmes",
      image: "assets/images/abs.webp",
      headerImage: 'assets/images/absheader.webp',
      muscle: abslist),
  MainScreenCard(
      title: "CHEST WORKOUTS",
      subtext: "3 programmes",
      image: "assets/images/chest.webp",
      headerImage: "assets/images/chestheader.webp",
      muscle: chestlist),
  MainScreenCard(
      title: "BACK WORKOUTS",
      subtext: "3 programmes",
      image: "assets/images/back.webp",
      headerImage: 'assets/images/back.webp',
      muscle: backlist),
  MainScreenCard(
      title: "WINGS WORKOUTS",
      subtext: "2 programmes",
      image: "assets/images/wingsworkoutcard.webp",
      headerImage: 'assets/images/wingsheader.webp',
      muscle: wingslist),
  MainScreenCard(
      title: "LEGS WORKOUTS",
      subtext: "4 programmes",
      image: "assets/images/lowerlegs.webp",
      headerImage: "assets/images/legsheader.webp",
      muscle: legslist),
  MainScreenCard(
      title: "SHOULDERS WORKOUTS",
      subtext: "3 programmes",
      image: "assets/images/shoulders.webp",
      headerImage: "assets/images/shouldersheader.webp",
      muscle: shoulderslist),
  MainScreenCard(
      title: "CARDIO WORKOUTS",
      subtext: "3 programmes",
      image: "assets/images/cardioworkoutcard.webp",
      headerImage: "assets/images/cardioheader.webp",
      muscle: cardiolist)
];

List<ExerciseLists> armslist = [
  ExerciseLists("assets/images/biceps.webp", "Biceps"),
  ExerciseLists("assets/images/triceps.webp", "Triceps"),
  ExerciseLists("assets/images/forearm.webp", "Forearm"),
];
List<ExerciseLists> abslist = [
  ExerciseLists("assets/images/upperabs.webp", "Upper Abs"),
  ExerciseLists("assets/images/lowerabs.webp", "Lower Abs"),
  ExerciseLists("assets/images/sidecutting.webp", "Side Cutting"),
];
List<ExerciseLists> backlist = [
  ExerciseLists("assets/images/upperback.webp", "Upper Back"),
  ExerciseLists("assets/images/lowerback.webp", "Lower Back"),
  ExerciseLists("assets/images/vshapeback.webp", "V-Shape Back"),
];
List<ExerciseLists> wingslist = [
  ExerciseLists("assets/images/vshape.webp", "V-Shape"),
  ExerciseLists("assets/images/wingsextension.webp", "Wing Extentions"),
];
List<ExerciseLists> chestlist = [
  ExerciseLists("assets/images/upperchest.webp", "Upper Chest"),
  ExerciseLists("assets/images/middlechest.webp", "Middle Chest"),
  ExerciseLists("assets/images/lowerchest.webp", "Lower Chest"),
];
List<ExerciseLists> legslist = [
  ExerciseLists("assets/images/frontthighs.webp", "Front Thighs"),
  ExerciseLists("assets/images/backthighs.webp", "Back Thighs"),
  ExerciseLists("assets/images/calfs.webp", "Calfs"),
  ExerciseLists("assets/images/hips.webp", "Hips"),
];
List<ExerciseLists> shoulderslist = [
  ExerciseLists("assets/images/frontshoulder.webp", "Front Shoulders"),
  ExerciseLists("assets/images/backshoulder.webp", "Back Shoulders"),
  ExerciseLists("assets/images/traps.webp", "Traps"),
];
List<ExerciseLists> cardiolist = [
  ExerciseLists("assets/images/aerobic.webp", "Aerobic"),
  ExerciseLists("assets/images/stretching.webp", "Stretching"),
  ExerciseLists("assets/images/yoga.webp", "Yoga"),
];

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

class MainScreenCard {
  final String title;
  final String subtext;
  final String image;
  final String headerImage;
  final List<ExerciseLists> muscle;

  MainScreenCard(
      {required this.title,
      required this.subtext,
      required this.image,
      required this.headerImage,
      required this.muscle});
}

Color getColor(String level) {
  if (level.toLowerCase() == 'beginner')
    return Color(0xff68CEFE);
  else if (level.toLowerCase() == 'intermediate')
    return Color(0xffEFA81B);
  else
    return Color(0xffFF0000);
}

String get nativeAdUnitId {
  /// Always test with test ads
  if (kDebugMode)
    return MobileAds.nativeAdTestUnitId;
  else
    return MobileAds.nativeAdTestUnitId;
}

String get bannerAdUnitId {
  if (kDebugMode)
    return MobileAds.bannerAdTestUnitId;
  else
    return 'ca-app-pub-4044308120454547/2290215717';
}

String get interstitialAdUnitId {
  if (kDebugMode)
    return MobileAds.interstitialAdTestUnitId;
  else
    return MobileAds.interstitialAdTestUnitId;
}
