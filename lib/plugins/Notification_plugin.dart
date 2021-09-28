import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationPlugin {
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  NotificationPlugin() {
    _initializeNotifications();
  }

  void _initializeNotifications() {
    configureLocalTimeZone();

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final initializationSettingsAndroid =
        AndroidInitializationSettings('notification_icon');
    final initializationSettingsIOS = IOSInitializationSettings();
    final initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  NotificationDetails notificationgDetails = const NotificationDetails(
      android: AndroidNotificationDetails('other custom channel id',
          'other custom channel name', 'other custom channel description',
          icon: 'water',
          largeIcon: const DrawableResourceAndroidBitmap('water'),
          enableLights: true,
          enableVibration: true,
          importance: Importance.max,
          color: AppColors.blue,
          ledColor: AppColors.blue,
          ledOnMs: 1000,
          ledOffMs: 500,
          priority: Priority.high,
          ticker: 'ticker'));

  Future configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    return currentTimeZone;
  }

  Future onSelectNotification(
    String? payload,
  ) async {
    if (payload != null) {
      print('notification payload: ' + payload);
    }
  }

  Future<List<PendingNotificationRequest>> getScheduledNotifications() async {
    final pendingNotifications =
        await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
    return pendingNotifications;
  }

  Future<void> zonedScheduleNotification(
      {required int id,
      String? title,
      String? description,
      required tz.TZDateTime time}) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id, title, description, time, notificationgDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> showFirebaseNotification({
    required int id,
    String? title,
    String? description,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
        id, title, description, notificationgDetails);
  }

  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  // Future<String> _downloadAndSaveFile(String url, String fileName) async {
  //   final Directory directory = await getApplicationDocumentsDirectory();
  //   final String filePath = '${directory.path}/$fileName';
  //   final http.Response response = await http.get(Uri.parse(url));
  //   final File file = File(filePath);
  //   await file.writeAsBytes(response.bodyBytes);
  //   return filePath;
  // }

//..................//Picture
  Future<void> showBigPictureNotificationHiddenLargeIcon(
      int id, String title, int hours, int mint) async {
    // final String largeIconPath = await _downloadAndSaveFile(
    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcKSb3UMbQMDWNpC_eqHVWMkv-exV9HPoCeQ&usqp=CAU',
    //     'largeIcon');
    // final String bigPicturePath = await _downloadAndSaveFile(
    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcKSb3UMbQMDWNpC_eqHVWMkv-exV9HPoCeQ&usqp=CAU',
    //     'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(DrawableResourceAndroidBitmap('app_icon'),
            // hideExpandedLargeIcon: true,

            htmlFormatContentTitle: true,
            // summaryText: 'summary <i>text</i>',
            htmlFormatSummaryText: true);
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('big text channel id',
            'big text channel name', 'big text channel description',
            largeIcon: DrawableResourceAndroidBitmap('app_icon'),
            styleInformation: bigPictureStyleInformation);

    _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        null,
        await _nextInstance(hours, mint),
        NotificationDetails(android: androidPlatformChannelSpecifics),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: 'water');
  }

  Future<void> showNotificationWithNoBody() async {
    await _flutterLocalNotificationsPlugin
        .show(0, 'plain title', null, notificationgDetails, payload: 'item x');
  }

//.....................//
  Future<void> timeToDrinkWaterDailyNotification(
      int id, String title, String description, int hours, int mint) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      description,
      await _nextInstance(hours, mint),
      notificationgDetails,
      androidAllowWhileIdle: true,
      payload: 'WaterScreen',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> workoutDailyNotification(
      int id, String title, String description, int hours, int mint) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      description,
      await _nextInstance(hours, mint),
      const NotificationDetails(
          android: AndroidNotificationDetails('other custom channel id',
              'other custom channel name', 'other custom channel description',
              icon: 'plan',
              largeIcon: const DrawableResourceAndroidBitmap('workout'),
              enableLights: true,
              enableVibration: true,
              importance: Importance.max,
              color: AppColors.blue,
              ledColor: AppColors.blue,
              ledOnMs: 1000,
              ledOffMs: 500,
              priority: Priority.high,
              ticker: 'ticker')),
      androidAllowWhileIdle: true,
      payload: '',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<tz.TZDateTime> _nextInstance(int hours, int mint) async {
    print(tz.local);
    final tz.TZDateTime now =
        tz.TZDateTime.now(tz.getLocation(await (configureLocalTimeZone())));
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hours, mint);
    print(scheduledDate);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
