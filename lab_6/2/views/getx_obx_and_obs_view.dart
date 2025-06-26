import 'package:advance_flutter_lab/lab_6/2/utils/import_export.dart';

class GetXObxAndObsView extends StatelessWidget {
  final GetXObxAndObsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              'Obx: ${controller.counter.value}',
              style: TextStyle(fontSize: 22),
            )),
            SizedBox(height: 20),
            GetX<GetXObxAndObsController>(
              builder: (_) => Text(
                'GetX: ${_.counter.value}',
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text(BTN_INCREMENT),
            ),
          ],
        ),
      ),
    );
  }
}