import 'package:advance_flutter_lab/lab_5/1/utils/import_export.dart';

class GetxNavigateScreensController extends GetxController {
  void goToSecondScreen() {
    Get.to(() => GetxNavigateScreensSecondView());
  }

  void goBack() {
    Get.back();
  }
}