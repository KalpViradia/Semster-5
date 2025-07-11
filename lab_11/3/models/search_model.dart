import 'package:second/lab_11/3/utils/import_export.dart';

class ApiSearchModel {
  int? id;
  String? name;
  String? description;

  ApiSearchModel({this.id, this.name, this.description});

  Map<String, dynamic> toMap() {
    return {
      COL_ID: this.id,
      COL_NAME: name,
      COL_DESCRIPTION: description,
    };
  }

  ApiSearchModel.fromMap(Map<String, dynamic> map) {
    id = map[COL_ID];
    name = map[COL_NAME];
    description = map[COL_DESCRIPTION];
  }
}