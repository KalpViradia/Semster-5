import 'package:advance_flutter_lab/lab_3/2/utils/import_export.dart';

class DatabaseController {
  Future<void> addUser(DatabaseModel user) => DatabaseModel.insert(user);
  Future<List<DatabaseModel>> getUsers() => DatabaseModel.getAllUsers();
  Future<void> updateUser(DatabaseModel user) => DatabaseModel.update(user);
  Future<void> deleteUser(int uid) => DatabaseModel.delete(uid);
}