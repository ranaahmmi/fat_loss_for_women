import 'dart:convert';

class PlanSubsription {
  int? planID;

    bool? isSubscribed;
  PlanSubsription({
    this.planID,
    this.isSubscribed,
  });

  PlanSubsription copyWith({
    int? planID,
    bool? isSubscribed,
  }) {
    return PlanSubsription(
      planID: planID ?? this.planID,
      isSubscribed: isSubscribed ?? this.isSubscribed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'planID': planID,
      'isSubscribed': isSubscribed,
    };
  }

  factory PlanSubsription.fromMap(Map<String, dynamic>? map) {
  
    return PlanSubsription(
      planID: map?['planID'],
      isSubscribed: map?['isSubscribed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanSubsription.fromJson(String source) => PlanSubsription.fromMap(json.decode(source));

  @override
  String toString() => 'PlanSubsription(planID: $planID, isSubscribed: $isSubscribed)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is PlanSubsription &&
      o.planID == planID &&
      o.isSubscribed == isSubscribed;
  }

  @override
  int get hashCode => planID.hashCode ^ isSubscribed.hashCode;
}
