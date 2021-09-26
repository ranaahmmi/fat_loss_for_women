import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/UtitlitesModel/DailyTips.dart';
import 'package:moor/moor.dart';
part 'DailyTipsDao.g.dart';

@UseDao(tables: [DailyTips])
class DailyTipsDao extends DatabaseAccessor<AppDatabase>
    with _$DailyTipsDaoMixin {
  final AppDatabase db;

  DailyTipsDao(this.db) : super(db);

  // Stream<DailyTips> getDailyTips() {
  //   return select(dailyTips).watchSingle();
  // }

  Stream<List<DailyTip>> getAllDailyTips() {
    return select(dailyTips).watch();
  }

  Future insertDailyTips(DailyTip tips) =>
      into(dailyTips).insertOnConflictUpdate(tips);
}
