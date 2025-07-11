import 'package:second/lab_11/1/utils/import_export.dart';

class Student {
  final String id;
  final String name;
  final int age;
  final String email;

  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.email});


  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        id : json[COL_ID].toString(),
        name : json[COL_NAME] ?? ' ',
        age : json[COL_AGE],
        email: json[COL_EMAIL] ?? ''
    );
  }
}