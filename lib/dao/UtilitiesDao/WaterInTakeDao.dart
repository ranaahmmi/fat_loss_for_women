import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/UtitlitesModel/waterIntake.dart';
import 'package:moor/moor.dart';
part 'WaterInTakeDao.g.dart';

@UseDao(tables: [WaterInTakes])
class WaterInTakeDao extends DatabaseAccessor<AppDatabase>
    with _$WaterInTakeDaoMixin {
  final AppDatabase db;

  WaterInTakeDao(this.db) : super(db);

  Stream<WaterInTake> getWaterIntake() {
    return select(waterInTakes).watchSingle();
  }

  Future<WaterInTake> getWaterIntakefuture() {
    return select(waterInTakes).getSingle();
  }

  Future insertWaterIntake(WaterInTake waterInTake) =>
      into(waterInTakes).insertOnConflictUpdate(waterInTake);
}
