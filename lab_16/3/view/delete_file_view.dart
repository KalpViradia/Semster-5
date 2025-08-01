import '../utils/import_export.dart';

class DeleteFilePage extends StatelessWidget {
  final DeleteFileController controller = Get.put(DeleteFileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete File from External Storage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: controller.deleteFileFromExternalStorage,
              child: const Text('Delete sample.txt'),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(controller.deleteStatus.value)),
          ],
        ),
      ),
    );
  }
}
