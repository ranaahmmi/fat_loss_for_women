import 'dart:convert';
import 'dart:ui';

class ExerciseProgressTuple {
  int? id;
  String? exerciseTitle;
  String? detailLink;
  String? mainMuscleGroup;
  String? otherMuscleGroups;
  String? type;
  String? equipment;
  String? mechanics;
  String? difficulty;
  String? image1Link;
  String? image2Link;
  String? detail;
  String? sets;
  String? repetitions;
  String? videoLink;
  int? progress;
  ExerciseProgressTuple({
    this.id,
    this.exerciseTitle,
    this.detailLink,
    this.mainMuscleGroup,
    this.otherMuscleGroups,
    this.type,
    this.equipment,
    this.mechanics,
    this.difficulty,
    this.image1Link,
    this.image2Link,
    this.detail,
    this.sets,
    this.repetitions,
    this.videoLink,
    this.progress,
  });
  bool isExerciseDone() {
    return progress == 1 ? true : false;
  }

  factory ExerciseProgressTuple.fromMap(Map<String, dynamic> map) {
    return ExerciseProgressTuple(
      id: map['id'],
      exerciseTitle: map['exerciseTitle'],
      detailLink: map['detailLink'],
      mainMuscleGroup: map['mainMuscleGroup'],
      otherMuscleGroups: map['otherMuscleGroups'],
      type: map['type'],
      equipment: map['equipment'],
      mechanics: map['mechanics'],
      difficulty: map['difficulty'],
      image1Link: map['image1Link'],
      image2Link: map['image2Link'],
      detail: map['detail'],
      sets: map['sets'],
      repetitions: map['repetitions'],
      videoLink: map['videoLink'],
      progress: map['progress'],
    );
  }

  ExerciseProgressTuple copyWith({
    int? id,
    String? exerciseTitle,
    String? detailLink,
    String? mainMuscleGroup,
    String? otherMuscleGroups,
    String? type,
    String? equipment,
    String? mechanics,
    String? difficulty,
    String? image1Link,
    String? image2Link,
    String? detail,
    String? sets,
    String? repetitions,
    String? videoLink,
    int? progress,
  }) {
    return ExerciseProgressTuple(
      id: id ?? this.id,
      exerciseTitle: exerciseTitle ?? this.exerciseTitle,
      detailLink: detailLink ?? this.detailLink,
      mainMuscleGroup: mainMuscleGroup ?? this.mainMuscleGroup,
      otherMuscleGroups: otherMuscleGroups ?? this.otherMuscleGroups,
      type: type ?? this.type,
      equipment: equipment ?? this.equipment,
      mechanics: mechanics ?? this.mechanics,
      difficulty: difficulty ?? this.difficulty,
      image1Link: image1Link ?? this.image1Link,
      image2Link: image2Link ?? this.image2Link,
      detail: detail ?? this.detail,
      sets: sets ?? this.sets,
      repetitions: repetitions ?? this.repetitions,
      videoLink: videoLink ?? this.videoLink,
      progress: progress ?? this.progress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exerciseTitle': exerciseTitle,
      'detailLink': detailLink,
      'mainMuscleGroup': mainMuscleGroup,
      'otherMuscleGroups': otherMuscleGroups,
      'type': type,
      'equipment': equipment,
      'mechanics': mechanics,
      'difficulty': difficulty,
      'image1Link': image1Link,
      'image2Link': image2Link,
      'detail': detail,
      'sets': sets,
      'repetitions': repetitions,
      'videoLink': videoLink,
      'progress': progress,
    };
  }

  String toJson() => json.encode(toMap());

  factory ExerciseProgressTuple.fromJson(String source) =>
      ExerciseProgressTuple.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExerciseProgressTuple(id: $id, exerciseTitle: $exerciseTitle, detailLink: $detailLink, mainMuscleGroup: $mainMuscleGroup, otherMuscleGroups: $otherMuscleGroups, type: $type, equipment: $equipment, mechanics: $mechanics, difficulty: $difficulty, image1Link: $image1Link, image2Link: $image2Link, detail: $detail, sets: $sets, repetitions: $repetitions, videoLink: $videoLink, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExerciseProgressTuple &&
        other.id == id &&
        other.exerciseTitle == exerciseTitle &&
        other.detailLink == detailLink &&
        other.mainMuscleGroup == mainMuscleGroup &&
        other.otherMuscleGroups == otherMuscleGroups &&
        other.type == type &&
        other.equipment == equipment &&
        other.mechanics == mechanics &&
        other.difficulty == difficulty &&
        other.image1Link == image1Link &&
        other.image2Link == image2Link &&
        other.detail == detail &&
        other.sets == sets &&
        other.repetitions == repetitions &&
        other.videoLink == videoLink &&
        other.progress == progress;
  }

  @override
  int get hashCode {
    return hashList([
      id,
      exerciseTitle,
      detailLink,
      mainMuscleGroup,
      otherMuscleGroups,
      type,
      equipment,
      mechanics,
      difficulty,
      image1Link,
      image2Link,
      detail,
      sets,
      repetitions,
      videoLink,
      progress,
    ]);
  }
}

class PlanProgressAllDayExercies {
  int? id;
  String? exerciseTitle;
  String? detailLink;
  String? mainMuscleGroup;
  String? otherMuscleGroups;
  String? type;
  String? equipment;
  String? mechanics;
  String? difficulty;
  String? image1Link;
  String? image2Link;
  String? detail;
  String? sets;
  String? repetitions;
  String? videoLink;
  int? progress;
  PlanProgressAllDayExercies({
    this.id,
    this.exerciseTitle,
    this.detailLink,
    this.mainMuscleGroup,
    this.otherMuscleGroups,
    this.type,
    this.equipment,
    this.mechanics,
    this.difficulty,
    this.image1Link,
    this.image2Link,
    this.detail,
    this.sets,
    this.repetitions,
    this.videoLink,
    this.progress,
  });
  bool isExerciseDone() {
    return progress == 1 ? true : false;
  }

  factory PlanProgressAllDayExercies.fromMap(Map<String, dynamic> map) {
    return PlanProgressAllDayExercies(
      id: map['id'],
      exerciseTitle: map['exerciseTitle'],
      detailLink: map['detailLink'],
      mainMuscleGroup: map['mainMuscleGroup'],
      otherMuscleGroups: map['otherMuscleGroups'],
      type: map['type'],
      equipment: map['equipment'],
      mechanics: map['mechanics'],
      difficulty: map['difficulty'],
      image1Link: map['image1Link'],
      image2Link: map['image2Link'],
      detail: map['detail'],
      sets: map['sets'],
      repetitions: map['repetitions'],
      videoLink: map['videoLink'],
      progress: map['progress'],
    );
  }
}
