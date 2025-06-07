import 'package:advance_flutter_lab/lab_2/2/utils/import_export.dart';

class SignupController {
  final SignupModal model = SignupModal();

  String? validateForm(String name, String email, String phone, String password, String confirmPassword) {
    final nameError = model.validateName(name);
    if (nameError != null) return nameError;

    final emailError = model.validateEmail(email);
    if (emailError != null) return emailError;

    final phoneError = model.validatePhone(phone);
    if (phoneError != null) return phoneError;

    final passwordError = model.validatePassword(password);
    if (passwordError != null) return passwordError;

    final confirmError = model.validateConfirmPassword(password, confirmPassword);
    if (confirmError != null) return confirmError;

    return null; // All validations passed
  }

  void addUser(String name, String email, String phoneNumber,
      String password, String confirmPassword) {
    model.addSignupDetails(name, email, phoneNumber, password, confirmPassword);
  }

  List<Map<String, dynamic>> getUsers() {
    return model.getSignupDetails();
  }
}
