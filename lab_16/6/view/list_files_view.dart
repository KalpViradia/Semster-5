import '../utils/import_export.dart';

class ListFilesPage extends StatelessWidget {
  final ListFilesController controller = Get.put(ListFilesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Files in External Storage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: controller.listDownloadFiles,
              child: const Text('Show Download Folder Files'),
            ),
            const SizedBox(height: 10),
            Obx(() => Text(controller.status.value)),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.files.length,
                  itemBuilder: (context, index) {
                    final file = controller.files[index];
                    return ListTile(
                      title: Text(file.path.split('/').last),
                      subtitle: Text(file.path),
                      leading: const Icon(Icons.insert_drive_file),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
