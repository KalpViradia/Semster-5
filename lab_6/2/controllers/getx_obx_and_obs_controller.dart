import 'package:advance_flutter_lab/lab_6/2/utils/import_export.dart';

class GetXObxAndObsController extends GetxController {
  final GetXObxAndObsModel _model = GetXObxAndObsModel();

  RxInt get counter => _model.value;

  void increment() {
    _model.value++;
  }
}