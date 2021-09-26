class DailyProgressTuple {
  int? planId;
  int? weekId;
  int? dayId;
  int? done;
  DailyProgressTuple({
    this.planId,
    this.weekId,
    this.dayId,
    this.done,
  });

  bool isDone() {
    return done == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {
    return {
      'planid': planId,
      'weekid': weekId,
      'dayid': dayId,
      'done': done,
    };
  }

  factory DailyProgressTuple.fromMap(Map<String, dynamic> map) {
   

    return DailyProgressTuple(
      planId: map['planid'],
      weekId: map['weekid'],
      dayId: map['dayid'],
      done: map['done'],
    );
  }
}
