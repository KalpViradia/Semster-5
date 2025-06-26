import 'package:advance_flutter_lab/lab_7/1/utils/import_export.dart';

class GetXRxListController extends GetxController {
  RxList<GetXRxListModel> list = <GetXRxListModel>[
    GetXRxListModel(name: 'Kalp', rollNumber: 347),
    GetXRxListModel(name: 'Harshil', rollNumber: 342)
  ].obs;
}