import 'package:advance_flutter_lab/lab_7/4/utils/import_export.dart';

class GetXRxListCrudModel {
  String? name;
  int? rollNumber;
  RxBool isFavourite;

  GetXRxListCrudModel({
    this.name,
    this.rollNumber,
    bool isFavourite = false,
  }) : isFavourite = isFavourite.obs;
}