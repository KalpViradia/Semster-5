import 'package:second/lab_12/2/utils/import_export.dart';

class StudentDeleteApiModel {
  final String? id;
  final String name;
  final int age;
  final String email;

  StudentDeleteApiModel({this.id, required this.name, required this.age, required this.email});

  factory StudentDeleteApiModel.fromJson(Map<String, dynamic> json) => StudentDeleteApiModel(
    id: json[COL_ID],
    name: json[COL_NAME],
    age: json[COL_AGE],
    email: json[COL_EMAIL],
  );

  Map<String, dynamic> toJson() => {
    COL_NAME: name,
    COL_AGE: age,
    COL_EMAIL: email,
  };
}
