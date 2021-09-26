import 'package:moor/moor.dart';


class Weeks extends Table{
  IntColumn get weekid => integer()();
  IntColumn get planid => integer()();
  TextColumn get weekTitle =>text().nullable()() ;
  
      @override
  Set<Column> get primaryKey => {weekid,planid};
  
}
