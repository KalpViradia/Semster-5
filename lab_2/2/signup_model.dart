class SignupModal {
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
}
