import 'package:moor/moor.dart';

class ExerciseProgress extends Table {
  IntColumn get planid => integer()();
  IntColumn get weekid => integer()();
  IntColumn get dayid => integer()();
  IntColumn get exerciseId => integer()();
  IntColumn get progress => integer()();
      @override
  Set<Column> get primaryKey => {weekid,dayid,planid,exerciseId};
}
