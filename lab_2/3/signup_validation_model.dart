class SignupValidationModal {
  static final List<Map<String, dynamic>> signuplist = [];

  void addSignupDetails(String name, String email, String phoneNumber,
      String password, String confirmPassword) {
    signuplist.add({
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "confirmPassword": confirmPassword,
    });
  }

  List<Map<String, dynamic>> getSignupDetails() {
    return signuplist;
  }

  String? validateName(String name) {
    return name.isEmpty ? 'Name cannot be empty' : null;
  }

  String? validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{3,5}$');
    return emailRegex.hasMatch(email) ? null : 'Invalid email format';
  }

  String? validatePhone(String phone) {
    return phone.length == 10 ? null : 'Phone number contain 10 digit';
  }

  String? validatePassword(String password) {
    return password.length >= 6 ? null : 'Password must be at least 6 characters';
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    return password == confirmPassword ? null : 'Passwords do not match';
  }
}
