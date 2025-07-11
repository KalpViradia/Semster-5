class CustomInputException implements Exception {
  final String message;
  CustomInputException([this.message = "Custom input exception occurred."]);

  @override
  String toString() => "CustomInputException: $message";
}
