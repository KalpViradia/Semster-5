import '../utils/import_export.dart';

class DeleteFileController extends GetxController {
  RxString deleteStatus = 'No file deleted yet.'.obs;

  Future<void> deleteFileFromExternalStorage() async {
    final status = await Permission.manageExternalStorage.request();

    if (!status.isGranted) {
      deleteStatus.value = 'Storage permission denied.';
      return;
    }

    try {
      final filePath = '/storage/emulated/0/Download/sample.txt';
      final file = File(filePath);

      if (await file.exists()) {
        await file.delete();
        deleteStatus.value = 'File deleted successfully from:\n$filePath';
      } else {
        deleteStatus.value = 'File not found at: $filePath';
      }
    } catch (e) {
      deleteStatus.value = 'Error deleting file: $e';
    }
  }
}
