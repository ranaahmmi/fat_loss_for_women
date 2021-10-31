// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class WorkoutPlan extends DataClass implements Insertable<WorkoutPlan> {
  final int id;
  final String? insertTimestamp;
  final String? updateTimestamp;
  final String? planTitle;
  final String? planPhoto;
  final String? planLevel;
  final String? workoutTime;
  final String? challengeDuration;
  final String? aboutPlan;
  final String? fastFacts;
  final String? inAppPurchaseID;
  final String? planType;
  final bool? active;
  final bool? isnew;
  final bool? planPremium;
  WorkoutPlan(
      {required this.id,
      this.insertTimestamp,
      this.updateTimestamp,
      this.planTitle,
      this.planPhoto,
      this.planLevel,
      this.workoutTime,
      this.challengeDuration,
      this.aboutPlan,
      this.fastFacts,
      this.inAppPurchaseID,
      this.planType,
      this.active,
      this.isnew,
      this.planPremium});
  factory WorkoutPlan.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return WorkoutPlan(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      insertTimestamp: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}insert_timestamp']),
      updateTimestamp: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}update_timestamp']),
      planTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}plan_title']),
      planPhoto: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}plan_photo']),
      planLevel: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}plan_level']),
      workoutTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}workout_time']),
      challengeDuration: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}challenge_duration']),
      aboutPlan: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}about_plan']),
      fastFacts: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fast_facts']),
      inAppPurchaseID: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}in_app_purchase_i_d']),
      planType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}plan_type']),
      active: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}active']),
      isnew: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}isnew']),
      planPremium: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}plan_premium']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || insertTimestamp != null) {
      map['insert_timestamp'] = Variable<String?>(insertTimestamp);
    }
    if (!nullToAbsent || updateTimestamp != null) {
      map['update_timestamp'] = Variable<String?>(updateTimestamp);
    }
    if (!nullToAbsent || planTitle != null) {
      map['plan_title'] = Variable<String?>(planTitle);
    }
    if (!nullToAbsent || planPhoto != null) {
      map['plan_photo'] = Variable<String?>(planPhoto);
    }
    if (!nullToAbsent || planLevel != null) {
      map['plan_level'] = Variable<String?>(planLevel);
    }
    if (!nullToAbsent || workoutTime != null) {
      map['workout_time'] = Variable<String?>(workoutTime);
    }
    if (!nullToAbsent || challengeDuration != null) {
      map['challenge_duration'] = Variable<String?>(challengeDuration);
    }
    if (!nullToAbsent || aboutPlan != null) {
      map['about_plan'] = Variable<String?>(aboutPlan);
    }
    if (!nullToAbsent || fastFacts != null) {
      map['fast_facts'] = Variable<String?>(fastFacts);
    }
    if (!nullToAbsent || inAppPurchaseID != null) {
      map['in_app_purchase_i_d'] = Variable<String?>(inAppPurchaseID);
    }
    if (!nullToAbsent || planType != null) {
      map['plan_type'] = Variable<String?>(planType);
    }
    if (!nullToAbsent || active != null) {
      map['active'] = Variable<bool?>(active);
    }
    if (!nullToAbsent || isnew != null) {
      map['isnew'] = Variable<bool?>(isnew);
    }
    if (!nullToAbsent || planPremium != null) {
      map['plan_premium'] = Variable<bool?>(planPremium);
    }
    return map;
  }

  WorkoutPlansCompanion toCompanion(bool nullToAbsent) {
    return WorkoutPlansCompanion(
      id: Value(id),
      insertTimestamp: insertTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(insertTimestamp),
      updateTimestamp: updateTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(updateTimestamp),
      planTitle: planTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(planTitle),
      planPhoto: planPhoto == null && nullToAbsent
          ? const Value.absent()
          : Value(planPhoto),
      planLevel: planLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(planLevel),
      workoutTime: workoutTime == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutTime),
      challengeDuration: challengeDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(challengeDuration),
      aboutPlan: aboutPlan == null && nullToAbsent
          ? const Value.absent()
          : Value(aboutPlan),
      fastFacts: fastFacts == null && nullToAbsent
          ? const Value.absent()
          : Value(fastFacts),
      inAppPurchaseID: inAppPurchaseID == null && nullToAbsent
          ? const Value.absent()
          : Value(inAppPurchaseID),
      planType: planType == null && nullToAbsent
          ? const Value.absent()
          : Value(planType),
      active:
          active == null && nullToAbsent ? const Value.absent() : Value(active),
      isnew:
          isnew == null && nullToAbsent ? const Value.absent() : Value(isnew),
      planPremium: planPremium == null && nullToAbsent
          ? const Value.absent()
          : Value(planPremium),
    );
  }

  factory WorkoutPlan.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WorkoutPlan(
      id: serializer.fromJson<int>(json['id']),
      insertTimestamp: serializer.fromJson<String?>(json['insertTimestamp']),
      updateTimestamp: serializer.fromJson<String?>(json['updateTimestamp']),
      planTitle: serializer.fromJson<String?>(json['planTitle']),
      planPhoto: serializer.fromJson<String?>(json['planPhoto']),
      planLevel: serializer.fromJson<String?>(json['planLevel']),
      workoutTime: serializer.fromJson<String?>(json['workoutTime']),
      challengeDuration:
          serializer.fromJson<String?>(json['challengeDuration']),
      aboutPlan: serializer.fromJson<String?>(json['aboutPlan']),
      fastFacts: serializer.fromJson<String?>(json['fastFacts']),
      inAppPurchaseID: serializer.fromJson<String?>(json['inAppPurchaseID']),
      planType: serializer.fromJson<String?>(json['planType']),
      active: serializer.fromJson<bool?>(json['active']),
      isnew: serializer.fromJson<bool?>(json['isnew']),
      planPremium: serializer.fromJson<bool?>(json['planPremium']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'insertTimestamp': serializer.toJson<String?>(insertTimestamp),
      'updateTimestamp': serializer.toJson<String?>(updateTimestamp),
      'planTitle': serializer.toJson<String?>(planTitle),
      'planPhoto': serializer.toJson<String?>(planPhoto),
      'planLevel': serializer.toJson<String?>(planLevel),
      'workoutTime': serializer.toJson<String?>(workoutTime),
      'challengeDuration': serializer.toJson<String?>(challengeDuration),
      'aboutPlan': serializer.toJson<String?>(aboutPlan),
      'fastFacts': serializer.toJson<String?>(fastFacts),
      'inAppPurchaseID': serializer.toJson<String?>(inAppPurchaseID),
      'planType': serializer.toJson<String?>(planType),
      'active': serializer.toJson<bool?>(active),
      'isnew': serializer.toJson<bool?>(isnew),
      'planPremium': serializer.toJson<bool?>(planPremium),
    };
  }

  WorkoutPlan copyWith(
          {int? id,
          String? insertTimestamp,
          String? updateTimestamp,
          String? planTitle,
          String? planPhoto,
          String? planLevel,
          String? workoutTime,
          String? challengeDuration,
          String? aboutPlan,
          String? fastFacts,
          String? inAppPurchaseID,
          String? planType,
          bool? active,
          bool? isnew,
          bool? planPremium}) =>
      WorkoutPlan(
        id: id ?? this.id,
        insertTimestamp: insertTimestamp ?? this.insertTimestamp,
        updateTimestamp: updateTimestamp ?? this.updateTimestamp,
        planTitle: planTitle ?? this.planTitle,
        planPhoto: planPhoto ?? this.planPhoto,
        planLevel: planLevel ?? this.planLevel,
        workoutTime: workoutTime ?? this.workoutTime,
        challengeDuration: challengeDuration ?? this.challengeDuration,
        aboutPlan: aboutPlan ?? this.aboutPlan,
        fastFacts: fastFacts ?? this.fastFacts,
        inAppPurchaseID: inAppPurchaseID ?? this.inAppPurchaseID,
        planType: planType ?? this.planType,
        active: active ?? this.active,
        isnew: isnew ?? this.isnew,
        planPremium: planPremium ?? this.planPremium,
      );
  @override
  String toString() {
    return (StringBuffer('WorkoutPlan(')
          ..write('id: $id, ')
          ..write('insertTimestamp: $insertTimestamp, ')
          ..write('updateTimestamp: $updateTimestamp, ')
          ..write('planTitle: $planTitle, ')
          ..write('planPhoto: $planPhoto, ')
          ..write('planLevel: $planLevel, ')
          ..write('workoutTime: $workoutTime, ')
          ..write('challengeDuration: $challengeDuration, ')
          ..write('aboutPlan: $aboutPlan, ')
          ..write('fastFacts: $fastFacts, ')
          ..write('inAppPurchaseID: $inAppPurchaseID, ')
          ..write('planType: $planType, ')
          ..write('active: $active, ')
          ..write('isnew: $isnew, ')
          ..write('planPremium: $planPremium')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          insertTimestamp.hashCode,
          $mrjc(
              updateTimestamp.hashCode,
              $mrjc(
                  planTitle.hashCode,
                  $mrjc(
                      planPhoto.hashCode,
                      $mrjc(
                          planLevel.hashCode,
                          $mrjc(
                              workoutTime.hashCode,
                              $mrjc(
                                  challengeDuration.hashCode,
                                  $mrjc(
                                      aboutPlan.hashCode,
                                      $mrjc(
                                          fastFacts.hashCode,
                                          $mrjc(
                                              inAppPurchaseID.hashCode,
                                              $mrjc(
                                                  planType.hashCode,
                                                  $mrjc(
                                                      active.hashCode,
                                                      $mrjc(
                                                          isnew.hashCode,
                                                          planPremium
                                                              .hashCode)))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutPlan &&
          other.id == this.id &&
          other.insertTimestamp == this.insertTimestamp &&
          other.updateTimestamp == this.updateTimestamp &&
          other.planTitle == this.planTitle &&
          other.planPhoto == this.planPhoto &&
          other.planLevel == this.planLevel &&
          other.workoutTime == this.workoutTime &&
          other.challengeDuration == this.challengeDuration &&
          other.aboutPlan == this.aboutPlan &&
          other.fastFacts == this.fastFacts &&
          other.inAppPurchaseID == this.inAppPurchaseID &&
          other.planType == this.planType &&
          other.active == this.active &&
          other.isnew == this.isnew &&
          other.planPremium == this.planPremium);
}

class WorkoutPlansCompanion extends UpdateCompanion<WorkoutPlan> {
  final Value<int> id;
  final Value<String?> insertTimestamp;
  final Value<String?> updateTimestamp;
  final Value<String?> planTitle;
  final Value<String?> planPhoto;
  final Value<String?> planLevel;
  final Value<String?> workoutTime;
  final Value<String?> challengeDuration;
  final Value<String?> aboutPlan;
  final Value<String?> fastFacts;
  final Value<String?> inAppPurchaseID;
  final Value<String?> planType;
  final Value<bool?> active;
  final Value<bool?> isnew;
  final Value<bool?> planPremium;
  const WorkoutPlansCompanion({
    this.id = const Value.absent(),
    this.insertTimestamp = const Value.absent(),
    this.updateTimestamp = const Value.absent(),
    this.planTitle = const Value.absent(),
    this.planPhoto = const Value.absent(),
    this.planLevel = const Value.absent(),
    this.workoutTime = const Value.absent(),
    this.challengeDuration = const Value.absent(),
    this.aboutPlan = const Value.absent(),
    this.fastFacts = const Value.absent(),
    this.inAppPurchaseID = const Value.absent(),
    this.planType = const Value.absent(),
    this.active = const Value.absent(),
    this.isnew = const Value.absent(),
    this.planPremium = const Value.absent(),
  });
  WorkoutPlansCompanion.insert({
    this.id = const Value.absent(),
    this.insertTimestamp = const Value.absent(),
    this.updateTimestamp = const Value.absent(),
    this.planTitle = const Value.absent(),
    this.planPhoto = const Value.absent(),
    this.planLevel = const Value.absent(),
    this.workoutTime = const Value.absent(),
    this.challengeDuration = const Value.absent(),
    this.aboutPlan = const Value.absent(),
    this.fastFacts = const Value.absent(),
    this.inAppPurchaseID = const Value.absent(),
    this.planType = const Value.absent(),
    this.active = const Value.absent(),
    this.isnew = const Value.absent(),
    this.planPremium = const Value.absent(),
  });
  static Insertable<WorkoutPlan> custom({
    Expression<int>? id,
    Expression<String?>? insertTimestamp,
    Expression<String?>? updateTimestamp,
    Expression<String?>? planTitle,
    Expression<String?>? planPhoto,
    Expression<String?>? planLevel,
    Expression<String?>? workoutTime,
    Expression<String?>? challengeDuration,
    Expression<String?>? aboutPlan,
    Expression<String?>? fastFacts,
    Expression<String?>? inAppPurchaseID,
    Expression<String?>? planType,
    Expression<bool?>? active,
    Expression<bool?>? isnew,
    Expression<bool?>? planPremium,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (insertTimestamp != null) 'insert_timestamp': insertTimestamp,
      if (updateTimestamp != null) 'update_timestamp': updateTimestamp,
      if (planTitle != null) 'plan_title': planTitle,
      if (planPhoto != null) 'plan_photo': planPhoto,
      if (planLevel != null) 'plan_level': planLevel,
      if (workoutTime != null) 'workout_time': workoutTime,
      if (challengeDuration != null) 'challenge_duration': challengeDuration,
      if (aboutPlan != null) 'about_plan': aboutPlan,
      if (fastFacts != null) 'fast_facts': fastFacts,
      if (inAppPurchaseID != null) 'in_app_purchase_i_d': inAppPurchaseID,
      if (planType != null) 'plan_type': planType,
      if (active != null) 'active': active,
      if (isnew != null) 'isnew': isnew,
      if (planPremium != null) 'plan_premium': planPremium,
    });
  }

  WorkoutPlansCompanion copyWith(
      {Value<int>? id,
      Value<String?>? insertTimestamp,
      Value<String?>? updateTimestamp,
      Value<String?>? planTitle,
      Value<String?>? planPhoto,
      Value<String?>? planLevel,
      Value<String?>? workoutTime,
      Value<String?>? challengeDuration,
      Value<String?>? aboutPlan,
      Value<String?>? fastFacts,
      Value<String?>? inAppPurchaseID,
      Value<String?>? planType,
      Value<bool?>? active,
      Value<bool?>? isnew,
      Value<bool?>? planPremium}) {
    return WorkoutPlansCompanion(
      id: id ?? this.id,
      insertTimestamp: insertTimestamp ?? this.insertTimestamp,
      updateTimestamp: updateTimestamp ?? this.updateTimestamp,
      planTitle: planTitle ?? this.planTitle,
      planPhoto: planPhoto ?? this.planPhoto,
      planLevel: planLevel ?? this.planLevel,
      workoutTime: workoutTime ?? this.workoutTime,
      challengeDuration: challengeDuration ?? this.challengeDuration,
      aboutPlan: aboutPlan ?? this.aboutPlan,
      fastFacts: fastFacts ?? this.fastFacts,
      inAppPurchaseID: inAppPurchaseID ?? this.inAppPurchaseID,
      planType: planType ?? this.planType,
      active: active ?? this.active,
      isnew: isnew ?? this.isnew,
      planPremium: planPremium ?? this.planPremium,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (insertTimestamp.present) {
      map['insert_timestamp'] = Variable<String?>(insertTimestamp.value);
    }
    if (updateTimestamp.present) {
      map['update_timestamp'] = Variable<String?>(updateTimestamp.value);
    }
    if (planTitle.present) {
      map['plan_title'] = Variable<String?>(planTitle.value);
    }
    if (planPhoto.present) {
      map['plan_photo'] = Variable<String?>(planPhoto.value);
    }
    if (planLevel.present) {
      map['plan_level'] = Variable<String?>(planLevel.value);
    }
    if (workoutTime.present) {
      map['workout_time'] = Variable<String?>(workoutTime.value);
    }
    if (challengeDuration.present) {
      map['challenge_duration'] = Variable<String?>(challengeDuration.value);
    }
    if (aboutPlan.present) {
      map['about_plan'] = Variable<String?>(aboutPlan.value);
    }
    if (fastFacts.present) {
      map['fast_facts'] = Variable<String?>(fastFacts.value);
    }
    if (inAppPurchaseID.present) {
      map['in_app_purchase_i_d'] = Variable<String?>(inAppPurchaseID.value);
    }
    if (planType.present) {
      map['plan_type'] = Variable<String?>(planType.value);
    }
    if (active.present) {
      map['active'] = Variable<bool?>(active.value);
    }
    if (isnew.present) {
      map['isnew'] = Variable<bool?>(isnew.value);
    }
    if (planPremium.present) {
      map['plan_premium'] = Variable<bool?>(planPremium.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlansCompanion(')
          ..write('id: $id, ')
          ..write('insertTimestamp: $insertTimestamp, ')
          ..write('updateTimestamp: $updateTimestamp, ')
          ..write('planTitle: $planTitle, ')
          ..write('planPhoto: $planPhoto, ')
          ..write('planLevel: $planLevel, ')
          ..write('workoutTime: $workoutTime, ')
          ..write('challengeDuration: $challengeDuration, ')
          ..write('aboutPlan: $aboutPlan, ')
          ..write('fastFacts: $fastFacts, ')
          ..write('inAppPurchaseID: $inAppPurchaseID, ')
          ..write('planType: $planType, ')
          ..write('active: $active, ')
          ..write('isnew: $isnew, ')
          ..write('planPremium: $planPremium')
          ..write(')'))
        .toString();
  }
}

class $WorkoutPlansTable extends WorkoutPlans
    with TableInfo<$WorkoutPlansTable, WorkoutPlan> {
  final GeneratedDatabase _db;
  final String? _alias;
  $WorkoutPlansTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _insertTimestampMeta =
      const VerificationMeta('insertTimestamp');
  late final GeneratedColumn<String?> insertTimestamp =
      GeneratedColumn<String?>('insert_timestamp', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _updateTimestampMeta =
      const VerificationMeta('updateTimestamp');
  late final GeneratedColumn<String?> updateTimestamp =
      GeneratedColumn<String?>('update_timestamp', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _planTitleMeta = const VerificationMeta('planTitle');
  late final GeneratedColumn<String?> planTitle = GeneratedColumn<String?>(
      'plan_title', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _planPhotoMeta = const VerificationMeta('planPhoto');
  late final GeneratedColumn<String?> planPhoto = GeneratedColumn<String?>(
      'plan_photo', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _planLevelMeta = const VerificationMeta('planLevel');
  late final GeneratedColumn<String?> planLevel = GeneratedColumn<String?>(
      'plan_level', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _workoutTimeMeta =
      const VerificationMeta('workoutTime');
  late final GeneratedColumn<String?> workoutTime = GeneratedColumn<String?>(
      'workout_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _challengeDurationMeta =
      const VerificationMeta('challengeDuration');
  late final GeneratedColumn<String?> challengeDuration =
      GeneratedColumn<String?>('challenge_duration', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _aboutPlanMeta = const VerificationMeta('aboutPlan');
  late final GeneratedColumn<String?> aboutPlan = GeneratedColumn<String?>(
      'about_plan', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _fastFactsMeta = const VerificationMeta('fastFacts');
  late final GeneratedColumn<String?> fastFacts = GeneratedColumn<String?>(
      'fast_facts', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _inAppPurchaseIDMeta =
      const VerificationMeta('inAppPurchaseID');
  late final GeneratedColumn<String?> inAppPurchaseID =
      GeneratedColumn<String?>('in_app_purchase_i_d', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _planTypeMeta = const VerificationMeta('planType');
  late final GeneratedColumn<String?> planType = GeneratedColumn<String?>(
      'plan_type', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _activeMeta = const VerificationMeta('active');
  late final GeneratedColumn<bool?> active = GeneratedColumn<bool?>(
      'active', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (active IN (0, 1))');
  final VerificationMeta _isnewMeta = const VerificationMeta('isnew');
  late final GeneratedColumn<bool?> isnew = GeneratedColumn<bool?>(
      'isnew', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (isnew IN (0, 1))');
  final VerificationMeta _planPremiumMeta =
      const VerificationMeta('planPremium');
  late final GeneratedColumn<bool?> planPremium = GeneratedColumn<bool?>(
      'plan_premium', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (plan_premium IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        insertTimestamp,
        updateTimestamp,
        planTitle,
        planPhoto,
        planLevel,
        workoutTime,
        challengeDuration,
        aboutPlan,
        fastFacts,
        inAppPurchaseID,
        planType,
        active,
        isnew,
        planPremium
      ];
  @override
  String get aliasedName => _alias ?? 'workout_plans';
  @override
  String get actualTableName => 'workout_plans';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutPlan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('insert_timestamp')) {
      context.handle(
          _insertTimestampMeta,
          insertTimestamp.isAcceptableOrUnknown(
              data['insert_timestamp']!, _insertTimestampMeta));
    }
    if (data.containsKey('update_timestamp')) {
      context.handle(
          _updateTimestampMeta,
          updateTimestamp.isAcceptableOrUnknown(
              data['update_timestamp']!, _updateTimestampMeta));
    }
    if (data.containsKey('plan_title')) {
      context.handle(_planTitleMeta,
          planTitle.isAcceptableOrUnknown(data['plan_title']!, _planTitleMeta));
    }
    if (data.containsKey('plan_photo')) {
      context.handle(_planPhotoMeta,
          planPhoto.isAcceptableOrUnknown(data['plan_photo']!, _planPhotoMeta));
    }
    if (data.containsKey('plan_level')) {
      context.handle(_planLevelMeta,
          planLevel.isAcceptableOrUnknown(data['plan_level']!, _planLevelMeta));
    }
    if (data.containsKey('workout_time')) {
      context.handle(
          _workoutTimeMeta,
          workoutTime.isAcceptableOrUnknown(
              data['workout_time']!, _workoutTimeMeta));
    }
    if (data.containsKey('challenge_duration')) {
      context.handle(
          _challengeDurationMeta,
          challengeDuration.isAcceptableOrUnknown(
              data['challenge_duration']!, _challengeDurationMeta));
    }
    if (data.containsKey('about_plan')) {
      context.handle(_aboutPlanMeta,
          aboutPlan.isAcceptableOrUnknown(data['about_plan']!, _aboutPlanMeta));
    }
    if (data.containsKey('fast_facts')) {
      context.handle(_fastFactsMeta,
          fastFacts.isAcceptableOrUnknown(data['fast_facts']!, _fastFactsMeta));
    }
    if (data.containsKey('in_app_purchase_i_d')) {
      context.handle(
          _inAppPurchaseIDMeta,
          inAppPurchaseID.isAcceptableOrUnknown(
              data['in_app_purchase_i_d']!, _inAppPurchaseIDMeta));
    }
    if (data.containsKey('plan_type')) {
      context.handle(_planTypeMeta,
          planType.isAcceptableOrUnknown(data['plan_type']!, _planTypeMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('isnew')) {
      context.handle(
          _isnewMeta, isnew.isAcceptableOrUnknown(data['isnew']!, _isnewMeta));
    }
    if (data.containsKey('plan_premium')) {
      context.handle(
          _planPremiumMeta,
          planPremium.isAcceptableOrUnknown(
              data['plan_premium']!, _planPremiumMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    return WorkoutPlan.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WorkoutPlansTable createAlias(String alias) {
    return $WorkoutPlansTable(_db, alias);
  }
}

class Week extends DataClass implements Insertable<Week> {
  final int weekid;
  final int planid;
  final String? weekTitle;
  Week({required this.weekid, required this.planid, this.weekTitle});
  factory Week.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Week(
      weekid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weekid'])!,
      planid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}planid'])!,
      weekTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}week_title']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['weekid'] = Variable<int>(weekid);
    map['planid'] = Variable<int>(planid);
    if (!nullToAbsent || weekTitle != null) {
      map['week_title'] = Variable<String?>(weekTitle);
    }
    return map;
  }

  WeeksCompanion toCompanion(bool nullToAbsent) {
    return WeeksCompanion(
      weekid: Value(weekid),
      planid: Value(planid),
      weekTitle: weekTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(weekTitle),
    );
  }

  factory Week.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Week(
      weekid: serializer.fromJson<int>(json['weekid']),
      planid: serializer.fromJson<int>(json['planid']),
      weekTitle: serializer.fromJson<String?>(json['weekTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'weekid': serializer.toJson<int>(weekid),
      'planid': serializer.toJson<int>(planid),
      'weekTitle': serializer.toJson<String?>(weekTitle),
    };
  }

  Week copyWith({int? weekid, int? planid, String? weekTitle}) => Week(
        weekid: weekid ?? this.weekid,
        planid: planid ?? this.planid,
        weekTitle: weekTitle ?? this.weekTitle,
      );
  @override
  String toString() {
    return (StringBuffer('Week(')
          ..write('weekid: $weekid, ')
          ..write('planid: $planid, ')
          ..write('weekTitle: $weekTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(weekid.hashCode, $mrjc(planid.hashCode, weekTitle.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Week &&
          other.weekid == this.weekid &&
          other.planid == this.planid &&
          other.weekTitle == this.weekTitle);
}

class WeeksCompanion extends UpdateCompanion<Week> {
  final Value<int> weekid;
  final Value<int> planid;
  final Value<String?> weekTitle;
  const WeeksCompanion({
    this.weekid = const Value.absent(),
    this.planid = const Value.absent(),
    this.weekTitle = const Value.absent(),
  });
  WeeksCompanion.insert({
    required int weekid,
    required int planid,
    this.weekTitle = const Value.absent(),
  })  : weekid = Value(weekid),
        planid = Value(planid);
  static Insertable<Week> custom({
    Expression<int>? weekid,
    Expression<int>? planid,
    Expression<String?>? weekTitle,
  }) {
    return RawValuesInsertable({
      if (weekid != null) 'weekid': weekid,
      if (planid != null) 'planid': planid,
      if (weekTitle != null) 'week_title': weekTitle,
    });
  }

  WeeksCompanion copyWith(
      {Value<int>? weekid, Value<int>? planid, Value<String?>? weekTitle}) {
    return WeeksCompanion(
      weekid: weekid ?? this.weekid,
      planid: planid ?? this.planid,
      weekTitle: weekTitle ?? this.weekTitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (weekid.present) {
      map['weekid'] = Variable<int>(weekid.value);
    }
    if (planid.present) {
      map['planid'] = Variable<int>(planid.value);
    }
    if (weekTitle.present) {
      map['week_title'] = Variable<String?>(weekTitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeeksCompanion(')
          ..write('weekid: $weekid, ')
          ..write('planid: $planid, ')
          ..write('weekTitle: $weekTitle')
          ..write(')'))
        .toString();
  }
}

class $WeeksTable extends Weeks with TableInfo<$WeeksTable, Week> {
  final GeneratedDatabase _db;
  final String? _alias;
  $WeeksTable(this._db, [this._alias]);
  final VerificationMeta _weekidMeta = const VerificationMeta('weekid');
  late final GeneratedColumn<int?> weekid = GeneratedColumn<int?>(
      'weekid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _planidMeta = const VerificationMeta('planid');
  late final GeneratedColumn<int?> planid = GeneratedColumn<int?>(
      'planid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _weekTitleMeta = const VerificationMeta('weekTitle');
  late final GeneratedColumn<String?> weekTitle = GeneratedColumn<String?>(
      'week_title', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [weekid, planid, weekTitle];
  @override
  String get aliasedName => _alias ?? 'weeks';
  @override
  String get actualTableName => 'weeks';
  @override
  VerificationContext validateIntegrity(Insertable<Week> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('weekid')) {
      context.handle(_weekidMeta,
          weekid.isAcceptableOrUnknown(data['weekid']!, _weekidMeta));
    } else if (isInserting) {
      context.missing(_weekidMeta);
    }
    if (data.containsKey('planid')) {
      context.handle(_planidMeta,
          planid.isAcceptableOrUnknown(data['planid']!, _planidMeta));
    } else if (isInserting) {
      context.missing(_planidMeta);
    }
    if (data.containsKey('week_title')) {
      context.handle(_weekTitleMeta,
          weekTitle.isAcceptableOrUnknown(data['week_title']!, _weekTitleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {weekid, planid};
  @override
  Week map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Week.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WeeksTable createAlias(String alias) {
    return $WeeksTable(_db, alias);
  }
}

class Day extends DataClass implements Insertable<Day> {
  final int id;
  final int weekid;
  final int planid;
  final String? daytitle;
  Day(
      {required this.id,
      required this.weekid,
      required this.planid,
      this.daytitle});
  factory Day.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Day(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      weekid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weekid'])!,
      planid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}planid'])!,
      daytitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}daytitle']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['weekid'] = Variable<int>(weekid);
    map['planid'] = Variable<int>(planid);
    if (!nullToAbsent || daytitle != null) {
      map['daytitle'] = Variable<String?>(daytitle);
    }
    return map;
  }

  DaysCompanion toCompanion(bool nullToAbsent) {
    return DaysCompanion(
      id: Value(id),
      weekid: Value(weekid),
      planid: Value(planid),
      daytitle: daytitle == null && nullToAbsent
          ? const Value.absent()
          : Value(daytitle),
    );
  }

  factory Day.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Day(
      id: serializer.fromJson<int>(json['id']),
      weekid: serializer.fromJson<int>(json['weekid']),
      planid: serializer.fromJson<int>(json['planid']),
      daytitle: serializer.fromJson<String?>(json['daytitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weekid': serializer.toJson<int>(weekid),
      'planid': serializer.toJson<int>(planid),
      'daytitle': serializer.toJson<String?>(daytitle),
    };
  }

  Day copyWith({int? id, int? weekid, int? planid, String? daytitle}) => Day(
        id: id ?? this.id,
        weekid: weekid ?? this.weekid,
        planid: planid ?? this.planid,
        daytitle: daytitle ?? this.daytitle,
      );
  @override
  String toString() {
    return (StringBuffer('Day(')
          ..write('id: $id, ')
          ..write('weekid: $weekid, ')
          ..write('planid: $planid, ')
          ..write('daytitle: $daytitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(weekid.hashCode, $mrjc(planid.hashCode, daytitle.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Day &&
          other.id == this.id &&
          other.weekid == this.weekid &&
          other.planid == this.planid &&
          other.daytitle == this.daytitle);
}

class DaysCompanion extends UpdateCompanion<Day> {
  final Value<int> id;
  final Value<int> weekid;
  final Value<int> planid;
  final Value<String?> daytitle;
  const DaysCompanion({
    this.id = const Value.absent(),
    this.weekid = const Value.absent(),
    this.planid = const Value.absent(),
    this.daytitle = const Value.absent(),
  });
  DaysCompanion.insert({
    required int id,
    required int weekid,
    required int planid,
    this.daytitle = const Value.absent(),
  })  : id = Value(id),
        weekid = Value(weekid),
        planid = Value(planid);
  static Insertable<Day> custom({
    Expression<int>? id,
    Expression<int>? weekid,
    Expression<int>? planid,
    Expression<String?>? daytitle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weekid != null) 'weekid': weekid,
      if (planid != null) 'planid': planid,
      if (daytitle != null) 'daytitle': daytitle,
    });
  }

  DaysCompanion copyWith(
      {Value<int>? id,
      Value<int>? weekid,
      Value<int>? planid,
      Value<String?>? daytitle}) {
    return DaysCompanion(
      id: id ?? this.id,
      weekid: weekid ?? this.weekid,
      planid: planid ?? this.planid,
      daytitle: daytitle ?? this.daytitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weekid.present) {
      map['weekid'] = Variable<int>(weekid.value);
    }
    if (planid.present) {
      map['planid'] = Variable<int>(planid.value);
    }
    if (daytitle.present) {
      map['daytitle'] = Variable<String?>(daytitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DaysCompanion(')
          ..write('id: $id, ')
          ..write('weekid: $weekid, ')
          ..write('planid: $planid, ')
          ..write('daytitle: $daytitle')
          ..write(')'))
        .toString();
  }
}

class $DaysTable extends Days with TableInfo<$DaysTable, Day> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DaysTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _weekidMeta = const VerificationMeta('weekid');
  late final GeneratedColumn<int?> weekid = GeneratedColumn<int?>(
      'weekid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _planidMeta = const VerificationMeta('planid');
  late final GeneratedColumn<int?> planid = GeneratedColumn<int?>(
      'planid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _daytitleMeta = const VerificationMeta('daytitle');
  late final GeneratedColumn<String?> daytitle = GeneratedColumn<String?>(
      'daytitle', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, weekid, planid, daytitle];
  @override
  String get aliasedName => _alias ?? 'days';
  @override
  String get actualTableName => 'days';
  @override
  VerificationContext validateIntegrity(Insertable<Day> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('weekid')) {
      context.handle(_weekidMeta,
          weekid.isAcceptableOrUnknown(data['weekid']!, _weekidMeta));
    } else if (isInserting) {
      context.missing(_weekidMeta);
    }
    if (data.containsKey('planid')) {
      context.handle(_planidMeta,
          planid.isAcceptableOrUnknown(data['planid']!, _planidMeta));
    } else if (isInserting) {
      context.missing(_planidMeta);
    }
    if (data.containsKey('daytitle')) {
      context.handle(_daytitleMeta,
          daytitle.isAcceptableOrUnknown(data['daytitle']!, _daytitleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, weekid, planid};
  @override
  Day map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Day.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DaysTable createAlias(String alias) {
    return $DaysTable(_db, alias);
  }
}

class ExerciseId extends DataClass implements Insertable<ExerciseId> {
  final int exerciseid;
  final int weekid;
  final int dayid;
  final int planid;
  final String? sets;
  final String? rep;
  final String? timer;
  final String? restTime;
  ExerciseId(
      {required this.exerciseid,
      required this.weekid,
      required this.dayid,
      required this.planid,
      this.sets,
      this.rep,
      this.timer,
      this.restTime});
  factory ExerciseId.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ExerciseId(
      exerciseid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}exerciseid'])!,
      weekid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weekid'])!,
      dayid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dayid'])!,
      planid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}planid'])!,
      sets: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sets']),
      rep: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rep']),
      timer: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timer']),
      restTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rest_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['exerciseid'] = Variable<int>(exerciseid);
    map['weekid'] = Variable<int>(weekid);
    map['dayid'] = Variable<int>(dayid);
    map['planid'] = Variable<int>(planid);
    if (!nullToAbsent || sets != null) {
      map['sets'] = Variable<String?>(sets);
    }
    if (!nullToAbsent || rep != null) {
      map['rep'] = Variable<String?>(rep);
    }
    if (!nullToAbsent || timer != null) {
      map['timer'] = Variable<String?>(timer);
    }
    if (!nullToAbsent || restTime != null) {
      map['rest_time'] = Variable<String?>(restTime);
    }
    return map;
  }

  ExerciseIdsCompanion toCompanion(bool nullToAbsent) {
    return ExerciseIdsCompanion(
      exerciseid: Value(exerciseid),
      weekid: Value(weekid),
      dayid: Value(dayid),
      planid: Value(planid),
      sets: sets == null && nullToAbsent ? const Value.absent() : Value(sets),
      rep: rep == null && nullToAbsent ? const Value.absent() : Value(rep),
      timer:
          timer == null && nullToAbsent ? const Value.absent() : Value(timer),
      restTime: restTime == null && nullToAbsent
          ? const Value.absent()
          : Value(restTime),
    );
  }

  factory ExerciseId.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExerciseId(
      exerciseid: serializer.fromJson<int>(json['exerciseid']),
      weekid: serializer.fromJson<int>(json['weekid']),
      dayid: serializer.fromJson<int>(json['dayid']),
      planid: serializer.fromJson<int>(json['planid']),
      sets: serializer.fromJson<String?>(json['sets']),
      rep: serializer.fromJson<String?>(json['rep']),
      timer: serializer.fromJson<String?>(json['timer']),
      restTime: serializer.fromJson<String?>(json['restTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'exerciseid': serializer.toJson<int>(exerciseid),
      'weekid': serializer.toJson<int>(weekid),
      'dayid': serializer.toJson<int>(dayid),
      'planid': serializer.toJson<int>(planid),
      'sets': serializer.toJson<String?>(sets),
      'rep': serializer.toJson<String?>(rep),
      'timer': serializer.toJson<String?>(timer),
      'restTime': serializer.toJson<String?>(restTime),
    };
  }

  ExerciseId copyWith(
          {int? exerciseid,
          int? weekid,
          int? dayid,
          int? planid,
          String? sets,
          String? rep,
          String? timer,
          String? restTime}) =>
      ExerciseId(
        exerciseid: exerciseid ?? this.exerciseid,
        weekid: weekid ?? this.weekid,
        dayid: dayid ?? this.dayid,
        planid: planid ?? this.planid,
        sets: sets ?? this.sets,
        rep: rep ?? this.rep,
        timer: timer ?? this.timer,
        restTime: restTime ?? this.restTime,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseId(')
          ..write('exerciseid: $exerciseid, ')
          ..write('weekid: $weekid, ')
          ..write('dayid: $dayid, ')
          ..write('planid: $planid, ')
          ..write('sets: $sets, ')
          ..write('rep: $rep, ')
          ..write('timer: $timer, ')
          ..write('restTime: $restTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      exerciseid.hashCode,
      $mrjc(
          weekid.hashCode,
          $mrjc(
              dayid.hashCode,
              $mrjc(
                  planid.hashCode,
                  $mrjc(
                      sets.hashCode,
                      $mrjc(rep.hashCode,
                          $mrjc(timer.hashCode, restTime.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseId &&
          other.exerciseid == this.exerciseid &&
          other.weekid == this.weekid &&
          other.dayid == this.dayid &&
          other.planid == this.planid &&
          other.sets == this.sets &&
          other.rep == this.rep &&
          other.timer == this.timer &&
          other.restTime == this.restTime);
}

class ExerciseIdsCompanion extends UpdateCompanion<ExerciseId> {
  final Value<int> exerciseid;
  final Value<int> weekid;
  final Value<int> dayid;
  final Value<int> planid;
  final Value<String?> sets;
  final Value<String?> rep;
  final Value<String?> timer;
  final Value<String?> restTime;
  const ExerciseIdsCompanion({
    this.exerciseid = const Value.absent(),
    this.weekid = const Value.absent(),
    this.dayid = const Value.absent(),
    this.planid = const Value.absent(),
    this.sets = const Value.absent(),
    this.rep = const Value.absent(),
    this.timer = const Value.absent(),
    this.restTime = const Value.absent(),
  });
  ExerciseIdsCompanion.insert({
    required int exerciseid,
    required int weekid,
    required int dayid,
    required int planid,
    this.sets = const Value.absent(),
    this.rep = const Value.absent(),
    this.timer = const Value.absent(),
    this.restTime = const Value.absent(),
  })  : exerciseid = Value(exerciseid),
        weekid = Value(weekid),
        dayid = Value(dayid),
        planid = Value(planid);
  static Insertable<ExerciseId> custom({
    Expression<int>? exerciseid,
    Expression<int>? weekid,
    Expression<int>? dayid,
    Expression<int>? planid,
    Expression<String?>? sets,
    Expression<String?>? rep,
    Expression<String?>? timer,
    Expression<String?>? restTime,
  }) {
    return RawValuesInsertable({
      if (exerciseid != null) 'exerciseid': exerciseid,
      if (weekid != null) 'weekid': weekid,
      if (dayid != null) 'dayid': dayid,
      if (planid != null) 'planid': planid,
      if (sets != null) 'sets': sets,
      if (rep != null) 'rep': rep,
      if (timer != null) 'timer': timer,
      if (restTime != null) 'rest_time': restTime,
    });
  }

  ExerciseIdsCompanion copyWith(
      {Value<int>? exerciseid,
      Value<int>? weekid,
      Value<int>? dayid,
      Value<int>? planid,
      Value<String?>? sets,
      Value<String?>? rep,
      Value<String?>? timer,
      Value<String?>? restTime}) {
    return ExerciseIdsCompanion(
      exerciseid: exerciseid ?? this.exerciseid,
      weekid: weekid ?? this.weekid,
      dayid: dayid ?? this.dayid,
      planid: planid ?? this.planid,
      sets: sets ?? this.sets,
      rep: rep ?? this.rep,
      timer: timer ?? this.timer,
      restTime: restTime ?? this.restTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (exerciseid.present) {
      map['exerciseid'] = Variable<int>(exerciseid.value);
    }
    if (weekid.present) {
      map['weekid'] = Variable<int>(weekid.value);
    }
    if (dayid.present) {
      map['dayid'] = Variable<int>(dayid.value);
    }
    if (planid.present) {
      map['planid'] = Variable<int>(planid.value);
    }
    if (sets.present) {
      map['sets'] = Variable<String?>(sets.value);
    }
    if (rep.present) {
      map['rep'] = Variable<String?>(rep.value);
    }
    if (timer.present) {
      map['timer'] = Variable<String?>(timer.value);
    }
    if (restTime.present) {
      map['rest_time'] = Variable<String?>(restTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseIdsCompanion(')
          ..write('exerciseid: $exerciseid, ')
          ..write('weekid: $weekid, ')
          ..write('dayid: $dayid, ')
          ..write('planid: $planid, ')
          ..write('sets: $sets, ')
          ..write('rep: $rep, ')
          ..write('timer: $timer, ')
          ..write('restTime: $restTime')
          ..write(')'))
        .toString();
  }
}

class $ExerciseIdsTable extends ExerciseIds
    with TableInfo<$ExerciseIdsTable, ExerciseId> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ExerciseIdsTable(this._db, [this._alias]);
  final VerificationMeta _exerciseidMeta = const VerificationMeta('exerciseid');
  late final GeneratedColumn<int?> exerciseid = GeneratedColumn<int?>(
      'exerciseid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _weekidMeta = const VerificationMeta('weekid');
  late final GeneratedColumn<int?> weekid = GeneratedColumn<int?>(
      'weekid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _dayidMeta = const VerificationMeta('dayid');
  late final GeneratedColumn<int?> dayid = GeneratedColumn<int?>(
      'dayid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _planidMeta = const VerificationMeta('planid');
  late final GeneratedColumn<int?> planid = GeneratedColumn<int?>(
      'planid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _setsMeta = const VerificationMeta('sets');
  late final GeneratedColumn<String?> sets = GeneratedColumn<String?>(
      'sets', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _repMeta = const VerificationMeta('rep');
  late final GeneratedColumn<String?> rep = GeneratedColumn<String?>(
      'rep', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _timerMeta = const VerificationMeta('timer');
  late final GeneratedColumn<String?> timer = GeneratedColumn<String?>(
      'timer', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _restTimeMeta = const VerificationMeta('restTime');
  late final GeneratedColumn<String?> restTime = GeneratedColumn<String?>(
      'rest_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [exerciseid, weekid, dayid, planid, sets, rep, timer, restTime];
  @override
  String get aliasedName => _alias ?? 'exercise_ids';
  @override
  String get actualTableName => 'exercise_ids';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseId> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('exerciseid')) {
      context.handle(
          _exerciseidMeta,
          exerciseid.isAcceptableOrUnknown(
              data['exerciseid']!, _exerciseidMeta));
    } else if (isInserting) {
      context.missing(_exerciseidMeta);
    }
    if (data.containsKey('weekid')) {
      context.handle(_weekidMeta,
          weekid.isAcceptableOrUnknown(data['weekid']!, _weekidMeta));
    } else if (isInserting) {
      context.missing(_weekidMeta);
    }
    if (data.containsKey('dayid')) {
      context.handle(
          _dayidMeta, dayid.isAcceptableOrUnknown(data['dayid']!, _dayidMeta));
    } else if (isInserting) {
      context.missing(_dayidMeta);
    }
    if (data.containsKey('planid')) {
      context.handle(_planidMeta,
          planid.isAcceptableOrUnknown(data['planid']!, _planidMeta));
    } else if (isInserting) {
      context.missing(_planidMeta);
    }
    if (data.containsKey('sets')) {
      context.handle(
          _setsMeta, sets.isAcceptableOrUnknown(data['sets']!, _setsMeta));
    }
    if (data.containsKey('rep')) {
      context.handle(
          _repMeta, rep.isAcceptableOrUnknown(data['rep']!, _repMeta));
    }
    if (data.containsKey('timer')) {
      context.handle(
          _timerMeta, timer.isAcceptableOrUnknown(data['timer']!, _timerMeta));
    }
    if (data.containsKey('rest_time')) {
      context.handle(_restTimeMeta,
          restTime.isAcceptableOrUnknown(data['rest_time']!, _restTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {exerciseid, weekid, dayid, planid};
  @override
  ExerciseId map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ExerciseId.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ExerciseIdsTable createAlias(String alias) {
    return $ExerciseIdsTable(_db, alias);
  }
}

class ExerciseProgres extends DataClass implements Insertable<ExerciseProgres> {
  final int planid;
  final int weekid;
  final int dayid;
  final int exerciseId;
  final int progress;
  ExerciseProgres(
      {required this.planid,
      required this.weekid,
      required this.dayid,
      required this.exerciseId,
      required this.progress});
  factory ExerciseProgres.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ExerciseProgres(
      planid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}planid'])!,
      weekid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weekid'])!,
      dayid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dayid'])!,
      exerciseId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_id'])!,
      progress: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}progress'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['planid'] = Variable<int>(planid);
    map['weekid'] = Variable<int>(weekid);
    map['dayid'] = Variable<int>(dayid);
    map['exercise_id'] = Variable<int>(exerciseId);
    map['progress'] = Variable<int>(progress);
    return map;
  }

  ExerciseProgressCompanion toCompanion(bool nullToAbsent) {
    return ExerciseProgressCompanion(
      planid: Value(planid),
      weekid: Value(weekid),
      dayid: Value(dayid),
      exerciseId: Value(exerciseId),
      progress: Value(progress),
    );
  }

  factory ExerciseProgres.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExerciseProgres(
      planid: serializer.fromJson<int>(json['planid']),
      weekid: serializer.fromJson<int>(json['weekid']),
      dayid: serializer.fromJson<int>(json['dayid']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      progress: serializer.fromJson<int>(json['progress']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'planid': serializer.toJson<int>(planid),
      'weekid': serializer.toJson<int>(weekid),
      'dayid': serializer.toJson<int>(dayid),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'progress': serializer.toJson<int>(progress),
    };
  }

  ExerciseProgres copyWith(
          {int? planid,
          int? weekid,
          int? dayid,
          int? exerciseId,
          int? progress}) =>
      ExerciseProgres(
        planid: planid ?? this.planid,
        weekid: weekid ?? this.weekid,
        dayid: dayid ?? this.dayid,
        exerciseId: exerciseId ?? this.exerciseId,
        progress: progress ?? this.progress,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseProgres(')
          ..write('planid: $planid, ')
          ..write('weekid: $weekid, ')
          ..write('dayid: $dayid, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('progress: $progress')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      planid.hashCode,
      $mrjc(
          weekid.hashCode,
          $mrjc(
              dayid.hashCode, $mrjc(exerciseId.hashCode, progress.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseProgres &&
          other.planid == this.planid &&
          other.weekid == this.weekid &&
          other.dayid == this.dayid &&
          other.exerciseId == this.exerciseId &&
          other.progress == this.progress);
}

class ExerciseProgressCompanion extends UpdateCompanion<ExerciseProgres> {
  final Value<int> planid;
  final Value<int> weekid;
  final Value<int> dayid;
  final Value<int> exerciseId;
  final Value<int> progress;
  const ExerciseProgressCompanion({
    this.planid = const Value.absent(),
    this.weekid = const Value.absent(),
    this.dayid = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.progress = const Value.absent(),
  });
  ExerciseProgressCompanion.insert({
    required int planid,
    required int weekid,
    required int dayid,
    required int exerciseId,
    required int progress,
  })  : planid = Value(planid),
        weekid = Value(weekid),
        dayid = Value(dayid),
        exerciseId = Value(exerciseId),
        progress = Value(progress);
  static Insertable<ExerciseProgres> custom({
    Expression<int>? planid,
    Expression<int>? weekid,
    Expression<int>? dayid,
    Expression<int>? exerciseId,
    Expression<int>? progress,
  }) {
    return RawValuesInsertable({
      if (planid != null) 'planid': planid,
      if (weekid != null) 'weekid': weekid,
      if (dayid != null) 'dayid': dayid,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (progress != null) 'progress': progress,
    });
  }

  ExerciseProgressCompanion copyWith(
      {Value<int>? planid,
      Value<int>? weekid,
      Value<int>? dayid,
      Value<int>? exerciseId,
      Value<int>? progress}) {
    return ExerciseProgressCompanion(
      planid: planid ?? this.planid,
      weekid: weekid ?? this.weekid,
      dayid: dayid ?? this.dayid,
      exerciseId: exerciseId ?? this.exerciseId,
      progress: progress ?? this.progress,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (planid.present) {
      map['planid'] = Variable<int>(planid.value);
    }
    if (weekid.present) {
      map['weekid'] = Variable<int>(weekid.value);
    }
    if (dayid.present) {
      map['dayid'] = Variable<int>(dayid.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseProgressCompanion(')
          ..write('planid: $planid, ')
          ..write('weekid: $weekid, ')
          ..write('dayid: $dayid, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('progress: $progress')
          ..write(')'))
        .toString();
  }
}

class $ExerciseProgressTable extends ExerciseProgress
    with TableInfo<$ExerciseProgressTable, ExerciseProgres> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ExerciseProgressTable(this._db, [this._alias]);
  final VerificationMeta _planidMeta = const VerificationMeta('planid');
  late final GeneratedColumn<int?> planid = GeneratedColumn<int?>(
      'planid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _weekidMeta = const VerificationMeta('weekid');
  late final GeneratedColumn<int?> weekid = GeneratedColumn<int?>(
      'weekid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _dayidMeta = const VerificationMeta('dayid');
  late final GeneratedColumn<int?> dayid = GeneratedColumn<int?>(
      'dayid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _exerciseIdMeta = const VerificationMeta('exerciseId');
  late final GeneratedColumn<int?> exerciseId = GeneratedColumn<int?>(
      'exercise_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _progressMeta = const VerificationMeta('progress');
  late final GeneratedColumn<int?> progress = GeneratedColumn<int?>(
      'progress', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [planid, weekid, dayid, exerciseId, progress];
  @override
  String get aliasedName => _alias ?? 'exercise_progress';
  @override
  String get actualTableName => 'exercise_progress';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseProgres> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('planid')) {
      context.handle(_planidMeta,
          planid.isAcceptableOrUnknown(data['planid']!, _planidMeta));
    } else if (isInserting) {
      context.missing(_planidMeta);
    }
    if (data.containsKey('weekid')) {
      context.handle(_weekidMeta,
          weekid.isAcceptableOrUnknown(data['weekid']!, _weekidMeta));
    } else if (isInserting) {
      context.missing(_weekidMeta);
    }
    if (data.containsKey('dayid')) {
      context.handle(
          _dayidMeta, dayid.isAcceptableOrUnknown(data['dayid']!, _dayidMeta));
    } else if (isInserting) {
      context.missing(_dayidMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {weekid, dayid, planid, exerciseId};
  @override
  ExerciseProgres map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ExerciseProgres.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ExerciseProgressTable createAlias(String alias) {
    return $ExerciseProgressTable(_db, alias);
  }
}

class WorkoutExerciseProgres extends DataClass
    implements Insertable<WorkoutExerciseProgres> {
  final int workoutid;
  final int exerciseId;
  final int progress;
  WorkoutExerciseProgres(
      {required this.workoutid,
      required this.exerciseId,
      required this.progress});
  factory WorkoutExerciseProgres.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return WorkoutExerciseProgres(
      workoutid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}workoutid'])!,
      exerciseId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_id'])!,
      progress: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}progress'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['workoutid'] = Variable<int>(workoutid);
    map['exercise_id'] = Variable<int>(exerciseId);
    map['progress'] = Variable<int>(progress);
    return map;
  }

  WorkoutExerciseProgressCompanion toCompanion(bool nullToAbsent) {
    return WorkoutExerciseProgressCompanion(
      workoutid: Value(workoutid),
      exerciseId: Value(exerciseId),
      progress: Value(progress),
    );
  }

  factory WorkoutExerciseProgres.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WorkoutExerciseProgres(
      workoutid: serializer.fromJson<int>(json['workoutid']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      progress: serializer.fromJson<int>(json['progress']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workoutid': serializer.toJson<int>(workoutid),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'progress': serializer.toJson<int>(progress),
    };
  }

  WorkoutExerciseProgres copyWith(
          {int? workoutid, int? exerciseId, int? progress}) =>
      WorkoutExerciseProgres(
        workoutid: workoutid ?? this.workoutid,
        exerciseId: exerciseId ?? this.exerciseId,
        progress: progress ?? this.progress,
      );
  @override
  String toString() {
    return (StringBuffer('WorkoutExerciseProgres(')
          ..write('workoutid: $workoutid, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('progress: $progress')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(workoutid.hashCode, $mrjc(exerciseId.hashCode, progress.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutExerciseProgres &&
          other.workoutid == this.workoutid &&
          other.exerciseId == this.exerciseId &&
          other.progress == this.progress);
}

class WorkoutExerciseProgressCompanion
    extends UpdateCompanion<WorkoutExerciseProgres> {
  final Value<int> workoutid;
  final Value<int> exerciseId;
  final Value<int> progress;
  const WorkoutExerciseProgressCompanion({
    this.workoutid = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.progress = const Value.absent(),
  });
  WorkoutExerciseProgressCompanion.insert({
    required int workoutid,
    required int exerciseId,
    required int progress,
  })  : workoutid = Value(workoutid),
        exerciseId = Value(exerciseId),
        progress = Value(progress);
  static Insertable<WorkoutExerciseProgres> custom({
    Expression<int>? workoutid,
    Expression<int>? exerciseId,
    Expression<int>? progress,
  }) {
    return RawValuesInsertable({
      if (workoutid != null) 'workoutid': workoutid,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (progress != null) 'progress': progress,
    });
  }

  WorkoutExerciseProgressCompanion copyWith(
      {Value<int>? workoutid, Value<int>? exerciseId, Value<int>? progress}) {
    return WorkoutExerciseProgressCompanion(
      workoutid: workoutid ?? this.workoutid,
      exerciseId: exerciseId ?? this.exerciseId,
      progress: progress ?? this.progress,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workoutid.present) {
      map['workoutid'] = Variable<int>(workoutid.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutExerciseProgressCompanion(')
          ..write('workoutid: $workoutid, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('progress: $progress')
          ..write(')'))
        .toString();
  }
}

class $WorkoutExerciseProgressTable extends WorkoutExerciseProgress
    with TableInfo<$WorkoutExerciseProgressTable, WorkoutExerciseProgres> {
  final GeneratedDatabase _db;
  final String? _alias;
  $WorkoutExerciseProgressTable(this._db, [this._alias]);
  final VerificationMeta _workoutidMeta = const VerificationMeta('workoutid');
  late final GeneratedColumn<int?> workoutid = GeneratedColumn<int?>(
      'workoutid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _exerciseIdMeta = const VerificationMeta('exerciseId');
  late final GeneratedColumn<int?> exerciseId = GeneratedColumn<int?>(
      'exercise_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _progressMeta = const VerificationMeta('progress');
  late final GeneratedColumn<int?> progress = GeneratedColumn<int?>(
      'progress', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [workoutid, exerciseId, progress];
  @override
  String get aliasedName => _alias ?? 'workout_exercise_progress';
  @override
  String get actualTableName => 'workout_exercise_progress';
  @override
  VerificationContext validateIntegrity(
      Insertable<WorkoutExerciseProgres> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('workoutid')) {
      context.handle(_workoutidMeta,
          workoutid.isAcceptableOrUnknown(data['workoutid']!, _workoutidMeta));
    } else if (isInserting) {
      context.missing(_workoutidMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workoutid, exerciseId};
  @override
  WorkoutExerciseProgres map(Map<String, dynamic> data, {String? tablePrefix}) {
    return WorkoutExerciseProgres.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WorkoutExerciseProgressTable createAlias(String alias) {
    return $WorkoutExerciseProgressTable(_db, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final int id;
  final String? tags;
  final String? exerciseTitle;
  final String? time;
  final String? restTime;
  final String? mainBodyGroup;
  final String? detailLink;
  final String? mainMuscleGroup;
  final String? otherMuscleGroups;
  final String? type;
  final String? equipment;
  final String? mechanics;
  final String? difficulty;
  final String? image1Link;
  final String? image2Link;
  final String? detail;
  final String? sets;
  final String? repetitions;
  final String? videoLink;
  Exercise(
      {required this.id,
      this.tags,
      this.exerciseTitle,
      this.time,
      this.restTime,
      this.mainBodyGroup,
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
      this.videoLink});
  factory Exercise.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Exercise(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      tags: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tags']),
      exerciseTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_title']),
      time: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time']),
      restTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rest_time']),
      mainBodyGroup: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}main_body_group']),
      detailLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_link']),
      mainMuscleGroup: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}main_muscle_group']),
      otherMuscleGroups: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}other_muscle_groups']),
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']),
      equipment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}equipment']),
      mechanics: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mechanics']),
      difficulty: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}difficulty']),
      image1Link: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image1_link']),
      image2Link: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image2_link']),
      detail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}detail']),
      sets: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sets']),
      repetitions: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}repetitions']),
      videoLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}video_link']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String?>(tags);
    }
    if (!nullToAbsent || exerciseTitle != null) {
      map['exercise_title'] = Variable<String?>(exerciseTitle);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<String?>(time);
    }
    if (!nullToAbsent || restTime != null) {
      map['rest_time'] = Variable<String?>(restTime);
    }
    if (!nullToAbsent || mainBodyGroup != null) {
      map['main_body_group'] = Variable<String?>(mainBodyGroup);
    }
    if (!nullToAbsent || detailLink != null) {
      map['detail_link'] = Variable<String?>(detailLink);
    }
    if (!nullToAbsent || mainMuscleGroup != null) {
      map['main_muscle_group'] = Variable<String?>(mainMuscleGroup);
    }
    if (!nullToAbsent || otherMuscleGroups != null) {
      map['other_muscle_groups'] = Variable<String?>(otherMuscleGroups);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String?>(type);
    }
    if (!nullToAbsent || equipment != null) {
      map['equipment'] = Variable<String?>(equipment);
    }
    if (!nullToAbsent || mechanics != null) {
      map['mechanics'] = Variable<String?>(mechanics);
    }
    if (!nullToAbsent || difficulty != null) {
      map['difficulty'] = Variable<String?>(difficulty);
    }
    if (!nullToAbsent || image1Link != null) {
      map['image1_link'] = Variable<String?>(image1Link);
    }
    if (!nullToAbsent || image2Link != null) {
      map['image2_link'] = Variable<String?>(image2Link);
    }
    if (!nullToAbsent || detail != null) {
      map['detail'] = Variable<String?>(detail);
    }
    if (!nullToAbsent || sets != null) {
      map['sets'] = Variable<String?>(sets);
    }
    if (!nullToAbsent || repetitions != null) {
      map['repetitions'] = Variable<String?>(repetitions);
    }
    if (!nullToAbsent || videoLink != null) {
      map['video_link'] = Variable<String?>(videoLink);
    }
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      exerciseTitle: exerciseTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseTitle),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      restTime: restTime == null && nullToAbsent
          ? const Value.absent()
          : Value(restTime),
      mainBodyGroup: mainBodyGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(mainBodyGroup),
      detailLink: detailLink == null && nullToAbsent
          ? const Value.absent()
          : Value(detailLink),
      mainMuscleGroup: mainMuscleGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(mainMuscleGroup),
      otherMuscleGroups: otherMuscleGroups == null && nullToAbsent
          ? const Value.absent()
          : Value(otherMuscleGroups),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      equipment: equipment == null && nullToAbsent
          ? const Value.absent()
          : Value(equipment),
      mechanics: mechanics == null && nullToAbsent
          ? const Value.absent()
          : Value(mechanics),
      difficulty: difficulty == null && nullToAbsent
          ? const Value.absent()
          : Value(difficulty),
      image1Link: image1Link == null && nullToAbsent
          ? const Value.absent()
          : Value(image1Link),
      image2Link: image2Link == null && nullToAbsent
          ? const Value.absent()
          : Value(image2Link),
      detail:
          detail == null && nullToAbsent ? const Value.absent() : Value(detail),
      sets: sets == null && nullToAbsent ? const Value.absent() : Value(sets),
      repetitions: repetitions == null && nullToAbsent
          ? const Value.absent()
          : Value(repetitions),
      videoLink: videoLink == null && nullToAbsent
          ? const Value.absent()
          : Value(videoLink),
    );
  }

  factory Exercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<int>(json['id']),
      tags: serializer.fromJson<String?>(json['tags']),
      exerciseTitle: serializer.fromJson<String?>(json['exerciseTitle']),
      time: serializer.fromJson<String?>(json['time']),
      restTime: serializer.fromJson<String?>(json['restTime']),
      mainBodyGroup: serializer.fromJson<String?>(json['mainBodyGroup']),
      detailLink: serializer.fromJson<String?>(json['detailLink']),
      mainMuscleGroup: serializer.fromJson<String?>(json['mainMuscleGroup']),
      otherMuscleGroups:
          serializer.fromJson<String?>(json['otherMuscleGroups']),
      type: serializer.fromJson<String?>(json['type']),
      equipment: serializer.fromJson<String?>(json['equipment']),
      mechanics: serializer.fromJson<String?>(json['mechanics']),
      difficulty: serializer.fromJson<String?>(json['difficulty']),
      image1Link: serializer.fromJson<String?>(json['image1Link']),
      image2Link: serializer.fromJson<String?>(json['image2Link']),
      detail: serializer.fromJson<String?>(json['detail']),
      sets: serializer.fromJson<String?>(json['sets']),
      repetitions: serializer.fromJson<String?>(json['repetitions']),
      videoLink: serializer.fromJson<String?>(json['videoLink']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tags': serializer.toJson<String?>(tags),
      'exerciseTitle': serializer.toJson<String?>(exerciseTitle),
      'time': serializer.toJson<String?>(time),
      'restTime': serializer.toJson<String?>(restTime),
      'mainBodyGroup': serializer.toJson<String?>(mainBodyGroup),
      'detailLink': serializer.toJson<String?>(detailLink),
      'mainMuscleGroup': serializer.toJson<String?>(mainMuscleGroup),
      'otherMuscleGroups': serializer.toJson<String?>(otherMuscleGroups),
      'type': serializer.toJson<String?>(type),
      'equipment': serializer.toJson<String?>(equipment),
      'mechanics': serializer.toJson<String?>(mechanics),
      'difficulty': serializer.toJson<String?>(difficulty),
      'image1Link': serializer.toJson<String?>(image1Link),
      'image2Link': serializer.toJson<String?>(image2Link),
      'detail': serializer.toJson<String?>(detail),
      'sets': serializer.toJson<String?>(sets),
      'repetitions': serializer.toJson<String?>(repetitions),
      'videoLink': serializer.toJson<String?>(videoLink),
    };
  }

  Exercise copyWith(
          {int? id,
          String? tags,
          String? exerciseTitle,
          String? time,
          String? restTime,
          String? mainBodyGroup,
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
          String? videoLink}) =>
      Exercise(
        id: id ?? this.id,
        tags: tags ?? this.tags,
        exerciseTitle: exerciseTitle ?? this.exerciseTitle,
        time: time ?? this.time,
        restTime: restTime ?? this.restTime,
        mainBodyGroup: mainBodyGroup ?? this.mainBodyGroup,
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
      );
  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('tags: $tags, ')
          ..write('exerciseTitle: $exerciseTitle, ')
          ..write('time: $time, ')
          ..write('restTime: $restTime, ')
          ..write('mainBodyGroup: $mainBodyGroup, ')
          ..write('detailLink: $detailLink, ')
          ..write('mainMuscleGroup: $mainMuscleGroup, ')
          ..write('otherMuscleGroups: $otherMuscleGroups, ')
          ..write('type: $type, ')
          ..write('equipment: $equipment, ')
          ..write('mechanics: $mechanics, ')
          ..write('difficulty: $difficulty, ')
          ..write('image1Link: $image1Link, ')
          ..write('image2Link: $image2Link, ')
          ..write('detail: $detail, ')
          ..write('sets: $sets, ')
          ..write('repetitions: $repetitions, ')
          ..write('videoLink: $videoLink')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          tags.hashCode,
          $mrjc(
              exerciseTitle.hashCode,
              $mrjc(
                  time.hashCode,
                  $mrjc(
                      restTime.hashCode,
                      $mrjc(
                          mainBodyGroup.hashCode,
                          $mrjc(
                              detailLink.hashCode,
                              $mrjc(
                                  mainMuscleGroup.hashCode,
                                  $mrjc(
                                      otherMuscleGroups.hashCode,
                                      $mrjc(
                                          type.hashCode,
                                          $mrjc(
                                              equipment.hashCode,
                                              $mrjc(
                                                  mechanics.hashCode,
                                                  $mrjc(
                                                      difficulty.hashCode,
                                                      $mrjc(
                                                          image1Link.hashCode,
                                                          $mrjc(
                                                              image2Link
                                                                  .hashCode,
                                                              $mrjc(
                                                                  detail
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      sets
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          repetitions
                                                                              .hashCode,
                                                                          videoLink
                                                                              .hashCode)))))))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.tags == this.tags &&
          other.exerciseTitle == this.exerciseTitle &&
          other.time == this.time &&
          other.restTime == this.restTime &&
          other.mainBodyGroup == this.mainBodyGroup &&
          other.detailLink == this.detailLink &&
          other.mainMuscleGroup == this.mainMuscleGroup &&
          other.otherMuscleGroups == this.otherMuscleGroups &&
          other.type == this.type &&
          other.equipment == this.equipment &&
          other.mechanics == this.mechanics &&
          other.difficulty == this.difficulty &&
          other.image1Link == this.image1Link &&
          other.image2Link == this.image2Link &&
          other.detail == this.detail &&
          other.sets == this.sets &&
          other.repetitions == this.repetitions &&
          other.videoLink == this.videoLink);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int> id;
  final Value<String?> tags;
  final Value<String?> exerciseTitle;
  final Value<String?> time;
  final Value<String?> restTime;
  final Value<String?> mainBodyGroup;
  final Value<String?> detailLink;
  final Value<String?> mainMuscleGroup;
  final Value<String?> otherMuscleGroups;
  final Value<String?> type;
  final Value<String?> equipment;
  final Value<String?> mechanics;
  final Value<String?> difficulty;
  final Value<String?> image1Link;
  final Value<String?> image2Link;
  final Value<String?> detail;
  final Value<String?> sets;
  final Value<String?> repetitions;
  final Value<String?> videoLink;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.tags = const Value.absent(),
    this.exerciseTitle = const Value.absent(),
    this.time = const Value.absent(),
    this.restTime = const Value.absent(),
    this.mainBodyGroup = const Value.absent(),
    this.detailLink = const Value.absent(),
    this.mainMuscleGroup = const Value.absent(),
    this.otherMuscleGroups = const Value.absent(),
    this.type = const Value.absent(),
    this.equipment = const Value.absent(),
    this.mechanics = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.image1Link = const Value.absent(),
    this.image2Link = const Value.absent(),
    this.detail = const Value.absent(),
    this.sets = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.videoLink = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    this.tags = const Value.absent(),
    this.exerciseTitle = const Value.absent(),
    this.time = const Value.absent(),
    this.restTime = const Value.absent(),
    this.mainBodyGroup = const Value.absent(),
    this.detailLink = const Value.absent(),
    this.mainMuscleGroup = const Value.absent(),
    this.otherMuscleGroups = const Value.absent(),
    this.type = const Value.absent(),
    this.equipment = const Value.absent(),
    this.mechanics = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.image1Link = const Value.absent(),
    this.image2Link = const Value.absent(),
    this.detail = const Value.absent(),
    this.sets = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.videoLink = const Value.absent(),
  });
  static Insertable<Exercise> custom({
    Expression<int>? id,
    Expression<String?>? tags,
    Expression<String?>? exerciseTitle,
    Expression<String?>? time,
    Expression<String?>? restTime,
    Expression<String?>? mainBodyGroup,
    Expression<String?>? detailLink,
    Expression<String?>? mainMuscleGroup,
    Expression<String?>? otherMuscleGroups,
    Expression<String?>? type,
    Expression<String?>? equipment,
    Expression<String?>? mechanics,
    Expression<String?>? difficulty,
    Expression<String?>? image1Link,
    Expression<String?>? image2Link,
    Expression<String?>? detail,
    Expression<String?>? sets,
    Expression<String?>? repetitions,
    Expression<String?>? videoLink,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
      if (exerciseTitle != null) 'exercise_title': exerciseTitle,
      if (time != null) 'time': time,
      if (restTime != null) 'rest_time': restTime,
      if (mainBodyGroup != null) 'main_body_group': mainBodyGroup,
      if (detailLink != null) 'detail_link': detailLink,
      if (mainMuscleGroup != null) 'main_muscle_group': mainMuscleGroup,
      if (otherMuscleGroups != null) 'other_muscle_groups': otherMuscleGroups,
      if (type != null) 'type': type,
      if (equipment != null) 'equipment': equipment,
      if (mechanics != null) 'mechanics': mechanics,
      if (difficulty != null) 'difficulty': difficulty,
      if (image1Link != null) 'image1_link': image1Link,
      if (image2Link != null) 'image2_link': image2Link,
      if (detail != null) 'detail': detail,
      if (sets != null) 'sets': sets,
      if (repetitions != null) 'repetitions': repetitions,
      if (videoLink != null) 'video_link': videoLink,
    });
  }

  ExercisesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? tags,
      Value<String?>? exerciseTitle,
      Value<String?>? time,
      Value<String?>? restTime,
      Value<String?>? mainBodyGroup,
      Value<String?>? detailLink,
      Value<String?>? mainMuscleGroup,
      Value<String?>? otherMuscleGroups,
      Value<String?>? type,
      Value<String?>? equipment,
      Value<String?>? mechanics,
      Value<String?>? difficulty,
      Value<String?>? image1Link,
      Value<String?>? image2Link,
      Value<String?>? detail,
      Value<String?>? sets,
      Value<String?>? repetitions,
      Value<String?>? videoLink}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      tags: tags ?? this.tags,
      exerciseTitle: exerciseTitle ?? this.exerciseTitle,
      time: time ?? this.time,
      restTime: restTime ?? this.restTime,
      mainBodyGroup: mainBodyGroup ?? this.mainBodyGroup,
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
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String?>(tags.value);
    }
    if (exerciseTitle.present) {
      map['exercise_title'] = Variable<String?>(exerciseTitle.value);
    }
    if (time.present) {
      map['time'] = Variable<String?>(time.value);
    }
    if (restTime.present) {
      map['rest_time'] = Variable<String?>(restTime.value);
    }
    if (mainBodyGroup.present) {
      map['main_body_group'] = Variable<String?>(mainBodyGroup.value);
    }
    if (detailLink.present) {
      map['detail_link'] = Variable<String?>(detailLink.value);
    }
    if (mainMuscleGroup.present) {
      map['main_muscle_group'] = Variable<String?>(mainMuscleGroup.value);
    }
    if (otherMuscleGroups.present) {
      map['other_muscle_groups'] = Variable<String?>(otherMuscleGroups.value);
    }
    if (type.present) {
      map['type'] = Variable<String?>(type.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String?>(equipment.value);
    }
    if (mechanics.present) {
      map['mechanics'] = Variable<String?>(mechanics.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String?>(difficulty.value);
    }
    if (image1Link.present) {
      map['image1_link'] = Variable<String?>(image1Link.value);
    }
    if (image2Link.present) {
      map['image2_link'] = Variable<String?>(image2Link.value);
    }
    if (detail.present) {
      map['detail'] = Variable<String?>(detail.value);
    }
    if (sets.present) {
      map['sets'] = Variable<String?>(sets.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<String?>(repetitions.value);
    }
    if (videoLink.present) {
      map['video_link'] = Variable<String?>(videoLink.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('tags: $tags, ')
          ..write('exerciseTitle: $exerciseTitle, ')
          ..write('time: $time, ')
          ..write('restTime: $restTime, ')
          ..write('mainBodyGroup: $mainBodyGroup, ')
          ..write('detailLink: $detailLink, ')
          ..write('mainMuscleGroup: $mainMuscleGroup, ')
          ..write('otherMuscleGroups: $otherMuscleGroups, ')
          ..write('type: $type, ')
          ..write('equipment: $equipment, ')
          ..write('mechanics: $mechanics, ')
          ..write('difficulty: $difficulty, ')
          ..write('image1Link: $image1Link, ')
          ..write('image2Link: $image2Link, ')
          ..write('detail: $detail, ')
          ..write('sets: $sets, ')
          ..write('repetitions: $repetitions, ')
          ..write('videoLink: $videoLink')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ExercisesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _tagsMeta = const VerificationMeta('tags');
  late final GeneratedColumn<String?> tags = GeneratedColumn<String?>(
      'tags', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _exerciseTitleMeta =
      const VerificationMeta('exerciseTitle');
  late final GeneratedColumn<String?> exerciseTitle = GeneratedColumn<String?>(
      'exercise_title', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  late final GeneratedColumn<String?> time = GeneratedColumn<String?>(
      'time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _restTimeMeta = const VerificationMeta('restTime');
  late final GeneratedColumn<String?> restTime = GeneratedColumn<String?>(
      'rest_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _mainBodyGroupMeta =
      const VerificationMeta('mainBodyGroup');
  late final GeneratedColumn<String?> mainBodyGroup = GeneratedColumn<String?>(
      'main_body_group', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _detailLinkMeta = const VerificationMeta('detailLink');
  late final GeneratedColumn<String?> detailLink = GeneratedColumn<String?>(
      'detail_link', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _mainMuscleGroupMeta =
      const VerificationMeta('mainMuscleGroup');
  late final GeneratedColumn<String?> mainMuscleGroup =
      GeneratedColumn<String?>('main_muscle_group', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _otherMuscleGroupsMeta =
      const VerificationMeta('otherMuscleGroups');
  late final GeneratedColumn<String?> otherMuscleGroups =
      GeneratedColumn<String?>('other_muscle_groups', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _equipmentMeta = const VerificationMeta('equipment');
  late final GeneratedColumn<String?> equipment = GeneratedColumn<String?>(
      'equipment', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _mechanicsMeta = const VerificationMeta('mechanics');
  late final GeneratedColumn<String?> mechanics = GeneratedColumn<String?>(
      'mechanics', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _difficultyMeta = const VerificationMeta('difficulty');
  late final GeneratedColumn<String?> difficulty = GeneratedColumn<String?>(
      'difficulty', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _image1LinkMeta = const VerificationMeta('image1Link');
  late final GeneratedColumn<String?> image1Link = GeneratedColumn<String?>(
      'image1_link', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _image2LinkMeta = const VerificationMeta('image2Link');
  late final GeneratedColumn<String?> image2Link = GeneratedColumn<String?>(
      'image2_link', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _detailMeta = const VerificationMeta('detail');
  late final GeneratedColumn<String?> detail = GeneratedColumn<String?>(
      'detail', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _setsMeta = const VerificationMeta('sets');
  late final GeneratedColumn<String?> sets = GeneratedColumn<String?>(
      'sets', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _repetitionsMeta =
      const VerificationMeta('repetitions');
  late final GeneratedColumn<String?> repetitions = GeneratedColumn<String?>(
      'repetitions', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _videoLinkMeta = const VerificationMeta('videoLink');
  late final GeneratedColumn<String?> videoLink = GeneratedColumn<String?>(
      'video_link', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tags,
        exerciseTitle,
        time,
        restTime,
        mainBodyGroup,
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
        videoLink
      ];
  @override
  String get aliasedName => _alias ?? 'exercises';
  @override
  String get actualTableName => 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<Exercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('exercise_title')) {
      context.handle(
          _exerciseTitleMeta,
          exerciseTitle.isAcceptableOrUnknown(
              data['exercise_title']!, _exerciseTitleMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    }
    if (data.containsKey('rest_time')) {
      context.handle(_restTimeMeta,
          restTime.isAcceptableOrUnknown(data['rest_time']!, _restTimeMeta));
    }
    if (data.containsKey('main_body_group')) {
      context.handle(
          _mainBodyGroupMeta,
          mainBodyGroup.isAcceptableOrUnknown(
              data['main_body_group']!, _mainBodyGroupMeta));
    }
    if (data.containsKey('detail_link')) {
      context.handle(
          _detailLinkMeta,
          detailLink.isAcceptableOrUnknown(
              data['detail_link']!, _detailLinkMeta));
    }
    if (data.containsKey('main_muscle_group')) {
      context.handle(
          _mainMuscleGroupMeta,
          mainMuscleGroup.isAcceptableOrUnknown(
              data['main_muscle_group']!, _mainMuscleGroupMeta));
    }
    if (data.containsKey('other_muscle_groups')) {
      context.handle(
          _otherMuscleGroupsMeta,
          otherMuscleGroups.isAcceptableOrUnknown(
              data['other_muscle_groups']!, _otherMuscleGroupsMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('equipment')) {
      context.handle(_equipmentMeta,
          equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta));
    }
    if (data.containsKey('mechanics')) {
      context.handle(_mechanicsMeta,
          mechanics.isAcceptableOrUnknown(data['mechanics']!, _mechanicsMeta));
    }
    if (data.containsKey('difficulty')) {
      context.handle(
          _difficultyMeta,
          difficulty.isAcceptableOrUnknown(
              data['difficulty']!, _difficultyMeta));
    }
    if (data.containsKey('image1_link')) {
      context.handle(
          _image1LinkMeta,
          image1Link.isAcceptableOrUnknown(
              data['image1_link']!, _image1LinkMeta));
    }
    if (data.containsKey('image2_link')) {
      context.handle(
          _image2LinkMeta,
          image2Link.isAcceptableOrUnknown(
              data['image2_link']!, _image2LinkMeta));
    }
    if (data.containsKey('detail')) {
      context.handle(_detailMeta,
          detail.isAcceptableOrUnknown(data['detail']!, _detailMeta));
    }
    if (data.containsKey('sets')) {
      context.handle(
          _setsMeta, sets.isAcceptableOrUnknown(data['sets']!, _setsMeta));
    }
    if (data.containsKey('repetitions')) {
      context.handle(
          _repetitionsMeta,
          repetitions.isAcceptableOrUnknown(
              data['repetitions']!, _repetitionsMeta));
    }
    if (data.containsKey('video_link')) {
      context.handle(_videoLinkMeta,
          videoLink.isAcceptableOrUnknown(data['video_link']!, _videoLinkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Exercise.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(_db, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String? name;
  final int age;
  final String? heightUnit;
  final String? weightUnit;
  final String? waistUnit;
  final String? height;
  final String? weight;
  final String? waist;
  final String? gender;
  final String? goal;
  final String? workoutTimeRemainder;
  final String? fitnessLevel;
  final bool? ip;
  final bool? dailyWaterRemainder;
  final bool? dailyWorkoutRemainder;
  User(
      {required this.id,
      this.name,
      required this.age,
      this.heightUnit,
      this.weightUnit,
      this.waistUnit,
      this.height,
      this.weight,
      this.waist,
      this.gender,
      this.goal,
      this.workoutTimeRemainder,
      this.fitnessLevel,
      this.ip,
      this.dailyWaterRemainder,
      this.dailyWorkoutRemainder});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      age: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}age'])!,
      heightUnit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}height_unit']),
      weightUnit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight_unit']),
      waistUnit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}waist_unit']),
      height: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}height']),
      weight: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      waist: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}waist']),
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      goal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}goal']),
      workoutTimeRemainder: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}workout_time_remainder']),
      fitnessLevel: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fitness_level']),
      ip: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ip']),
      dailyWaterRemainder: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}daily_water_remainder']),
      dailyWorkoutRemainder: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}daily_workout_remainder']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    map['age'] = Variable<int>(age);
    if (!nullToAbsent || heightUnit != null) {
      map['height_unit'] = Variable<String?>(heightUnit);
    }
    if (!nullToAbsent || weightUnit != null) {
      map['weight_unit'] = Variable<String?>(weightUnit);
    }
    if (!nullToAbsent || waistUnit != null) {
      map['waist_unit'] = Variable<String?>(waistUnit);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<String?>(height);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<String?>(weight);
    }
    if (!nullToAbsent || waist != null) {
      map['waist'] = Variable<String?>(waist);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String?>(gender);
    }
    if (!nullToAbsent || goal != null) {
      map['goal'] = Variable<String?>(goal);
    }
    if (!nullToAbsent || workoutTimeRemainder != null) {
      map['workout_time_remainder'] = Variable<String?>(workoutTimeRemainder);
    }
    if (!nullToAbsent || fitnessLevel != null) {
      map['fitness_level'] = Variable<String?>(fitnessLevel);
    }
    if (!nullToAbsent || ip != null) {
      map['ip'] = Variable<bool?>(ip);
    }
    if (!nullToAbsent || dailyWaterRemainder != null) {
      map['daily_water_remainder'] = Variable<bool?>(dailyWaterRemainder);
    }
    if (!nullToAbsent || dailyWorkoutRemainder != null) {
      map['daily_workout_remainder'] = Variable<bool?>(dailyWorkoutRemainder);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      age: Value(age),
      heightUnit: heightUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(heightUnit),
      weightUnit: weightUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(weightUnit),
      waistUnit: waistUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(waistUnit),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      waist:
          waist == null && nullToAbsent ? const Value.absent() : Value(waist),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      goal: goal == null && nullToAbsent ? const Value.absent() : Value(goal),
      workoutTimeRemainder: workoutTimeRemainder == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutTimeRemainder),
      fitnessLevel: fitnessLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(fitnessLevel),
      ip: ip == null && nullToAbsent ? const Value.absent() : Value(ip),
      dailyWaterRemainder: dailyWaterRemainder == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyWaterRemainder),
      dailyWorkoutRemainder: dailyWorkoutRemainder == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyWorkoutRemainder),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      heightUnit: serializer.fromJson<String?>(json['heightUnit']),
      weightUnit: serializer.fromJson<String?>(json['weightUnit']),
      waistUnit: serializer.fromJson<String?>(json['waistUnit']),
      height: serializer.fromJson<String?>(json['height']),
      weight: serializer.fromJson<String?>(json['weight']),
      waist: serializer.fromJson<String?>(json['waist']),
      gender: serializer.fromJson<String?>(json['gender']),
      goal: serializer.fromJson<String?>(json['goal']),
      workoutTimeRemainder:
          serializer.fromJson<String?>(json['workoutTimeRemainder']),
      fitnessLevel: serializer.fromJson<String?>(json['fitnessLevel']),
      ip: serializer.fromJson<bool?>(json['ip']),
      dailyWaterRemainder:
          serializer.fromJson<bool?>(json['dailyWaterRemainder']),
      dailyWorkoutRemainder:
          serializer.fromJson<bool?>(json['dailyWorkoutRemainder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'age': serializer.toJson<int>(age),
      'heightUnit': serializer.toJson<String?>(heightUnit),
      'weightUnit': serializer.toJson<String?>(weightUnit),
      'waistUnit': serializer.toJson<String?>(waistUnit),
      'height': serializer.toJson<String?>(height),
      'weight': serializer.toJson<String?>(weight),
      'waist': serializer.toJson<String?>(waist),
      'gender': serializer.toJson<String?>(gender),
      'goal': serializer.toJson<String?>(goal),
      'workoutTimeRemainder': serializer.toJson<String?>(workoutTimeRemainder),
      'fitnessLevel': serializer.toJson<String?>(fitnessLevel),
      'ip': serializer.toJson<bool?>(ip),
      'dailyWaterRemainder': serializer.toJson<bool?>(dailyWaterRemainder),
      'dailyWorkoutRemainder': serializer.toJson<bool?>(dailyWorkoutRemainder),
    };
  }

  User copyWith(
          {int? id,
          String? name,
          int? age,
          String? heightUnit,
          String? weightUnit,
          String? waistUnit,
          String? height,
          String? weight,
          String? waist,
          String? gender,
          String? goal,
          String? workoutTimeRemainder,
          String? fitnessLevel,
          bool? ip,
          bool? dailyWaterRemainder,
          bool? dailyWorkoutRemainder}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        heightUnit: heightUnit ?? this.heightUnit,
        weightUnit: weightUnit ?? this.weightUnit,
        waistUnit: waistUnit ?? this.waistUnit,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        waist: waist ?? this.waist,
        gender: gender ?? this.gender,
        goal: goal ?? this.goal,
        workoutTimeRemainder: workoutTimeRemainder ?? this.workoutTimeRemainder,
        fitnessLevel: fitnessLevel ?? this.fitnessLevel,
        ip: ip ?? this.ip,
        dailyWaterRemainder: dailyWaterRemainder ?? this.dailyWaterRemainder,
        dailyWorkoutRemainder:
            dailyWorkoutRemainder ?? this.dailyWorkoutRemainder,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('heightUnit: $heightUnit, ')
          ..write('weightUnit: $weightUnit, ')
          ..write('waistUnit: $waistUnit, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('waist: $waist, ')
          ..write('gender: $gender, ')
          ..write('goal: $goal, ')
          ..write('workoutTimeRemainder: $workoutTimeRemainder, ')
          ..write('fitnessLevel: $fitnessLevel, ')
          ..write('ip: $ip, ')
          ..write('dailyWaterRemainder: $dailyWaterRemainder, ')
          ..write('dailyWorkoutRemainder: $dailyWorkoutRemainder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              age.hashCode,
              $mrjc(
                  heightUnit.hashCode,
                  $mrjc(
                      weightUnit.hashCode,
                      $mrjc(
                          waistUnit.hashCode,
                          $mrjc(
                              height.hashCode,
                              $mrjc(
                                  weight.hashCode,
                                  $mrjc(
                                      waist.hashCode,
                                      $mrjc(
                                          gender.hashCode,
                                          $mrjc(
                                              goal.hashCode,
                                              $mrjc(
                                                  workoutTimeRemainder.hashCode,
                                                  $mrjc(
                                                      fitnessLevel.hashCode,
                                                      $mrjc(
                                                          ip.hashCode,
                                                          $mrjc(
                                                              dailyWaterRemainder
                                                                  .hashCode,
                                                              dailyWorkoutRemainder
                                                                  .hashCode))))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age &&
          other.heightUnit == this.heightUnit &&
          other.weightUnit == this.weightUnit &&
          other.waistUnit == this.waistUnit &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.waist == this.waist &&
          other.gender == this.gender &&
          other.goal == this.goal &&
          other.workoutTimeRemainder == this.workoutTimeRemainder &&
          other.fitnessLevel == this.fitnessLevel &&
          other.ip == this.ip &&
          other.dailyWaterRemainder == this.dailyWaterRemainder &&
          other.dailyWorkoutRemainder == this.dailyWorkoutRemainder);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String?> name;
  final Value<int> age;
  final Value<String?> heightUnit;
  final Value<String?> weightUnit;
  final Value<String?> waistUnit;
  final Value<String?> height;
  final Value<String?> weight;
  final Value<String?> waist;
  final Value<String?> gender;
  final Value<String?> goal;
  final Value<String?> workoutTimeRemainder;
  final Value<String?> fitnessLevel;
  final Value<bool?> ip;
  final Value<bool?> dailyWaterRemainder;
  final Value<bool?> dailyWorkoutRemainder;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.heightUnit = const Value.absent(),
    this.weightUnit = const Value.absent(),
    this.waistUnit = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.waist = const Value.absent(),
    this.gender = const Value.absent(),
    this.goal = const Value.absent(),
    this.workoutTimeRemainder = const Value.absent(),
    this.fitnessLevel = const Value.absent(),
    this.ip = const Value.absent(),
    this.dailyWaterRemainder = const Value.absent(),
    this.dailyWorkoutRemainder = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    required int age,
    this.heightUnit = const Value.absent(),
    this.weightUnit = const Value.absent(),
    this.waistUnit = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.waist = const Value.absent(),
    this.gender = const Value.absent(),
    this.goal = const Value.absent(),
    this.workoutTimeRemainder = const Value.absent(),
    this.fitnessLevel = const Value.absent(),
    this.ip = const Value.absent(),
    this.dailyWaterRemainder = const Value.absent(),
    this.dailyWorkoutRemainder = const Value.absent(),
  }) : age = Value(age);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String?>? name,
    Expression<int>? age,
    Expression<String?>? heightUnit,
    Expression<String?>? weightUnit,
    Expression<String?>? waistUnit,
    Expression<String?>? height,
    Expression<String?>? weight,
    Expression<String?>? waist,
    Expression<String?>? gender,
    Expression<String?>? goal,
    Expression<String?>? workoutTimeRemainder,
    Expression<String?>? fitnessLevel,
    Expression<bool?>? ip,
    Expression<bool?>? dailyWaterRemainder,
    Expression<bool?>? dailyWorkoutRemainder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (heightUnit != null) 'height_unit': heightUnit,
      if (weightUnit != null) 'weight_unit': weightUnit,
      if (waistUnit != null) 'waist_unit': waistUnit,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (waist != null) 'waist': waist,
      if (gender != null) 'gender': gender,
      if (goal != null) 'goal': goal,
      if (workoutTimeRemainder != null)
        'workout_time_remainder': workoutTimeRemainder,
      if (fitnessLevel != null) 'fitness_level': fitnessLevel,
      if (ip != null) 'ip': ip,
      if (dailyWaterRemainder != null)
        'daily_water_remainder': dailyWaterRemainder,
      if (dailyWorkoutRemainder != null)
        'daily_workout_remainder': dailyWorkoutRemainder,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<int>? age,
      Value<String?>? heightUnit,
      Value<String?>? weightUnit,
      Value<String?>? waistUnit,
      Value<String?>? height,
      Value<String?>? weight,
      Value<String?>? waist,
      Value<String?>? gender,
      Value<String?>? goal,
      Value<String?>? workoutTimeRemainder,
      Value<String?>? fitnessLevel,
      Value<bool?>? ip,
      Value<bool?>? dailyWaterRemainder,
      Value<bool?>? dailyWorkoutRemainder}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      heightUnit: heightUnit ?? this.heightUnit,
      weightUnit: weightUnit ?? this.weightUnit,
      waistUnit: waistUnit ?? this.waistUnit,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      waist: waist ?? this.waist,
      gender: gender ?? this.gender,
      goal: goal ?? this.goal,
      workoutTimeRemainder: workoutTimeRemainder ?? this.workoutTimeRemainder,
      fitnessLevel: fitnessLevel ?? this.fitnessLevel,
      ip: ip ?? this.ip,
      dailyWaterRemainder: dailyWaterRemainder ?? this.dailyWaterRemainder,
      dailyWorkoutRemainder:
          dailyWorkoutRemainder ?? this.dailyWorkoutRemainder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (heightUnit.present) {
      map['height_unit'] = Variable<String?>(heightUnit.value);
    }
    if (weightUnit.present) {
      map['weight_unit'] = Variable<String?>(weightUnit.value);
    }
    if (waistUnit.present) {
      map['waist_unit'] = Variable<String?>(waistUnit.value);
    }
    if (height.present) {
      map['height'] = Variable<String?>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<String?>(weight.value);
    }
    if (waist.present) {
      map['waist'] = Variable<String?>(waist.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String?>(gender.value);
    }
    if (goal.present) {
      map['goal'] = Variable<String?>(goal.value);
    }
    if (workoutTimeRemainder.present) {
      map['workout_time_remainder'] =
          Variable<String?>(workoutTimeRemainder.value);
    }
    if (fitnessLevel.present) {
      map['fitness_level'] = Variable<String?>(fitnessLevel.value);
    }
    if (ip.present) {
      map['ip'] = Variable<bool?>(ip.value);
    }
    if (dailyWaterRemainder.present) {
      map['daily_water_remainder'] = Variable<bool?>(dailyWaterRemainder.value);
    }
    if (dailyWorkoutRemainder.present) {
      map['daily_workout_remainder'] =
          Variable<bool?>(dailyWorkoutRemainder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('heightUnit: $heightUnit, ')
          ..write('weightUnit: $weightUnit, ')
          ..write('waistUnit: $waistUnit, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('waist: $waist, ')
          ..write('gender: $gender, ')
          ..write('goal: $goal, ')
          ..write('workoutTimeRemainder: $workoutTimeRemainder, ')
          ..write('fitnessLevel: $fitnessLevel, ')
          ..write('ip: $ip, ')
          ..write('dailyWaterRemainder: $dailyWaterRemainder, ')
          ..write('dailyWorkoutRemainder: $dailyWorkoutRemainder')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _ageMeta = const VerificationMeta('age');
  late final GeneratedColumn<int?> age = GeneratedColumn<int?>(
      'age', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _heightUnitMeta = const VerificationMeta('heightUnit');
  late final GeneratedColumn<String?> heightUnit = GeneratedColumn<String?>(
      'height_unit', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _weightUnitMeta = const VerificationMeta('weightUnit');
  late final GeneratedColumn<String?> weightUnit = GeneratedColumn<String?>(
      'weight_unit', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _waistUnitMeta = const VerificationMeta('waistUnit');
  late final GeneratedColumn<String?> waistUnit = GeneratedColumn<String?>(
      'waist_unit', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _heightMeta = const VerificationMeta('height');
  late final GeneratedColumn<String?> height = GeneratedColumn<String?>(
      'height', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  late final GeneratedColumn<String?> weight = GeneratedColumn<String?>(
      'weight', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _waistMeta = const VerificationMeta('waist');
  late final GeneratedColumn<String?> waist = GeneratedColumn<String?>(
      'waist', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _goalMeta = const VerificationMeta('goal');
  late final GeneratedColumn<String?> goal = GeneratedColumn<String?>(
      'goal', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _workoutTimeRemainderMeta =
      const VerificationMeta('workoutTimeRemainder');
  late final GeneratedColumn<String?> workoutTimeRemainder =
      GeneratedColumn<String?>('workout_time_remainder', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _fitnessLevelMeta =
      const VerificationMeta('fitnessLevel');
  late final GeneratedColumn<String?> fitnessLevel = GeneratedColumn<String?>(
      'fitness_level', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _ipMeta = const VerificationMeta('ip');
  late final GeneratedColumn<bool?> ip = GeneratedColumn<bool?>(
      'ip', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (ip IN (0, 1))',
      defaultValue: const Constant(true));
  final VerificationMeta _dailyWaterRemainderMeta =
      const VerificationMeta('dailyWaterRemainder');
  late final GeneratedColumn<bool?> dailyWaterRemainder =
      GeneratedColumn<bool?>('daily_water_remainder', aliasedName, true,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'CHECK (daily_water_remainder IN (0, 1))',
          defaultValue: const Constant(false));
  final VerificationMeta _dailyWorkoutRemainderMeta =
      const VerificationMeta('dailyWorkoutRemainder');
  late final GeneratedColumn<bool?> dailyWorkoutRemainder =
      GeneratedColumn<bool?>('daily_workout_remainder', aliasedName, true,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'CHECK (daily_workout_remainder IN (0, 1))',
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        age,
        heightUnit,
        weightUnit,
        waistUnit,
        height,
        weight,
        waist,
        gender,
        goal,
        workoutTimeRemainder,
        fitnessLevel,
        ip,
        dailyWaterRemainder,
        dailyWorkoutRemainder
      ];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('height_unit')) {
      context.handle(
          _heightUnitMeta,
          heightUnit.isAcceptableOrUnknown(
              data['height_unit']!, _heightUnitMeta));
    }
    if (data.containsKey('weight_unit')) {
      context.handle(
          _weightUnitMeta,
          weightUnit.isAcceptableOrUnknown(
              data['weight_unit']!, _weightUnitMeta));
    }
    if (data.containsKey('waist_unit')) {
      context.handle(_waistUnitMeta,
          waistUnit.isAcceptableOrUnknown(data['waist_unit']!, _waistUnitMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('waist')) {
      context.handle(
          _waistMeta, waist.isAcceptableOrUnknown(data['waist']!, _waistMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('goal')) {
      context.handle(
          _goalMeta, goal.isAcceptableOrUnknown(data['goal']!, _goalMeta));
    }
    if (data.containsKey('workout_time_remainder')) {
      context.handle(
          _workoutTimeRemainderMeta,
          workoutTimeRemainder.isAcceptableOrUnknown(
              data['workout_time_remainder']!, _workoutTimeRemainderMeta));
    }
    if (data.containsKey('fitness_level')) {
      context.handle(
          _fitnessLevelMeta,
          fitnessLevel.isAcceptableOrUnknown(
              data['fitness_level']!, _fitnessLevelMeta));
    }
    if (data.containsKey('ip')) {
      context.handle(_ipMeta, ip.isAcceptableOrUnknown(data['ip']!, _ipMeta));
    }
    if (data.containsKey('daily_water_remainder')) {
      context.handle(
          _dailyWaterRemainderMeta,
          dailyWaterRemainder.isAcceptableOrUnknown(
              data['daily_water_remainder']!, _dailyWaterRemainderMeta));
    }
    if (data.containsKey('daily_workout_remainder')) {
      context.handle(
          _dailyWorkoutRemainderMeta,
          dailyWorkoutRemainder.isAcceptableOrUnknown(
              data['daily_workout_remainder']!, _dailyWorkoutRemainderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    return User.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class DailyTip extends DataClass implements Insertable<DailyTip> {
  final int id;
  final String? insertTimestamp;
  final String? updateTimestamp;
  final String? dailyTipType;
  final String? title;
  final String? description;
  final String? imgUrl;
  final bool? active;
  DailyTip(
      {required this.id,
      this.insertTimestamp,
      this.updateTimestamp,
      this.dailyTipType,
      this.title,
      this.description,
      this.imgUrl,
      this.active});
  factory DailyTip.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DailyTip(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      insertTimestamp: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}insert_timestamp']),
      updateTimestamp: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}update_timestamp']),
      dailyTipType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}daily_tip_type']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      imgUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}img_url']),
      active: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}active']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || insertTimestamp != null) {
      map['insert_timestamp'] = Variable<String?>(insertTimestamp);
    }
    if (!nullToAbsent || updateTimestamp != null) {
      map['update_timestamp'] = Variable<String?>(updateTimestamp);
    }
    if (!nullToAbsent || dailyTipType != null) {
      map['daily_tip_type'] = Variable<String?>(dailyTipType);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || imgUrl != null) {
      map['img_url'] = Variable<String?>(imgUrl);
    }
    if (!nullToAbsent || active != null) {
      map['active'] = Variable<bool?>(active);
    }
    return map;
  }

  DailyTipsCompanion toCompanion(bool nullToAbsent) {
    return DailyTipsCompanion(
      id: Value(id),
      insertTimestamp: insertTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(insertTimestamp),
      updateTimestamp: updateTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(updateTimestamp),
      dailyTipType: dailyTipType == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyTipType),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      imgUrl:
          imgUrl == null && nullToAbsent ? const Value.absent() : Value(imgUrl),
      active:
          active == null && nullToAbsent ? const Value.absent() : Value(active),
    );
  }

  factory DailyTip.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DailyTip(
      id: serializer.fromJson<int>(json['id']),
      insertTimestamp: serializer.fromJson<String?>(json['insertTimestamp']),
      updateTimestamp: serializer.fromJson<String?>(json['updateTimestamp']),
      dailyTipType: serializer.fromJson<String?>(json['dailyTipType']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      imgUrl: serializer.fromJson<String?>(json['imgUrl']),
      active: serializer.fromJson<bool?>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'insertTimestamp': serializer.toJson<String?>(insertTimestamp),
      'updateTimestamp': serializer.toJson<String?>(updateTimestamp),
      'dailyTipType': serializer.toJson<String?>(dailyTipType),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'imgUrl': serializer.toJson<String?>(imgUrl),
      'active': serializer.toJson<bool?>(active),
    };
  }

  DailyTip copyWith(
          {int? id,
          String? insertTimestamp,
          String? updateTimestamp,
          String? dailyTipType,
          String? title,
          String? description,
          String? imgUrl,
          bool? active}) =>
      DailyTip(
        id: id ?? this.id,
        insertTimestamp: insertTimestamp ?? this.insertTimestamp,
        updateTimestamp: updateTimestamp ?? this.updateTimestamp,
        dailyTipType: dailyTipType ?? this.dailyTipType,
        title: title ?? this.title,
        description: description ?? this.description,
        imgUrl: imgUrl ?? this.imgUrl,
        active: active ?? this.active,
      );
  @override
  String toString() {
    return (StringBuffer('DailyTip(')
          ..write('id: $id, ')
          ..write('insertTimestamp: $insertTimestamp, ')
          ..write('updateTimestamp: $updateTimestamp, ')
          ..write('dailyTipType: $dailyTipType, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          insertTimestamp.hashCode,
          $mrjc(
              updateTimestamp.hashCode,
              $mrjc(
                  dailyTipType.hashCode,
                  $mrjc(
                      title.hashCode,
                      $mrjc(description.hashCode,
                          $mrjc(imgUrl.hashCode, active.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyTip &&
          other.id == this.id &&
          other.insertTimestamp == this.insertTimestamp &&
          other.updateTimestamp == this.updateTimestamp &&
          other.dailyTipType == this.dailyTipType &&
          other.title == this.title &&
          other.description == this.description &&
          other.imgUrl == this.imgUrl &&
          other.active == this.active);
}

class DailyTipsCompanion extends UpdateCompanion<DailyTip> {
  final Value<int> id;
  final Value<String?> insertTimestamp;
  final Value<String?> updateTimestamp;
  final Value<String?> dailyTipType;
  final Value<String?> title;
  final Value<String?> description;
  final Value<String?> imgUrl;
  final Value<bool?> active;
  const DailyTipsCompanion({
    this.id = const Value.absent(),
    this.insertTimestamp = const Value.absent(),
    this.updateTimestamp = const Value.absent(),
    this.dailyTipType = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.imgUrl = const Value.absent(),
    this.active = const Value.absent(),
  });
  DailyTipsCompanion.insert({
    this.id = const Value.absent(),
    this.insertTimestamp = const Value.absent(),
    this.updateTimestamp = const Value.absent(),
    this.dailyTipType = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.imgUrl = const Value.absent(),
    this.active = const Value.absent(),
  });
  static Insertable<DailyTip> custom({
    Expression<int>? id,
    Expression<String?>? insertTimestamp,
    Expression<String?>? updateTimestamp,
    Expression<String?>? dailyTipType,
    Expression<String?>? title,
    Expression<String?>? description,
    Expression<String?>? imgUrl,
    Expression<bool?>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (insertTimestamp != null) 'insert_timestamp': insertTimestamp,
      if (updateTimestamp != null) 'update_timestamp': updateTimestamp,
      if (dailyTipType != null) 'daily_tip_type': dailyTipType,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (imgUrl != null) 'img_url': imgUrl,
      if (active != null) 'active': active,
    });
  }

  DailyTipsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? insertTimestamp,
      Value<String?>? updateTimestamp,
      Value<String?>? dailyTipType,
      Value<String?>? title,
      Value<String?>? description,
      Value<String?>? imgUrl,
      Value<bool?>? active}) {
    return DailyTipsCompanion(
      id: id ?? this.id,
      insertTimestamp: insertTimestamp ?? this.insertTimestamp,
      updateTimestamp: updateTimestamp ?? this.updateTimestamp,
      dailyTipType: dailyTipType ?? this.dailyTipType,
      title: title ?? this.title,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (insertTimestamp.present) {
      map['insert_timestamp'] = Variable<String?>(insertTimestamp.value);
    }
    if (updateTimestamp.present) {
      map['update_timestamp'] = Variable<String?>(updateTimestamp.value);
    }
    if (dailyTipType.present) {
      map['daily_tip_type'] = Variable<String?>(dailyTipType.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (imgUrl.present) {
      map['img_url'] = Variable<String?>(imgUrl.value);
    }
    if (active.present) {
      map['active'] = Variable<bool?>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyTipsCompanion(')
          ..write('id: $id, ')
          ..write('insertTimestamp: $insertTimestamp, ')
          ..write('updateTimestamp: $updateTimestamp, ')
          ..write('dailyTipType: $dailyTipType, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $DailyTipsTable extends DailyTips
    with TableInfo<$DailyTipsTable, DailyTip> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DailyTipsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _insertTimestampMeta =
      const VerificationMeta('insertTimestamp');
  late final GeneratedColumn<String?> insertTimestamp =
      GeneratedColumn<String?>('insert_timestamp', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _updateTimestampMeta =
      const VerificationMeta('updateTimestamp');
  late final GeneratedColumn<String?> updateTimestamp =
      GeneratedColumn<String?>('update_timestamp', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _dailyTipTypeMeta =
      const VerificationMeta('dailyTipType');
  late final GeneratedColumn<String?> dailyTipType = GeneratedColumn<String?>(
      'daily_tip_type', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _imgUrlMeta = const VerificationMeta('imgUrl');
  late final GeneratedColumn<String?> imgUrl = GeneratedColumn<String?>(
      'img_url', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _activeMeta = const VerificationMeta('active');
  late final GeneratedColumn<bool?> active = GeneratedColumn<bool?>(
      'active', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (active IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        insertTimestamp,
        updateTimestamp,
        dailyTipType,
        title,
        description,
        imgUrl,
        active
      ];
  @override
  String get aliasedName => _alias ?? 'daily_tips';
  @override
  String get actualTableName => 'daily_tips';
  @override
  VerificationContext validateIntegrity(Insertable<DailyTip> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('insert_timestamp')) {
      context.handle(
          _insertTimestampMeta,
          insertTimestamp.isAcceptableOrUnknown(
              data['insert_timestamp']!, _insertTimestampMeta));
    }
    if (data.containsKey('update_timestamp')) {
      context.handle(
          _updateTimestampMeta,
          updateTimestamp.isAcceptableOrUnknown(
              data['update_timestamp']!, _updateTimestampMeta));
    }
    if (data.containsKey('daily_tip_type')) {
      context.handle(
          _dailyTipTypeMeta,
          dailyTipType.isAcceptableOrUnknown(
              data['daily_tip_type']!, _dailyTipTypeMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('img_url')) {
      context.handle(_imgUrlMeta,
          imgUrl.isAcceptableOrUnknown(data['img_url']!, _imgUrlMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyTip map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DailyTip.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DailyTipsTable createAlias(String alias) {
    return $DailyTipsTable(_db, alias);
  }
}

class Workout extends DataClass implements Insertable<Workout> {
  final int id;
  final String? insertTimestamp;
  final String? updateTimestamp;
  final String? workoutTitle;
  final String? workoutPhoto;
  final String? workoutLevel;
  final String? workoutTime;
  final String? aboutWorkout;
  final bool? active;
  final bool? isnew;
  final bool? isPremium;
  Workout(
      {required this.id,
      this.insertTimestamp,
      this.updateTimestamp,
      this.workoutTitle,
      this.workoutPhoto,
      this.workoutLevel,
      this.workoutTime,
      this.aboutWorkout,
      this.active,
      this.isnew,
      this.isPremium});
  factory Workout.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Workout(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      insertTimestamp: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}insert_timestamp']),
      updateTimestamp: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}update_timestamp']),
      workoutTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}workout_title']),
      workoutPhoto: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}workout_photo']),
      workoutLevel: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}workout_level']),
      workoutTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}workout_time']),
      aboutWorkout: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}about_workout']),
      active: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}active']),
      isnew: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}isnew']),
      isPremium: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_premium']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || insertTimestamp != null) {
      map['insert_timestamp'] = Variable<String?>(insertTimestamp);
    }
    if (!nullToAbsent || updateTimestamp != null) {
      map['update_timestamp'] = Variable<String?>(updateTimestamp);
    }
    if (!nullToAbsent || workoutTitle != null) {
      map['workout_title'] = Variable<String?>(workoutTitle);
    }
    if (!nullToAbsent || workoutPhoto != null) {
      map['workout_photo'] = Variable<String?>(workoutPhoto);
    }
    if (!nullToAbsent || workoutLevel != null) {
      map['workout_level'] = Variable<String?>(workoutLevel);
    }
    if (!nullToAbsent || workoutTime != null) {
      map['workout_time'] = Variable<String?>(workoutTime);
    }
    if (!nullToAbsent || aboutWorkout != null) {
      map['about_workout'] = Variable<String?>(aboutWorkout);
    }
    if (!nullToAbsent || active != null) {
      map['active'] = Variable<bool?>(active);
    }
    if (!nullToAbsent || isnew != null) {
      map['isnew'] = Variable<bool?>(isnew);
    }
    if (!nullToAbsent || isPremium != null) {
      map['is_premium'] = Variable<bool?>(isPremium);
    }
    return map;
  }

  WorkoutsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsCompanion(
      id: Value(id),
      insertTimestamp: insertTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(insertTimestamp),
      updateTimestamp: updateTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(updateTimestamp),
      workoutTitle: workoutTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutTitle),
      workoutPhoto: workoutPhoto == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutPhoto),
      workoutLevel: workoutLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutLevel),
      workoutTime: workoutTime == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutTime),
      aboutWorkout: aboutWorkout == null && nullToAbsent
          ? const Value.absent()
          : Value(aboutWorkout),
      active:
          active == null && nullToAbsent ? const Value.absent() : Value(active),
      isnew:
          isnew == null && nullToAbsent ? const Value.absent() : Value(isnew),
      isPremium: isPremium == null && nullToAbsent
          ? const Value.absent()
          : Value(isPremium),
    );
  }

  factory Workout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Workout(
      id: serializer.fromJson<int>(json['id']),
      insertTimestamp: serializer.fromJson<String?>(json['insertTimestamp']),
      updateTimestamp: serializer.fromJson<String?>(json['updateTimestamp']),
      workoutTitle: serializer.fromJson<String?>(json['workoutTitle']),
      workoutPhoto: serializer.fromJson<String?>(json['workoutPhoto']),
      workoutLevel: serializer.fromJson<String?>(json['workoutLevel']),
      workoutTime: serializer.fromJson<String?>(json['workoutTime']),
      aboutWorkout: serializer.fromJson<String?>(json['aboutWorkout']),
      active: serializer.fromJson<bool?>(json['active']),
      isnew: serializer.fromJson<bool?>(json['isnew']),
      isPremium: serializer.fromJson<bool?>(json['isPremium']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'insertTimestamp': serializer.toJson<String?>(insertTimestamp),
      'updateTimestamp': serializer.toJson<String?>(updateTimestamp),
      'workoutTitle': serializer.toJson<String?>(workoutTitle),
      'workoutPhoto': serializer.toJson<String?>(workoutPhoto),
      'workoutLevel': serializer.toJson<String?>(workoutLevel),
      'workoutTime': serializer.toJson<String?>(workoutTime),
      'aboutWorkout': serializer.toJson<String?>(aboutWorkout),
      'active': serializer.toJson<bool?>(active),
      'isnew': serializer.toJson<bool?>(isnew),
      'isPremium': serializer.toJson<bool?>(isPremium),
    };
  }

  Workout copyWith(
          {int? id,
          String? insertTimestamp,
          String? updateTimestamp,
          String? workoutTitle,
          String? workoutPhoto,
          String? workoutLevel,
          String? workoutTime,
          String? aboutWorkout,
          bool? active,
          bool? isnew,
          bool? isPremium}) =>
      Workout(
        id: id ?? this.id,
        insertTimestamp: insertTimestamp ?? this.insertTimestamp,
        updateTimestamp: updateTimestamp ?? this.updateTimestamp,
        workoutTitle: workoutTitle ?? this.workoutTitle,
        workoutPhoto: workoutPhoto ?? this.workoutPhoto,
        workoutLevel: workoutLevel ?? this.workoutLevel,
        workoutTime: workoutTime ?? this.workoutTime,
        aboutWorkout: aboutWorkout ?? this.aboutWorkout,
        active: active ?? this.active,
        isnew: isnew ?? this.isnew,
        isPremium: isPremium ?? this.isPremium,
      );
  @override
  String toString() {
    return (StringBuffer('Workout(')
          ..write('id: $id, ')
          ..write('insertTimestamp: $insertTimestamp, ')
          ..write('updateTimestamp: $updateTimestamp, ')
          ..write('workoutTitle: $workoutTitle, ')
          ..write('workoutPhoto: $workoutPhoto, ')
          ..write('workoutLevel: $workoutLevel, ')
          ..write('workoutTime: $workoutTime, ')
          ..write('aboutWorkout: $aboutWorkout, ')
          ..write('active: $active, ')
          ..write('isnew: $isnew, ')
          ..write('isPremium: $isPremium')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          insertTimestamp.hashCode,
          $mrjc(
              updateTimestamp.hashCode,
              $mrjc(
                  workoutTitle.hashCode,
                  $mrjc(
                      workoutPhoto.hashCode,
                      $mrjc(
                          workoutLevel.hashCode,
                          $mrjc(
                              workoutTime.hashCode,
                              $mrjc(
                                  aboutWorkout.hashCode,
                                  $mrjc(
                                      active.hashCode,
                                      $mrjc(isnew.hashCode,
                                          isPremium.hashCode)))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Workout &&
          other.id == this.id &&
          other.insertTimestamp == this.insertTimestamp &&
          other.updateTimestamp == this.updateTimestamp &&
          other.workoutTitle == this.workoutTitle &&
          other.workoutPhoto == this.workoutPhoto &&
          other.workoutLevel == this.workoutLevel &&
          other.workoutTime == this.workoutTime &&
          other.aboutWorkout == this.aboutWorkout &&
          other.active == this.active &&
          other.isnew == this.isnew &&
          other.isPremium == this.isPremium);
}

class WorkoutsCompanion extends UpdateCompanion<Workout> {
  final Value<int> id;
  final Value<String?> insertTimestamp;
  final Value<String?> updateTimestamp;
  final Value<String?> workoutTitle;
  final Value<String?> workoutPhoto;
  final Value<String?> workoutLevel;
  final Value<String?> workoutTime;
  final Value<String?> aboutWorkout;
  final Value<bool?> active;
  final Value<bool?> isnew;
  final Value<bool?> isPremium;
  const WorkoutsCompanion({
    this.id = const Value.absent(),
    this.insertTimestamp = const Value.absent(),
    this.updateTimestamp = const Value.absent(),
    this.workoutTitle = const Value.absent(),
    this.workoutPhoto = const Value.absent(),
    this.workoutLevel = const Value.absent(),
    this.workoutTime = const Value.absent(),
    this.aboutWorkout = const Value.absent(),
    this.active = const Value.absent(),
    this.isnew = const Value.absent(),
    this.isPremium = const Value.absent(),
  });
  WorkoutsCompanion.insert({
    this.id = const Value.absent(),
    this.insertTimestamp = const Value.absent(),
    this.updateTimestamp = const Value.absent(),
    this.workoutTitle = const Value.absent(),
    this.workoutPhoto = const Value.absent(),
    this.workoutLevel = const Value.absent(),
    this.workoutTime = const Value.absent(),
    this.aboutWorkout = const Value.absent(),
    this.active = const Value.absent(),
    this.isnew = const Value.absent(),
    this.isPremium = const Value.absent(),
  });
  static Insertable<Workout> custom({
    Expression<int>? id,
    Expression<String?>? insertTimestamp,
    Expression<String?>? updateTimestamp,
    Expression<String?>? workoutTitle,
    Expression<String?>? workoutPhoto,
    Expression<String?>? workoutLevel,
    Expression<String?>? workoutTime,
    Expression<String?>? aboutWorkout,
    Expression<bool?>? active,
    Expression<bool?>? isnew,
    Expression<bool?>? isPremium,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (insertTimestamp != null) 'insert_timestamp': insertTimestamp,
      if (updateTimestamp != null) 'update_timestamp': updateTimestamp,
      if (workoutTitle != null) 'workout_title': workoutTitle,
      if (workoutPhoto != null) 'workout_photo': workoutPhoto,
      if (workoutLevel != null) 'workout_level': workoutLevel,
      if (workoutTime != null) 'workout_time': workoutTime,
      if (aboutWorkout != null) 'about_workout': aboutWorkout,
      if (active != null) 'active': active,
      if (isnew != null) 'isnew': isnew,
      if (isPremium != null) 'is_premium': isPremium,
    });
  }

  WorkoutsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? insertTimestamp,
      Value<String?>? updateTimestamp,
      Value<String?>? workoutTitle,
      Value<String?>? workoutPhoto,
      Value<String?>? workoutLevel,
      Value<String?>? workoutTime,
      Value<String?>? aboutWorkout,
      Value<bool?>? active,
      Value<bool?>? isnew,
      Value<bool?>? isPremium}) {
    return WorkoutsCompanion(
      id: id ?? this.id,
      insertTimestamp: insertTimestamp ?? this.insertTimestamp,
      updateTimestamp: updateTimestamp ?? this.updateTimestamp,
      workoutTitle: workoutTitle ?? this.workoutTitle,
      workoutPhoto: workoutPhoto ?? this.workoutPhoto,
      workoutLevel: workoutLevel ?? this.workoutLevel,
      workoutTime: workoutTime ?? this.workoutTime,
      aboutWorkout: aboutWorkout ?? this.aboutWorkout,
      active: active ?? this.active,
      isnew: isnew ?? this.isnew,
      isPremium: isPremium ?? this.isPremium,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (insertTimestamp.present) {
      map['insert_timestamp'] = Variable<String?>(insertTimestamp.value);
    }
    if (updateTimestamp.present) {
      map['update_timestamp'] = Variable<String?>(updateTimestamp.value);
    }
    if (workoutTitle.present) {
      map['workout_title'] = Variable<String?>(workoutTitle.value);
    }
    if (workoutPhoto.present) {
      map['workout_photo'] = Variable<String?>(workoutPhoto.value);
    }
    if (workoutLevel.present) {
      map['workout_level'] = Variable<String?>(workoutLevel.value);
    }
    if (workoutTime.present) {
      map['workout_time'] = Variable<String?>(workoutTime.value);
    }
    if (aboutWorkout.present) {
      map['about_workout'] = Variable<String?>(aboutWorkout.value);
    }
    if (active.present) {
      map['active'] = Variable<bool?>(active.value);
    }
    if (isnew.present) {
      map['isnew'] = Variable<bool?>(isnew.value);
    }
    if (isPremium.present) {
      map['is_premium'] = Variable<bool?>(isPremium.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('insertTimestamp: $insertTimestamp, ')
          ..write('updateTimestamp: $updateTimestamp, ')
          ..write('workoutTitle: $workoutTitle, ')
          ..write('workoutPhoto: $workoutPhoto, ')
          ..write('workoutLevel: $workoutLevel, ')
          ..write('workoutTime: $workoutTime, ')
          ..write('aboutWorkout: $aboutWorkout, ')
          ..write('active: $active, ')
          ..write('isnew: $isnew, ')
          ..write('isPremium: $isPremium')
          ..write(')'))
        .toString();
  }
}

class $WorkoutsTable extends Workouts with TableInfo<$WorkoutsTable, Workout> {
  final GeneratedDatabase _db;
  final String? _alias;
  $WorkoutsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _insertTimestampMeta =
      const VerificationMeta('insertTimestamp');
  late final GeneratedColumn<String?> insertTimestamp =
      GeneratedColumn<String?>('insert_timestamp', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _updateTimestampMeta =
      const VerificationMeta('updateTimestamp');
  late final GeneratedColumn<String?> updateTimestamp =
      GeneratedColumn<String?>('update_timestamp', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _workoutTitleMeta =
      const VerificationMeta('workoutTitle');
  late final GeneratedColumn<String?> workoutTitle = GeneratedColumn<String?>(
      'workout_title', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _workoutPhotoMeta =
      const VerificationMeta('workoutPhoto');
  late final GeneratedColumn<String?> workoutPhoto = GeneratedColumn<String?>(
      'workout_photo', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _workoutLevelMeta =
      const VerificationMeta('workoutLevel');
  late final GeneratedColumn<String?> workoutLevel = GeneratedColumn<String?>(
      'workout_level', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _workoutTimeMeta =
      const VerificationMeta('workoutTime');
  late final GeneratedColumn<String?> workoutTime = GeneratedColumn<String?>(
      'workout_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _aboutWorkoutMeta =
      const VerificationMeta('aboutWorkout');
  late final GeneratedColumn<String?> aboutWorkout = GeneratedColumn<String?>(
      'about_workout', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _activeMeta = const VerificationMeta('active');
  late final GeneratedColumn<bool?> active = GeneratedColumn<bool?>(
      'active', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (active IN (0, 1))');
  final VerificationMeta _isnewMeta = const VerificationMeta('isnew');
  late final GeneratedColumn<bool?> isnew = GeneratedColumn<bool?>(
      'isnew', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (isnew IN (0, 1))');
  final VerificationMeta _isPremiumMeta = const VerificationMeta('isPremium');
  late final GeneratedColumn<bool?> isPremium = GeneratedColumn<bool?>(
      'is_premium', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_premium IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        insertTimestamp,
        updateTimestamp,
        workoutTitle,
        workoutPhoto,
        workoutLevel,
        workoutTime,
        aboutWorkout,
        active,
        isnew,
        isPremium
      ];
  @override
  String get aliasedName => _alias ?? 'workouts';
  @override
  String get actualTableName => 'workouts';
  @override
  VerificationContext validateIntegrity(Insertable<Workout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('insert_timestamp')) {
      context.handle(
          _insertTimestampMeta,
          insertTimestamp.isAcceptableOrUnknown(
              data['insert_timestamp']!, _insertTimestampMeta));
    }
    if (data.containsKey('update_timestamp')) {
      context.handle(
          _updateTimestampMeta,
          updateTimestamp.isAcceptableOrUnknown(
              data['update_timestamp']!, _updateTimestampMeta));
    }
    if (data.containsKey('workout_title')) {
      context.handle(
          _workoutTitleMeta,
          workoutTitle.isAcceptableOrUnknown(
              data['workout_title']!, _workoutTitleMeta));
    }
    if (data.containsKey('workout_photo')) {
      context.handle(
          _workoutPhotoMeta,
          workoutPhoto.isAcceptableOrUnknown(
              data['workout_photo']!, _workoutPhotoMeta));
    }
    if (data.containsKey('workout_level')) {
      context.handle(
          _workoutLevelMeta,
          workoutLevel.isAcceptableOrUnknown(
              data['workout_level']!, _workoutLevelMeta));
    }
    if (data.containsKey('workout_time')) {
      context.handle(
          _workoutTimeMeta,
          workoutTime.isAcceptableOrUnknown(
              data['workout_time']!, _workoutTimeMeta));
    }
    if (data.containsKey('about_workout')) {
      context.handle(
          _aboutWorkoutMeta,
          aboutWorkout.isAcceptableOrUnknown(
              data['about_workout']!, _aboutWorkoutMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('isnew')) {
      context.handle(
          _isnewMeta, isnew.isAcceptableOrUnknown(data['isnew']!, _isnewMeta));
    }
    if (data.containsKey('is_premium')) {
      context.handle(_isPremiumMeta,
          isPremium.isAcceptableOrUnknown(data['is_premium']!, _isPremiumMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Workout map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Workout.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WorkoutsTable createAlias(String alias) {
    return $WorkoutsTable(_db, alias);
  }
}

class WorkoutExerciseId extends DataClass
    implements Insertable<WorkoutExerciseId> {
  final int exerciseid;
  final int workoutid;
  final String? sets;
  final String? rep;
  final String? timer;
  final String? restTime;
  WorkoutExerciseId(
      {required this.exerciseid,
      required this.workoutid,
      this.sets,
      this.rep,
      this.timer,
      this.restTime});
  factory WorkoutExerciseId.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return WorkoutExerciseId(
      exerciseid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}exerciseid'])!,
      workoutid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}workoutid'])!,
      sets: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sets']),
      rep: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rep']),
      timer: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timer']),
      restTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rest_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['exerciseid'] = Variable<int>(exerciseid);
    map['workoutid'] = Variable<int>(workoutid);
    if (!nullToAbsent || sets != null) {
      map['sets'] = Variable<String?>(sets);
    }
    if (!nullToAbsent || rep != null) {
      map['rep'] = Variable<String?>(rep);
    }
    if (!nullToAbsent || timer != null) {
      map['timer'] = Variable<String?>(timer);
    }
    if (!nullToAbsent || restTime != null) {
      map['rest_time'] = Variable<String?>(restTime);
    }
    return map;
  }

  WorkoutExerciseIdsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutExerciseIdsCompanion(
      exerciseid: Value(exerciseid),
      workoutid: Value(workoutid),
      sets: sets == null && nullToAbsent ? const Value.absent() : Value(sets),
      rep: rep == null && nullToAbsent ? const Value.absent() : Value(rep),
      timer:
          timer == null && nullToAbsent ? const Value.absent() : Value(timer),
      restTime: restTime == null && nullToAbsent
          ? const Value.absent()
          : Value(restTime),
    );
  }

  factory WorkoutExerciseId.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WorkoutExerciseId(
      exerciseid: serializer.fromJson<int>(json['exerciseid']),
      workoutid: serializer.fromJson<int>(json['workoutid']),
      sets: serializer.fromJson<String?>(json['sets']),
      rep: serializer.fromJson<String?>(json['rep']),
      timer: serializer.fromJson<String?>(json['timer']),
      restTime: serializer.fromJson<String?>(json['restTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'exerciseid': serializer.toJson<int>(exerciseid),
      'workoutid': serializer.toJson<int>(workoutid),
      'sets': serializer.toJson<String?>(sets),
      'rep': serializer.toJson<String?>(rep),
      'timer': serializer.toJson<String?>(timer),
      'restTime': serializer.toJson<String?>(restTime),
    };
  }

  WorkoutExerciseId copyWith(
          {int? exerciseid,
          int? workoutid,
          String? sets,
          String? rep,
          String? timer,
          String? restTime}) =>
      WorkoutExerciseId(
        exerciseid: exerciseid ?? this.exerciseid,
        workoutid: workoutid ?? this.workoutid,
        sets: sets ?? this.sets,
        rep: rep ?? this.rep,
        timer: timer ?? this.timer,
        restTime: restTime ?? this.restTime,
      );
  @override
  String toString() {
    return (StringBuffer('WorkoutExerciseId(')
          ..write('exerciseid: $exerciseid, ')
          ..write('workoutid: $workoutid, ')
          ..write('sets: $sets, ')
          ..write('rep: $rep, ')
          ..write('timer: $timer, ')
          ..write('restTime: $restTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      exerciseid.hashCode,
      $mrjc(
          workoutid.hashCode,
          $mrjc(sets.hashCode,
              $mrjc(rep.hashCode, $mrjc(timer.hashCode, restTime.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutExerciseId &&
          other.exerciseid == this.exerciseid &&
          other.workoutid == this.workoutid &&
          other.sets == this.sets &&
          other.rep == this.rep &&
          other.timer == this.timer &&
          other.restTime == this.restTime);
}

class WorkoutExerciseIdsCompanion extends UpdateCompanion<WorkoutExerciseId> {
  final Value<int> exerciseid;
  final Value<int> workoutid;
  final Value<String?> sets;
  final Value<String?> rep;
  final Value<String?> timer;
  final Value<String?> restTime;
  const WorkoutExerciseIdsCompanion({
    this.exerciseid = const Value.absent(),
    this.workoutid = const Value.absent(),
    this.sets = const Value.absent(),
    this.rep = const Value.absent(),
    this.timer = const Value.absent(),
    this.restTime = const Value.absent(),
  });
  WorkoutExerciseIdsCompanion.insert({
    required int exerciseid,
    required int workoutid,
    this.sets = const Value.absent(),
    this.rep = const Value.absent(),
    this.timer = const Value.absent(),
    this.restTime = const Value.absent(),
  })  : exerciseid = Value(exerciseid),
        workoutid = Value(workoutid);
  static Insertable<WorkoutExerciseId> custom({
    Expression<int>? exerciseid,
    Expression<int>? workoutid,
    Expression<String?>? sets,
    Expression<String?>? rep,
    Expression<String?>? timer,
    Expression<String?>? restTime,
  }) {
    return RawValuesInsertable({
      if (exerciseid != null) 'exerciseid': exerciseid,
      if (workoutid != null) 'workoutid': workoutid,
      if (sets != null) 'sets': sets,
      if (rep != null) 'rep': rep,
      if (timer != null) 'timer': timer,
      if (restTime != null) 'rest_time': restTime,
    });
  }

  WorkoutExerciseIdsCompanion copyWith(
      {Value<int>? exerciseid,
      Value<int>? workoutid,
      Value<String?>? sets,
      Value<String?>? rep,
      Value<String?>? timer,
      Value<String?>? restTime}) {
    return WorkoutExerciseIdsCompanion(
      exerciseid: exerciseid ?? this.exerciseid,
      workoutid: workoutid ?? this.workoutid,
      sets: sets ?? this.sets,
      rep: rep ?? this.rep,
      timer: timer ?? this.timer,
      restTime: restTime ?? this.restTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (exerciseid.present) {
      map['exerciseid'] = Variable<int>(exerciseid.value);
    }
    if (workoutid.present) {
      map['workoutid'] = Variable<int>(workoutid.value);
    }
    if (sets.present) {
      map['sets'] = Variable<String?>(sets.value);
    }
    if (rep.present) {
      map['rep'] = Variable<String?>(rep.value);
    }
    if (timer.present) {
      map['timer'] = Variable<String?>(timer.value);
    }
    if (restTime.present) {
      map['rest_time'] = Variable<String?>(restTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutExerciseIdsCompanion(')
          ..write('exerciseid: $exerciseid, ')
          ..write('workoutid: $workoutid, ')
          ..write('sets: $sets, ')
          ..write('rep: $rep, ')
          ..write('timer: $timer, ')
          ..write('restTime: $restTime')
          ..write(')'))
        .toString();
  }
}

class $WorkoutExerciseIdsTable extends WorkoutExerciseIds
    with TableInfo<$WorkoutExerciseIdsTable, WorkoutExerciseId> {
  final GeneratedDatabase _db;
  final String? _alias;
  $WorkoutExerciseIdsTable(this._db, [this._alias]);
  final VerificationMeta _exerciseidMeta = const VerificationMeta('exerciseid');
  late final GeneratedColumn<int?> exerciseid = GeneratedColumn<int?>(
      'exerciseid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _workoutidMeta = const VerificationMeta('workoutid');
  late final GeneratedColumn<int?> workoutid = GeneratedColumn<int?>(
      'workoutid', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _setsMeta = const VerificationMeta('sets');
  late final GeneratedColumn<String?> sets = GeneratedColumn<String?>(
      'sets', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _repMeta = const VerificationMeta('rep');
  late final GeneratedColumn<String?> rep = GeneratedColumn<String?>(
      'rep', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _timerMeta = const VerificationMeta('timer');
  late final GeneratedColumn<String?> timer = GeneratedColumn<String?>(
      'timer', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _restTimeMeta = const VerificationMeta('restTime');
  late final GeneratedColumn<String?> restTime = GeneratedColumn<String?>(
      'rest_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [exerciseid, workoutid, sets, rep, timer, restTime];
  @override
  String get aliasedName => _alias ?? 'workout_exercise_ids';
  @override
  String get actualTableName => 'workout_exercise_ids';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutExerciseId> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('exerciseid')) {
      context.handle(
          _exerciseidMeta,
          exerciseid.isAcceptableOrUnknown(
              data['exerciseid']!, _exerciseidMeta));
    } else if (isInserting) {
      context.missing(_exerciseidMeta);
    }
    if (data.containsKey('workoutid')) {
      context.handle(_workoutidMeta,
          workoutid.isAcceptableOrUnknown(data['workoutid']!, _workoutidMeta));
    } else if (isInserting) {
      context.missing(_workoutidMeta);
    }
    if (data.containsKey('sets')) {
      context.handle(
          _setsMeta, sets.isAcceptableOrUnknown(data['sets']!, _setsMeta));
    }
    if (data.containsKey('rep')) {
      context.handle(
          _repMeta, rep.isAcceptableOrUnknown(data['rep']!, _repMeta));
    }
    if (data.containsKey('timer')) {
      context.handle(
          _timerMeta, timer.isAcceptableOrUnknown(data['timer']!, _timerMeta));
    }
    if (data.containsKey('rest_time')) {
      context.handle(_restTimeMeta,
          restTime.isAcceptableOrUnknown(data['rest_time']!, _restTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {exerciseid, workoutid};
  @override
  WorkoutExerciseId map(Map<String, dynamic> data, {String? tablePrefix}) {
    return WorkoutExerciseId.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WorkoutExerciseIdsTable createAlias(String alias) {
    return $WorkoutExerciseIdsTable(_db, alias);
  }
}

class WaterInTake extends DataClass implements Insertable<WaterInTake> {
  final int id;
  final int? totalGlass;
  final int? drinkGlass;
  final int? reminderInterval;
  final String? sleepTime;
  final String? wakeupTime;
  final String? workoutTime;
  final String? dayTime;
  WaterInTake(
      {required this.id,
      this.totalGlass,
      this.drinkGlass,
      this.reminderInterval,
      this.sleepTime,
      this.wakeupTime,
      this.workoutTime,
      this.dayTime});
  factory WaterInTake.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return WaterInTake(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      totalGlass: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_glass']),
      drinkGlass: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}drink_glass']),
      reminderInterval: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reminder_interval']),
      sleepTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sleep_time']),
      wakeupTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}wakeup_time']),
      workoutTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}workout_time']),
      dayTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}day_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || totalGlass != null) {
      map['total_glass'] = Variable<int?>(totalGlass);
    }
    if (!nullToAbsent || drinkGlass != null) {
      map['drink_glass'] = Variable<int?>(drinkGlass);
    }
    if (!nullToAbsent || reminderInterval != null) {
      map['reminder_interval'] = Variable<int?>(reminderInterval);
    }
    if (!nullToAbsent || sleepTime != null) {
      map['sleep_time'] = Variable<String?>(sleepTime);
    }
    if (!nullToAbsent || wakeupTime != null) {
      map['wakeup_time'] = Variable<String?>(wakeupTime);
    }
    if (!nullToAbsent || workoutTime != null) {
      map['workout_time'] = Variable<String?>(workoutTime);
    }
    if (!nullToAbsent || dayTime != null) {
      map['day_time'] = Variable<String?>(dayTime);
    }
    return map;
  }

  WaterInTakesCompanion toCompanion(bool nullToAbsent) {
    return WaterInTakesCompanion(
      id: Value(id),
      totalGlass: totalGlass == null && nullToAbsent
          ? const Value.absent()
          : Value(totalGlass),
      drinkGlass: drinkGlass == null && nullToAbsent
          ? const Value.absent()
          : Value(drinkGlass),
      reminderInterval: reminderInterval == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderInterval),
      sleepTime: sleepTime == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepTime),
      wakeupTime: wakeupTime == null && nullToAbsent
          ? const Value.absent()
          : Value(wakeupTime),
      workoutTime: workoutTime == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutTime),
      dayTime: dayTime == null && nullToAbsent
          ? const Value.absent()
          : Value(dayTime),
    );
  }

  factory WaterInTake.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WaterInTake(
      id: serializer.fromJson<int>(json['id']),
      totalGlass: serializer.fromJson<int?>(json['totalGlass']),
      drinkGlass: serializer.fromJson<int?>(json['drinkGlass']),
      reminderInterval: serializer.fromJson<int?>(json['reminderInterval']),
      sleepTime: serializer.fromJson<String?>(json['sleepTime']),
      wakeupTime: serializer.fromJson<String?>(json['wakeupTime']),
      workoutTime: serializer.fromJson<String?>(json['workoutTime']),
      dayTime: serializer.fromJson<String?>(json['dayTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'totalGlass': serializer.toJson<int?>(totalGlass),
      'drinkGlass': serializer.toJson<int?>(drinkGlass),
      'reminderInterval': serializer.toJson<int?>(reminderInterval),
      'sleepTime': serializer.toJson<String?>(sleepTime),
      'wakeupTime': serializer.toJson<String?>(wakeupTime),
      'workoutTime': serializer.toJson<String?>(workoutTime),
      'dayTime': serializer.toJson<String?>(dayTime),
    };
  }

  WaterInTake copyWith(
          {int? id,
          int? totalGlass,
          int? drinkGlass,
          int? reminderInterval,
          String? sleepTime,
          String? wakeupTime,
          String? workoutTime,
          String? dayTime}) =>
      WaterInTake(
        id: id ?? this.id,
        totalGlass: totalGlass ?? this.totalGlass,
        drinkGlass: drinkGlass ?? this.drinkGlass,
        reminderInterval: reminderInterval ?? this.reminderInterval,
        sleepTime: sleepTime ?? this.sleepTime,
        wakeupTime: wakeupTime ?? this.wakeupTime,
        workoutTime: workoutTime ?? this.workoutTime,
        dayTime: dayTime ?? this.dayTime,
      );
  @override
  String toString() {
    return (StringBuffer('WaterInTake(')
          ..write('id: $id, ')
          ..write('totalGlass: $totalGlass, ')
          ..write('drinkGlass: $drinkGlass, ')
          ..write('reminderInterval: $reminderInterval, ')
          ..write('sleepTime: $sleepTime, ')
          ..write('wakeupTime: $wakeupTime, ')
          ..write('workoutTime: $workoutTime, ')
          ..write('dayTime: $dayTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          totalGlass.hashCode,
          $mrjc(
              drinkGlass.hashCode,
              $mrjc(
                  reminderInterval.hashCode,
                  $mrjc(
                      sleepTime.hashCode,
                      $mrjc(wakeupTime.hashCode,
                          $mrjc(workoutTime.hashCode, dayTime.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WaterInTake &&
          other.id == this.id &&
          other.totalGlass == this.totalGlass &&
          other.drinkGlass == this.drinkGlass &&
          other.reminderInterval == this.reminderInterval &&
          other.sleepTime == this.sleepTime &&
          other.wakeupTime == this.wakeupTime &&
          other.workoutTime == this.workoutTime &&
          other.dayTime == this.dayTime);
}

class WaterInTakesCompanion extends UpdateCompanion<WaterInTake> {
  final Value<int> id;
  final Value<int?> totalGlass;
  final Value<int?> drinkGlass;
  final Value<int?> reminderInterval;
  final Value<String?> sleepTime;
  final Value<String?> wakeupTime;
  final Value<String?> workoutTime;
  final Value<String?> dayTime;
  const WaterInTakesCompanion({
    this.id = const Value.absent(),
    this.totalGlass = const Value.absent(),
    this.drinkGlass = const Value.absent(),
    this.reminderInterval = const Value.absent(),
    this.sleepTime = const Value.absent(),
    this.wakeupTime = const Value.absent(),
    this.workoutTime = const Value.absent(),
    this.dayTime = const Value.absent(),
  });
  WaterInTakesCompanion.insert({
    this.id = const Value.absent(),
    this.totalGlass = const Value.absent(),
    this.drinkGlass = const Value.absent(),
    this.reminderInterval = const Value.absent(),
    this.sleepTime = const Value.absent(),
    this.wakeupTime = const Value.absent(),
    this.workoutTime = const Value.absent(),
    this.dayTime = const Value.absent(),
  });
  static Insertable<WaterInTake> custom({
    Expression<int>? id,
    Expression<int?>? totalGlass,
    Expression<int?>? drinkGlass,
    Expression<int?>? reminderInterval,
    Expression<String?>? sleepTime,
    Expression<String?>? wakeupTime,
    Expression<String?>? workoutTime,
    Expression<String?>? dayTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (totalGlass != null) 'total_glass': totalGlass,
      if (drinkGlass != null) 'drink_glass': drinkGlass,
      if (reminderInterval != null) 'reminder_interval': reminderInterval,
      if (sleepTime != null) 'sleep_time': sleepTime,
      if (wakeupTime != null) 'wakeup_time': wakeupTime,
      if (workoutTime != null) 'workout_time': workoutTime,
      if (dayTime != null) 'day_time': dayTime,
    });
  }

  WaterInTakesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? totalGlass,
      Value<int?>? drinkGlass,
      Value<int?>? reminderInterval,
      Value<String?>? sleepTime,
      Value<String?>? wakeupTime,
      Value<String?>? workoutTime,
      Value<String?>? dayTime}) {
    return WaterInTakesCompanion(
      id: id ?? this.id,
      totalGlass: totalGlass ?? this.totalGlass,
      drinkGlass: drinkGlass ?? this.drinkGlass,
      reminderInterval: reminderInterval ?? this.reminderInterval,
      sleepTime: sleepTime ?? this.sleepTime,
      wakeupTime: wakeupTime ?? this.wakeupTime,
      workoutTime: workoutTime ?? this.workoutTime,
      dayTime: dayTime ?? this.dayTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (totalGlass.present) {
      map['total_glass'] = Variable<int?>(totalGlass.value);
    }
    if (drinkGlass.present) {
      map['drink_glass'] = Variable<int?>(drinkGlass.value);
    }
    if (reminderInterval.present) {
      map['reminder_interval'] = Variable<int?>(reminderInterval.value);
    }
    if (sleepTime.present) {
      map['sleep_time'] = Variable<String?>(sleepTime.value);
    }
    if (wakeupTime.present) {
      map['wakeup_time'] = Variable<String?>(wakeupTime.value);
    }
    if (workoutTime.present) {
      map['workout_time'] = Variable<String?>(workoutTime.value);
    }
    if (dayTime.present) {
      map['day_time'] = Variable<String?>(dayTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WaterInTakesCompanion(')
          ..write('id: $id, ')
          ..write('totalGlass: $totalGlass, ')
          ..write('drinkGlass: $drinkGlass, ')
          ..write('reminderInterval: $reminderInterval, ')
          ..write('sleepTime: $sleepTime, ')
          ..write('wakeupTime: $wakeupTime, ')
          ..write('workoutTime: $workoutTime, ')
          ..write('dayTime: $dayTime')
          ..write(')'))
        .toString();
  }
}

class $WaterInTakesTable extends WaterInTakes
    with TableInfo<$WaterInTakesTable, WaterInTake> {
  final GeneratedDatabase _db;
  final String? _alias;
  $WaterInTakesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalGlassMeta = const VerificationMeta('totalGlass');
  late final GeneratedColumn<int?> totalGlass = GeneratedColumn<int?>(
      'total_glass', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _drinkGlassMeta = const VerificationMeta('drinkGlass');
  late final GeneratedColumn<int?> drinkGlass = GeneratedColumn<int?>(
      'drink_glass', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _reminderIntervalMeta =
      const VerificationMeta('reminderInterval');
  late final GeneratedColumn<int?> reminderInterval = GeneratedColumn<int?>(
      'reminder_interval', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _sleepTimeMeta = const VerificationMeta('sleepTime');
  late final GeneratedColumn<String?> sleepTime = GeneratedColumn<String?>(
      'sleep_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _wakeupTimeMeta = const VerificationMeta('wakeupTime');
  late final GeneratedColumn<String?> wakeupTime = GeneratedColumn<String?>(
      'wakeup_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _workoutTimeMeta =
      const VerificationMeta('workoutTime');
  late final GeneratedColumn<String?> workoutTime = GeneratedColumn<String?>(
      'workout_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _dayTimeMeta = const VerificationMeta('dayTime');
  late final GeneratedColumn<String?> dayTime = GeneratedColumn<String?>(
      'day_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        totalGlass,
        drinkGlass,
        reminderInterval,
        sleepTime,
        wakeupTime,
        workoutTime,
        dayTime
      ];
  @override
  String get aliasedName => _alias ?? 'water_in_takes';
  @override
  String get actualTableName => 'water_in_takes';
  @override
  VerificationContext validateIntegrity(Insertable<WaterInTake> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('total_glass')) {
      context.handle(
          _totalGlassMeta,
          totalGlass.isAcceptableOrUnknown(
              data['total_glass']!, _totalGlassMeta));
    }
    if (data.containsKey('drink_glass')) {
      context.handle(
          _drinkGlassMeta,
          drinkGlass.isAcceptableOrUnknown(
              data['drink_glass']!, _drinkGlassMeta));
    }
    if (data.containsKey('reminder_interval')) {
      context.handle(
          _reminderIntervalMeta,
          reminderInterval.isAcceptableOrUnknown(
              data['reminder_interval']!, _reminderIntervalMeta));
    }
    if (data.containsKey('sleep_time')) {
      context.handle(_sleepTimeMeta,
          sleepTime.isAcceptableOrUnknown(data['sleep_time']!, _sleepTimeMeta));
    }
    if (data.containsKey('wakeup_time')) {
      context.handle(
          _wakeupTimeMeta,
          wakeupTime.isAcceptableOrUnknown(
              data['wakeup_time']!, _wakeupTimeMeta));
    }
    if (data.containsKey('workout_time')) {
      context.handle(
          _workoutTimeMeta,
          workoutTime.isAcceptableOrUnknown(
              data['workout_time']!, _workoutTimeMeta));
    }
    if (data.containsKey('day_time')) {
      context.handle(_dayTimeMeta,
          dayTime.isAcceptableOrUnknown(data['day_time']!, _dayTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WaterInTake map(Map<String, dynamic> data, {String? tablePrefix}) {
    return WaterInTake.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WaterInTakesTable createAlias(String alias) {
    return $WaterInTakesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$AppDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $WorkoutPlansTable workoutPlans = $WorkoutPlansTable(this);
  late final $WeeksTable weeks = $WeeksTable(this);
  late final $DaysTable days = $DaysTable(this);
  late final $ExerciseIdsTable exerciseIds = $ExerciseIdsTable(this);
  late final $ExerciseProgressTable exerciseProgress =
      $ExerciseProgressTable(this);
  late final $WorkoutExerciseProgressTable workoutExerciseProgress =
      $WorkoutExerciseProgressTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $DailyTipsTable dailyTips = $DailyTipsTable(this);
  late final $WorkoutsTable workouts = $WorkoutsTable(this);
  late final $WorkoutExerciseIdsTable workoutExerciseIds =
      $WorkoutExerciseIdsTable(this);
  late final $WaterInTakesTable waterInTakes = $WaterInTakesTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final PlanDao planDao = PlanDao(this as AppDatabase);
  late final ExerciseDao exerciseDao = ExerciseDao(this as AppDatabase);
  late final ExerciseProgressDao exerciseProgressDao =
      ExerciseProgressDao(this as AppDatabase);
  late final DailyTipsDao dailyTipsDao = DailyTipsDao(this as AppDatabase);
  late final WorkoutDao workoutDao = WorkoutDao(this as AppDatabase);
  late final WaterInTakeDao waterInTakeDao =
      WaterInTakeDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        workoutPlans,
        weeks,
        days,
        exerciseIds,
        exerciseProgress,
        workoutExerciseProgress,
        exercises,
        users,
        dailyTips,
        workouts,
        workoutExerciseIds,
        waterInTakes
      ];
}
