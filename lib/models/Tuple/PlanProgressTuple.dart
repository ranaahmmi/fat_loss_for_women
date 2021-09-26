class PlanProgressTuple {
  int? planId;
  double? planProgress;
  PlanProgressTuple({
    this.planId,
    this.planProgress,
  });

  Map<String, dynamic> toMap() {
    return {
      'planId': planId,
      'planProgress': planProgress,
    };
  }

  factory PlanProgressTuple.fromMap(Map<String, dynamic> map) {
    return PlanProgressTuple(
      planId: map['planId'],
      planProgress: map['planProgress'],
    );
  }
}

class DayProgressTuple {
  int? planId;
  int? weekId;
  int? dayId;
  double? planProgress;
  DayProgressTuple({
    this.planId,
    this.dayId,
    this.weekId,
    this.planProgress,
  });

  Map<String, dynamic> toMap() {
    return {
      'planid': planId,
      'weekid': weekId,
      'dayid': dayId,
      'day_progress': planProgress,
    };
  }

  factory DayProgressTuple.fromMap(Map<String, dynamic> map) {
    return DayProgressTuple(
      planId: map['planid'],
      weekId: map['weekid'],
      dayId: map['dayid'],
      planProgress: map['day_progress'],
    );
  }
}

class WorkoutProgressTuple {
  int? workoutId;
  double? workoutProgress;
  WorkoutProgressTuple({
    this.workoutId,
    this.workoutProgress,
  });

  Map<String, dynamic> toMap() {
    return {
      'workoutid': workoutId,
      'workoutProgress': workoutProgress,
    };
  }

  factory WorkoutProgressTuple.fromMap(Map<String, dynamic> map) {
    return WorkoutProgressTuple(
      workoutId: map['workoutid'],
      workoutProgress: map['workoutProgress'],
    );
  }
}
class WorkoutExerciseProgressTuple {
  int? exerciseid;
  double? workoutProgress;
  WorkoutExerciseProgressTuple({
    this.exerciseid,
    this.workoutProgress,
  });

  Map<String, dynamic> toMap() {
    return {
      'exercise_id': exerciseid,
      'progress': workoutProgress,
    };
  }

  factory WorkoutExerciseProgressTuple.fromMap(Map<String, dynamic> map) {
    return WorkoutExerciseProgressTuple(
      exerciseid: map['exercise_id'],
      workoutProgress: map['progress'],
    );
  }
}


class DayExercisesProgressTuple {
  int? progress;
  int? exerciseId;
  DayExercisesProgressTuple({this.progress, this.exerciseId});

  Map<String, dynamic> toMap() {
    return {
      'progress': progress,
      'exercise_id': exerciseId,
    };
  }

  factory DayExercisesProgressTuple.fromMap(Map<String, dynamic> map) {
    return DayExercisesProgressTuple(
      progress: map['progress'],
      exerciseId: map['exercise_id'],
    );
  }
}
