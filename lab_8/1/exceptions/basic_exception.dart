class DivisionByZeroException implements Exception {
  final String message;

  DivisionByZeroException([this.message = "Cannot divide by zero"]);

  @override
  String toString() => "DivisionByZeroException: $message";
}
