import 'package:advance_flutter_lab/lab_7/3/utils/import_export.dart';

class GetXAddDeleteModel {
  String? name;
  int? rollNumber;
  RxBool isFavourite;

  GetXAddDeleteModel({
    this.name,
    this.rollNumber,
    bool isFavourite = false,
  }) : isFavourite = isFavourite.obs;
}