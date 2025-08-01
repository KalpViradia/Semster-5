import '../utils/import_export.dart';

class ReadFileController extends GetxController {
  RxString fileContent = 'Press the button to read file content'.obs;

  Future<void> readFileFromExternalStorage() async {
    final status = await Permission.manageExternalStorage.request();

    if (!status.isGranted) {
      fileContent.value = 'Storage permission denied.';
      return;
    }

    try {
      final filePath = '/storage/emulated/0/Download/sample.txt';
      final file = File(filePath);

      if (await file.exists()) {
        final contents = await file.readAsString();
        fileContent.value = contents;
      } else {
        fileContent.value = 'File not found at: $filePath';
      }
    } catch (e) {
      fileContent.value = 'Error reading file: $e';
    }
  }
}
