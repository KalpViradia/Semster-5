import 'package:advance_flutter_lab/lab_5/3/utils/import_export.dart';

class GetxNavigateScreensNamedController extends GetxController {
  void goToSecondScreen() {
    Get.toNamed('/second');
  }

  void goBack() {
    Get.back();
  }
}