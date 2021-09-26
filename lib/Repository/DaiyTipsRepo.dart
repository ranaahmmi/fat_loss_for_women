import 'package:fat_loss_for_women/Providers/RiverpodProvider.dart';
import 'package:fat_loss_for_women/Shared/Constants.dart';
import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyTipsRepo {
  Future<List?> getHttps(BuildContext context) async {
    try {
      Response response = await Dio().get("$baseUrl/daily-tip");
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      print(e);
      return [e];
    }
    // String data = await DefaultAssetBundle.of(context)
    //     .loadString("assets/exercises.json");
    // final jsonResult = json.decode(data);
    // return jsonResult;
  }

  addDailyTipsToDatabase(BuildContext context) async {
    final dao = context.read(dailyTipDao);

    // String data =
    //     await DefaultAssetBundle.of(context).loadString("assets/tips.json");
    // final jsonResult = json.decode(data);
    // final dailytipsList = jsonResult.map((e) => DailyTip.fromJson(e)).toList();
    // dailytipsList.forEach((val) {
    //   dao.insertDailyTips(val);
    // });

    await getHttps(context).then((value) {
      final dailytipsList = value!.map((e) => DailyTip.fromJson(e)).toList();
      dailytipsList.forEach((val) {
        dao.insertDailyTips(val);
      });
    });
  }
}
