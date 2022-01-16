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

const String item1m = 'p_item_5.99';

const Set<String> kProductIds = <String>{item1m};

void printAdDetails(NativeAdController controller) async {
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
}

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
    return "ca-app-pub-4044308120454547/7644381337";
}

String get interstitialAdUnitId {
  if (kDebugMode)
    return MobileAds.interstitialAdTestUnitId;
  else
    return "ca-app-pub-4044308120454547/4381274819";
}
