import 'package:advance_flutter_lab/lab_9/1/utils/import_export.dart';

class SQLiteDatabaseModel {
  final int? id;
  final String name;
  final String enrollmentNumber;
  final double? grade12;
  final double? diplomaCgpa;
  final double currentCgpa;
  final String email;
  final String phone;
  final String city;

  SQLiteDatabaseModel({
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

  factory SQLiteDatabaseModel.fromMap(Map<String, dynamic> map) {
    return SQLiteDatabaseModel(
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
