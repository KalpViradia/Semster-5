import '../utils/import_export.dart';

class DownloadCheckPage extends StatelessWidget {
  final DownloadCheckController controller = Get.put(DownloadCheckController());

  final String fileUrl =
      'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';
  final String fileName = 'dummy.pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Download with File Check')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                controller.downloadFileWithCheck(
                  fileUrl: fileUrl,
                  fileName: fileName,
                );
              },
              child: const Text('Download File'),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(controller.status.value)),
          ],
        ),
      ),
    );
  }
}
