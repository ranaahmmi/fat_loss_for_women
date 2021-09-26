
class WeeklyProgressTuple {
  int? planId;
  int? weekId;
  int? done;
  WeeklyProgressTuple({
    this.planId,
    this.weekId,
    this.done,
  });

  bool isDone() {
    return done == 1 ? true : false;
  }

  
  Map<String, dynamic> toMap() {
    return {
      'planId': planId,
      'weekId': weekId,
      'done': done,
    };
  }

  factory WeeklyProgressTuple.fromMap(Map<String, dynamic> map) {
  
    return WeeklyProgressTuple(
      planId: map['planId'],
      weekId: map['weekId'],
      done: map['done'],
    );
  } 
}
