import 'package:advance_flutter_lab/lab_5/2/utils/import_export.dart';

class GetxPassDataController extends GetxController {
  void goToSecondScreen() {
    User user = User(name: 'Kalp Viradia', age: 19);
    Get.to(() => GetxPassDataSecondView(), arguments: user);
  }
}