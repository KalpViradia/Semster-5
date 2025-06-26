import 'package:advance_flutter_lab/lab_6/5/utils/import_export.dart';

class GetXRxBoolController extends GetxController {
  final GetXRxBoolModel _model = GetXRxBoolModel();

  RxBool get isVisible => _model.isVisible;

  void toggleVisibility() {
    _model.isVisible.value = !_model.isVisible.value;
  }
}