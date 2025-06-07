import 'package:advance_flutter_lab/lab_2/4/utils/import_export.dart';

class DashboardController {
  final DashboardModel _model = DashboardModel();

  List<Map<String, dynamic>> getHorizontalProducts() {
    return _model.getHorizontalProducts();
  }

  List<Map<String, dynamic>> getGridProducts() {
    return _model.getGridProducts();
  }
}
