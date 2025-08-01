import '../utils/import_export.dart';

class ReadFilePage extends StatelessWidget {
  final ReadFileController controller = Get.put(ReadFileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Read File from External Storage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: controller.readFileFromExternalStorage,
              child: const Text('Read File'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(
                    () => SingleChildScrollView(
                  child: Text(controller.fileContent.value),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}