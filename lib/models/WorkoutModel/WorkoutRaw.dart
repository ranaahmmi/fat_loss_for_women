import 'dart:convert';

import 'package:fat_loss_for_women/models/WorkoutModel/workoutPlanRaw.dart';

List<WorkoutRaw> workoutFromJson(String str) =>
    List<WorkoutRaw>.from(json.decode(str).map((x) => WorkoutRaw.fromJson(x)));

String workoutToJson(List<WorkoutRaw> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkoutRaw {
  WorkoutRaw({
    this.orderNo,
    this.workout,
    this.inAppSku,
    this.planPremium,
  });

  int? orderNo;
  WorkoutClass? workout;
  String? inAppSku;
  bool? planPremium;

  factory WorkoutRaw.fromJson(Map<String, dynamic> json) => WorkoutRaw(
        orderNo: json["orderNo"] == null ? null : json["orderNo"],
        workout: json["workout"] == null
            ? null
            : WorkoutClass.fromJson(json["workout"]),
        inAppSku: json["inAppSku"] == null ? null : json["inAppSku"],
        planPremium: json["planPremium"] == null ? null : json["planPremium"],
      );

  Map<String, dynamic> toJson() => {
        "orderNo": orderNo == null ? null : orderNo,
        "workout": workout == null ? null : workout!.toJson(),
        "inAppSku": inAppSku == null ? null : inAppSku,
        "planPremium": planPremium == null ? null : planPremium,
      };
}

class WorkoutClass {
  WorkoutClass({
    this.insertTimestamp,
    this.updateTimestamp,
    this.id,
    this.workoutTitle,
    this.workoutPhoto,
    this.workoutLevel,
    this.workoutTime,
    this.aboutWorkout,
    this.active,
    this.exercises,
  });

  DateTime? insertTimestamp;
  DateTime? updateTimestamp;
  int? id;
  String? workoutTitle;
  String? workoutPhoto;
  String? workoutLevel;
  String? workoutTime;
  String? aboutWorkout;
  bool? active;
  List<ExerciseIdRaw>? exercises;

  factory WorkoutClass.fromJson(Map<String, dynamic> json) => WorkoutClass(
        insertTimestamp: json["insertTimestamp"] == null
            ? null
            : DateTime.parse(json["insertTimestamp"]),
        updateTimestamp: json["updateTimestamp"] == null
            ? null
            : DateTime.parse(json["updateTimestamp"]),
        id: json["id"] == null ? null : json["id"],
        workoutTitle:
            json["workoutTitle"] == null ? null : json["workoutTitle"],
        workoutPhoto:
            json["workoutPhoto"] == null ? null : json["workoutPhoto"],
        workoutLevel:
            json["workoutLevel"] == null ? null : json["workoutLevel"],
        workoutTime: json["workoutTime"] == null ? null : json["workoutTime"],
        aboutWorkout:
            json["aboutWorkout"] == null ? null : json["aboutWorkout"],
        active: json["active"] == null ? null : json["active"],
        exercises: json["exercises"] == null
            ? null
            : List<ExerciseIdRaw>.from(
                json["exercises"].map((x) => ExerciseIdRaw.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "insertTimestamp":
            insertTimestamp == null ? null : insertTimestamp!.toIso8601String(),
        "updateTimestamp":
            updateTimestamp == null ? null : updateTimestamp!.toIso8601String(),
        "id": id == null ? null : id,
        "workoutTitle": workoutTitle == null ? null : workoutTitle,
        "workoutPhoto": workoutPhoto == null ? null : workoutPhoto,
        "workoutLevel": workoutLevel == null ? null : workoutLevel,
        "workoutTime": workoutTime == null ? null : workoutTime,
        "aboutWorkout": aboutWorkout == null ? null : aboutWorkout,
        "active": active == null ? null : active,
        "exercises": exercises == null
            ? null
            : List<dynamic>.from(exercises!.map((x) => x.toJson())),
      };
}
