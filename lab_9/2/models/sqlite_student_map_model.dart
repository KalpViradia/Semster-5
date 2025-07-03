import 'package:advance_flutter_lab/lab_9/2/utils/import_export.dart';

class SQLiteDatabaseMapModel {
  int? id;
  String name;
  String enrollmentNumber;
  double? grade12;
  double? diplomaCgpa;
  double currentCgpa;
  String email;
  String phone;
  String city;

  SQLiteDatabaseMapModel({
    this.id,
    required this.name,
    required this.enrollmentNumber,
    this.grade12,
    this.diplomaCgpa,
    required this.currentCgpa,
    required this.email,
    required this.phone,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      COL_ID: id,
      COL_NAME: name,
      COL_ENROLLMENT_NUMBER: enrollmentNumber,
      COL_GRADE_12: grade12,
      COL_DIPLOMA_CGPA: diplomaCgpa,
      COL_CURRENT_CGPA: currentCgpa,
      COL_EMAIL: email,
      COL_PHONE: phone,
      COL_CITY: city,
    };
  }

  factory SQLiteDatabaseMapModel.fromMap(Map<String, dynamic> map) {
    return SQLiteDatabaseMapModel(
      id: map[COL_ID],
      name: map[COL_NAME],
      enrollmentNumber: map[COL_ENROLLMENT_NUMBER],
      grade12: map[COL_GRADE_12],
      diplomaCgpa: map[COL_DIPLOMA_CGPA],
      currentCgpa: map[COL_CURRENT_CGPA],
      email: map[COL_EMAIL],
      phone: map[COL_PHONE],
      city: map[COL_CITY],
    );
  }
}