import './utils/import_export.dart';

class ProfileController {
  ProfileModel _profileModel = ProfileModel();

  List<Map<String, dynamic>> getUsers() => _profileModel.getUsers();
}