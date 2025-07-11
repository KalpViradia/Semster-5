import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DivisionByZeroException implements Exception {
  final String message;

  DivisionByZeroException([this.message = "Cannot divide by zero"]) {
    Get.snackbar(
      "Division Error",
      message,
      backgroundColor: const Color(0xFFffcccc),
      colorText: const Color(0xFFcc0000),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  String toString() => "DivisionByZeroException: $message";
}
