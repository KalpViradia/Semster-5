import '../utils/import_export.dart';

class WriteFilePage extends StatelessWidget {
  final WriteFileController controller = Get.put(WriteFileController());
  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Write File to External Storage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: inputController,
              decoration: const InputDecoration(
                labelText: 'Enter text to write to file',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  controller.writeToFile(inputController.text.trim()),
              child: const Text('Write to File'),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(controller.writeStatus.value)),
          ],
        ),
      ),
    );
  }
}
