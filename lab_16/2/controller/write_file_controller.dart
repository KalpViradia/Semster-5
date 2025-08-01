import '../utils/import_export.dart';

class WriteFileController extends GetxController {
  RxString writeStatus = 'No data written yet.'.obs;

  Future<void> writeToFile(String text) async {
    final status = await Permission.manageExternalStorage.request();

    if (!status.isGranted) {
      writeStatus.value = 'Storage permission denied.';
      return;
    }

    try {
      final filePath = '/storage/emulated/0/Download/sample.txt';
      final file = File(filePath);

      await file.writeAsString(text, mode: FileMode.write);
      writeStatus.value = 'Data written successfully to:\n$filePath';
    } catch (e) {
      writeStatus.value = 'Failed to write file: $e';
    }
  }
}
