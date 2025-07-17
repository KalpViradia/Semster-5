import '../utils/import_export.dart';

class AsyncController {
  final AsyncModel model = AsyncModel();

  Future<void> processInput(String input) async {
    try {
      print('Waiting for response...');
      final result = await model.fetchData(input);
      print('Success: $result');
    } catch (e) {
      print('Error: $e');
    }
  }
}
