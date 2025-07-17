import '../utils/import_export.dart';

class InputController {
  final model = InputModel();

  void validateInput(String input) {
    try {
      final result = model.process(input);
      print('$result');
    } on InvalidInputException catch (e) {
      print('Caught custom exception: $e');
    } catch (e) {
      print('Unknown error: $e');
    }
  }
}
