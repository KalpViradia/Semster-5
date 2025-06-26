import 'package:advance_flutter_lab/lab_6/5/utils/import_export.dart';

class GetXRxBoolView extends StatelessWidget {
  final GetXRxBoolController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => controller.isVisible.value
                ? Text('Hello, this is visible.', style: TextStyle(fontSize: 22))
                : SizedBox.shrink()),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: controller.toggleVisibility,
              child: Obx(() => Text(controller.isVisible.value ? 'Hide' : 'Show')),
            ),
          ],
        ),
      ),
    );
  }
}