import 'package:advance_flutter_lab/lab_6/4/utils/import_export.dart';

class GetXCountdownRxIntView extends StatelessWidget {
  final GetXCountdownRxIntController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              'Time Left: ${controller.seconds.value}s',
              style: TextStyle(fontSize: 32),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.startCountdown,
              child: Text(BTN_START_TIMER),
            ),
          ],
        ),
      ),
    );
  }
}