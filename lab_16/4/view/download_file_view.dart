import '../utils/import_export.dart';

class DownloadFilePage extends StatelessWidget {
  final DownloadFileController controller = Get.put(DownloadFileController());

  final String fileUrl =
      'https://www.learningcontainer.com/wp-content/uploads/2020/04/sample-text-file.txt';
  final String fileName = 'sample-text-file.txt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Download File to External Storage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  controller.downloadFileFromWeb(fileUrl: fileUrl, fileName: fileName),
              child: const Text('Download File'),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(controller.downloadStatus.value)),
          ],
        ),
      ),
    );
  }
}
