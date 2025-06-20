import 'package:advance_flutter_lab/lab_5/5/utils/import_export.dart';

class FormController extends GetxController {
  final name = ''.obs;
  final age = 0.obs;

  void submitForm(String inputName, int inputAge) {
    name.value = inputName;
    age.value = inputAge;
  }

  User get user => User(name: name.value, age: age.value);
}