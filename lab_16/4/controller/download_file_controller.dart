import '../utils/import_export.dart';
import 'package:http/http.dart' as http;

class DownloadFileController extends GetxController {
  RxString downloadStatus = 'Click button to download file.'.obs;

  Future<void> downloadFileFromWeb({
    required String fileUrl,
    required String fileName,
  }) async {
    final status = await Permission.manageExternalStorage.request();

    if (!status.isGranted) {
      downloadStatus.value = 'Storage permission denied.';
      return;
    }

    try {
      final response = await http.get(Uri.parse(fileUrl));

      if (response.statusCode == 200) {
        final filePath = '/storage/emulated/0/Download/$fileName';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        downloadStatus.value = 'Downloaded successfully to:\n$filePath';
      } else {
        downloadStatus.value = 'Failed to download: ${response.statusCode}';
      }
    } catch (e) {
      downloadStatus.value = 'Download error: $e';
    }
  }
}
