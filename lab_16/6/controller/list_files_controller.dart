import '../utils/import_export.dart';

class ListFilesController extends GetxController {
  RxList<FileSystemEntity> files = <FileSystemEntity>[].obs;
  RxString status = ''.obs;

  Future<void> listDownloadFiles() async {
    final statusPermission = await Permission.manageExternalStorage.request();

    if (!statusPermission.isGranted) {
      status.value = 'Storage permission denied.';
      return;
    }

    try {
      final Directory dir = Directory('/storage/emulated/0/Download');
      if (await dir.exists()) {
        final List<FileSystemEntity> allFiles = dir.listSync();
        files.assignAll(allFiles);
        status.value = 'Found ${allFiles.length} file(s).';
      } else {
        status.value = 'Download directory not found.';
      }
    } catch (e) {
      status.value = 'Error reading files: $e';
    }
  }
}
