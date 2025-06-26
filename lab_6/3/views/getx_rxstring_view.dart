import 'package:advance_flutter_lab/lab_6/3/utils/import_export.dart';

class GetXRxStringView extends StatelessWidget {
  final GetXRxStringController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter text'),
              onChanged: controller.updateText,
            ),
            SizedBox(height: 20),
            Obx(() => Text(
              'You typed: ${controller.text.value}',
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}