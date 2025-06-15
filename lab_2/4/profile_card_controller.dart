import 'package:advance_flutter_lab/lab_2/4/utils/import_export.dart';

class ProfileController {
  ProfileModel _profileModel = ProfileModel();

  List<Map<String, dynamic>> getUsers() => _profileModel.getUsers();
}