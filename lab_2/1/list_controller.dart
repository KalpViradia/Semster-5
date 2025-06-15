import 'package:advance_flutter_lab/lab_2/1/utils/import_export.dart';

class UserListController {
  UserListModel _listModel = UserListModel();

  List<dynamic> userList() => _listModel.getUsers();

  void toggleFavourite(int index) => _listModel.toggleFavourite(index);
}