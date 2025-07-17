import 'dart:io';
import '../utils/import_export.dart';

void main() {
  final controller = InputController();

  while (true) {
    stdout.write('Enter input (type "exit" to quit): ');
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'exit') break;

    controller.validateInput(input);
  }

  print('Program finished.');
}
