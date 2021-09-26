import 'package:moor/moor.dart';

class DailyTips extends Table {
  IntColumn get id => integer()();
  TextColumn get insertTimestamp => text().nullable()();
  TextColumn get updateTimestamp => text().nullable()();
  TextColumn get dailyTipType => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get imgUrl => text().nullable()();

  BoolColumn get active => boolean().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
