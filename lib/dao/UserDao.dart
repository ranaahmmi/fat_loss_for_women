import 'package:fat_loss_for_women/database/app_database.dart';
import 'package:fat_loss_for_women/models/WorkoutModel/Users.dart';
import 'package:moor/moor.dart';
part 'UserDao.g.dart';

@UseDao(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  final AppDatabase db;

  UserDao(this.db) : super(db);

  Stream<User> getUser() {
    return select(users).watchSingle();
  }

  Future<User> getUserfuture() {
    return select(users).getSingle();
  }

  Future insertUser(User user) => into(users).insertOnConflictUpdate(user);
}
