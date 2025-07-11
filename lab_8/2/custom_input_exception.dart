import 'package:second/lab_8/2/utils/import_export.dart';

void main() async {
  try {
    stdout.write("Enter an integer: ");
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      throw CustomInputException("Input cannot be empty.");
    }

    int number = int.parse(input);
    print("You entered: $number");
  } on FormatException {
    print("FormatException: Invalid number format.");
  } on CustomInputException catch (e) {
    print("Caught custom exception: $e");
  }

  bool testSocket = true; // Set to false to skip socket test

  if (testSocket) {
    print("\nChecking internet connection...");

    try {
      final addresses = await InternetAddress.lookup('invalid.domain.for.test');
      print("Connected to: ${addresses.first}");
    } on SocketException {
      print("SocketException: Failed to connect. No internet or invalid domain.");
    }
  } else {
    print("\nSkipping internet check as testSocket = false");
  }
}
