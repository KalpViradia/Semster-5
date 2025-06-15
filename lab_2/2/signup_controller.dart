import 'package:advance_flutter_lab/lab_2/2/utils/import_export.dart';

class SignupController {
  final SignupModal model = SignupModal();

  void addUser(String name, String email, String phoneNumber,
      String password, String confirmPassword) {
    model.addSignupDetails(name, email, phoneNumber, password, confirmPassword);
  }

  List<Map<String, dynamic>> getUsers() {
    return model.getSignupDetails();
  }
}
