import '../utils/import_export.dart';

class InputModel {
  String process(String input) {
    if (input.trim().isEmpty) {
      throw InvalidInputException('Input cannot be empty!');
    }
    if (input.length < 3) {
      throw InvalidInputException('Input must be at least 3 characters long.');
    }

    return 'Input is valid: $input';
  }
}
