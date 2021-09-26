import 'package:moor/moor.dart';

class Days extends Table {
  IntColumn get id => integer()();
  IntColumn get weekid => integer()();
  IntColumn get planid => integer()();
  TextColumn get daytitle => text().nullable()() ;
  @override
  Set<Column> get primaryKey => {id, weekid, planid};
}
