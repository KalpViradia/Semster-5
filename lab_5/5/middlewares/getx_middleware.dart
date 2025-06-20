import 'package:advance_flutter_lab/lab_5/5/utils/import_export.dart';

class AgeCheckMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final age = Get.find<FormController>().age.value;

    if (age < 18) {
      Get.snackbar('Access Denied', 'You age must be 18 or above.');
      return const RouteSettings(name: '/home');
    }

    return null;
  }
}