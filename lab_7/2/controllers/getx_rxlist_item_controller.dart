import 'package:advance_flutter_lab/lab_7/2/utils/import_export.dart';

class GetXRxListItemController extends GetxController {
  RxList<GetXRxListItemModel> list = <GetXRxListItemModel>[
    GetXRxListItemModel(name: 'Kalp', rollNumber: 347),
    GetXRxListItemModel(name: 'Harshil', rollNumber: 342)
  ].obs;

  void toggleFavourite(int index) {
    if (index >= 0 && index < list.length) {
      final item = list[index];
      item.isFavourite.value = !item.isFavourite.value;
    }
  }
}