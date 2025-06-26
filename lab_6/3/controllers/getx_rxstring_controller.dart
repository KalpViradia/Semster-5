import 'package:advance_flutter_lab/lab_6/3/utils/import_export.dart';

class GetXRxStringController extends GetxController {
  final GetXRxStringModel _model = GetXRxStringModel();

  RxString get text => _model.text;

  void updateText(String value) {
    _model.text.value = value;
  }
}