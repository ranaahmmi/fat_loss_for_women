// To parse this JSON data, do
//
//     final workoutplanRaw = workoutplanRawFromJson(jsonString);

import 'dart:convert';

List<WorkoutplanRaw> workoutplanRawFromJson(String str) =>
    List<WorkoutplanRaw>.from(
        json.decode(str).map((x) => WorkoutplanRaw.fromJson(x)));

String workoutplanRawToJson(List<WorkoutplanRaw> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkoutplanRaw {
  WorkoutplanRaw({
    this.orderNo,
    this.plan,
    this.inAppSku,
    this.planPremium,
  });

  int? orderNo;
  Plan? plan;
  String? inAppSku;
  bool? planPremium;

  factory WorkoutplanRaw.fromJson(Map<String, dynamic> json) => WorkoutplanRaw(
        orderNo: json["orderNo"] == null ? null : json["orderNo"],
        plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
        inAppSku: json["inAppSku"] == null ? null : json["inAppSku"],
        planPremium: json["planPremium"] == null ? null : json["planPremium"],
      );

  Map<String, dynamic> toJson() => {
        "orderNo": orderNo == null ? null : orderNo,
        "plan": plan == null ? null : plan!.toJson(),
        "inAppSku": inAppSku == null ? null : inAppSku,
        "planPremium": planPremium == null ? null : planPremium,
      };
}

class Plan {
  Plan({
    this.insertTimestamp,
    this.updateTimestamp,
    this.id,
    this.planTitle,
    this.inAppPurchaseId,
    this.planPhoto,
    this.planLevel,
    this.workoutTime,
    this.challengeDuration,
    this.aboutPlan,
    this.fastFacts,
    this.planType,
    this.results,
    this.weeks,
    this.active,
    this.planPremium,
  });

  DateTime? insertTimestamp;
  DateTime? updateTimestamp;
  int? id;
  String? planTitle;
  String? inAppPurchaseId;
  String? planPhoto;
  String? planLevel;
  String? workoutTime;
  String? challengeDuration;
  String? aboutPlan;
  String? fastFacts;
  String? planType;
  List<dynamic>? results;
  List<WeekRaw>? weeks;
  bool? active;
  bool? planPremium;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        insertTimestamp: json["insertTimestamp"] == null
            ? null
            : DateTime.parse(json["insertTimestamp"]),
        updateTimestamp: json["updateTimestamp"] == null
            ? null
            : DateTime.parse(json["updateTimestamp"]),
        id: json["id"] == null ? null : json["id"],
        planTitle: json["planTitle"] == null ? null : json["planTitle"],
        inAppPurchaseId:
            json["inAppPurchaseID"] == null ? null : json["inAppPurchaseID"],
        planPhoto: json["planPhoto"] == null ? null : json["planPhoto"],
        planLevel: json["planLevel"] == null ? null : json["planLevel"],
        workoutTime: json["workoutTime"] == null ? null : json["workoutTime"],
        challengeDuration: json["challengeDuration"] == null
            ? null
            : json["challengeDuration"],
        aboutPlan: json["aboutPlan"] == null ? null : json["aboutPlan"],
        fastFacts: json["fastFacts"] == null ? null : json["fastFacts"],
        planType: json["planType"] == null ? null : json["planType"],
        results: json["results"] == null
            ? null
            : List<dynamic>.from(json["results"].map((x) => x)),
        weeks: json["weeks"] == null
            ? null
            : List<WeekRaw>.from(json["weeks"].map((x) => WeekRaw.fromJson(x))),
        active: json["active"] == null ? null : json["active"],
        planPremium: json["planPremium"] == null ? null : json["planPremium"],
      );

  Map<String, dynamic> toJson() => {
        "insertTimestamp":
            insertTimestamp == null ? null : insertTimestamp!.toIso8601String(),
        "updateTimestamp":
            updateTimestamp == null ? null : updateTimestamp!.toIso8601String(),
        "id": id == null ? null : id,
        "planTitle": planTitle == null ? null : planTitle,
        "inAppPurchaseID": inAppPurchaseId == null ? null : inAppPurchaseId,
        "planPhoto": planPhoto == null ? null : planPhoto,
        "planLevel": planLevel == null ? null : planLevel,
        "workoutTime": workoutTime == null ? null : workoutTime,
        "challengeDuration":
            challengeDuration == null ? null : challengeDuration,
        "aboutPlan": aboutPlan == null ? null : aboutPlan,
        "fastFacts": fastFacts == null ? null : fastFacts,
        "planType": planType == null ? null : planType,
        "results":
            results == null ? null : List<dynamic>.from(results!.map((x) => x)),
        "weeks": weeks == null
            ? null
            : List<dynamic>.from(weeks!.map((x) => x.toJson())),
        "active": active == null ? null : active,
        "planPremium": planPremium == null ? null : planPremium,
      };
}

class WeekRaw {
  WeekRaw({
    this.id,
    this.weekTitle,
    this.dayList,
  });

  int? id;
  String? weekTitle;
  List<DayListRaw>? dayList;

  factory WeekRaw.fromJson(Map<String, dynamic> json) => WeekRaw(
        id: json["id"] == null ? null : json["id"],
        weekTitle: json["weekTitle"] == null ? null : json["weekTitle"],
        dayList: json["dayList"] == null
            ? null
            : List<DayListRaw>.from(
                json["dayList"].map((x) => DayListRaw.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "weekTitle": weekTitle == null ? null : weekTitle,
        "dayList": dayList == null
            ? null
            : List<dynamic>.from(dayList!.map((x) => x.toJson())),
      };
}

class DayListRaw {
  DayListRaw({
    this.id,
    this.dayTitle,
    this.exerciseIds,
  });

  int? id;
  String? dayTitle;
  List<ExerciseIdRaw>? exerciseIds;

  factory DayListRaw.fromJson(Map<String, dynamic> json) => DayListRaw(
        id: json["id"] == null ? null : json["id"],
        dayTitle: json["dayTitle"] == null ? null : json["dayTitle"],
        exerciseIds: json["exerciseIds"] == null
            ? null
            : List<ExerciseIdRaw>.from(
                json["exerciseIds"].map((x) => ExerciseIdRaw.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "dayTitle": dayTitle == null ? null : dayTitle,
        "exerciseIds": exerciseIds == null
            ? null
            : List<dynamic>.from(exerciseIds!.map((x) => x.toJson())),
      };
}

class ExerciseIdRaw {
  ExerciseIdRaw({
    this.id,
    this.rep,
    this.timer,
    this.sets,
    this.rest,
  });

  int? id;
  String? rep;
  String? timer;
  String? sets;
  String? rest;

  factory ExerciseIdRaw.fromJson(Map<String, dynamic> json) => ExerciseIdRaw(
        id: json["id"] == null ? null : json["id"].toInt(),
        rep: json["rep"] == null ? null : json["rep"],
        timer: json["timer"] == null ? null : json["timer"],
        sets: json["sets"] == null ? null : json["sets"],
        rest: json["rest"] == null ? "30 sec" : json["rest"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "rep": rep == null ? null : rep,
        "timer": timer == null ? null : timer,
        "sets": sets == null ? null : sets,
        "rest": rest == null ? "30 sec" : rest,
      };
}
