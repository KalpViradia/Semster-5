import 'package:advance_flutter_lab/lab_6/1/utils/import_export.dart';

class GetXNonReactiveVariablesController extends GetxController {
  final GetXNonReactiveVariablesModel _model = GetXNonReactiveVariablesModel();

  int get counter => _model.value;

  void increment() {
    _model.value++;
  }
}