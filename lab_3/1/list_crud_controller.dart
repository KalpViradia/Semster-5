import 'package:advance_flutter_lab/lab_3/1/utils/import_export.dart';

class ListCrudController {
  ListCrudModel _listCrudModel = ListCrudModel();

  List<Map<String, dynamic>> getUsers() => _listCrudModel.getUsers();

  Map<String, dynamic> getUserById(int id) => _listCrudModel.getUserById(id);

  void addUser(String name, String email) => _listCrudModel.addUser(name, email);

  void updateUserById(int index, String name, String email) => _listCrudModel.updateUserById(index, name, email);

  void deleteUser(String name) => _listCrudModel.deleteUser(name);
}