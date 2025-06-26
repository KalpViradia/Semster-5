import 'package:advance_flutter_lab/lab_7/2/utils/import_export.dart';

class GetXRxListItemModel {
  String? name;
  int? rollNumber;
  RxBool isFavourite;

  GetXRxListItemModel({
    this.name,
    this.rollNumber,
    bool isFavourite = false,
  }) : isFavourite = isFavourite.obs;
}