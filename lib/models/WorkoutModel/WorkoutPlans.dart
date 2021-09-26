import 'package:moor/moor.dart';

class WorkoutPlans extends Table {
  IntColumn  get id => integer()();
  TextColumn get insertTimestamp => text().nullable()();
  TextColumn get updateTimestamp => text().nullable()();
  TextColumn get planTitle => text().nullable()();
  TextColumn get planPhoto => text().nullable()();
  TextColumn get planLevel => text().nullable()();
  TextColumn get workoutTime => text().nullable()();
  TextColumn get challengeDuration => text().nullable()();
  TextColumn get aboutPlan => text().nullable()();
  TextColumn get fastFacts => text().nullable()();
  TextColumn get inAppPurchaseID => text().nullable()();
  TextColumn get planType => text().nullable()();
  BoolColumn get active => boolean().nullable()() ;
  BoolColumn get isnew => boolean().nullable()() ;
  BoolColumn get planPremium => boolean().nullable()() ;
  @override
  Set<Column> get primaryKey => {id};
}
