import '../utils/import_export.dart';

void main() {
  final controller = AsyncController();
  while (true) {
    stdout.write('Enter text (type "exit" to quit): ');
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'exit') break;

    controller.processInput(input).then((value) {});
  }

  print('Program ended.');
}
