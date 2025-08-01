import '../utils/import_export.dart';
import 'package:http/http.dart' as http;

class DownloadCheckController extends GetxController {
  RxString status = ''.obs;

  Future<void> downloadFileWithCheck({
    required String fileUrl,
    required String fileName,
  }) async {
    // Step 1: Request storage permission
    final permission = await Permission.manageExternalStorage.request();
    if (!permission.isGranted) {
      status.value = 'Storage permission denied.';
      return;
    }

    // Step 2: Build the target path
    final String filePath = '/storage/emulated/0/Download/$fileName';
    final File file = File(filePath);

    // Step 3: Check if file already exists
    if (await file.exists()) {
      status.value = 'File already exists at:\n$filePath';
      return;
    }

    try {
      // Step 4: Download and write the file
      final response = await http.get(Uri.parse(fileUrl));
      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
        status.value = 'File downloaded to:\n$filePath';
      } else {
        status.value = 'Download failed: ${response.statusCode}';
      }
    } catch (e) {
      status.value = 'Download error: $e';
    }
  }
}
