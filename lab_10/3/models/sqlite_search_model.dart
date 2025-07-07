import 'package:advance_flutter_lab/lab_10/3/utils/import_export.dart';

class SQLiteInsertAndUpdateModel {
  final int? id;
  final String name;
  final String enrollmentNumber;
  final double? grade12;
  final double? diplomaCgpa;
  final double currentCgpa;
  final String email;
  final String phone;
  final String city;
  final int? universityId;
  final int? semesterId;
  final int? branchId;

  SQLiteInsertAndUpdateModel({
    this.id,
    required this.name,
    required this.enrollmentNumber,
    this.grade12,
    this.diplomaCgpa,
    required this.currentCgpa,
    required this.email,
    required this.phone,
    required this.city,
    this.universityId,
    this.semesterId,
    this.branchId,
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
      COL_UNIVERSITY_ID: universityId,
      COL_SEMESTER_ID: semesterId,
      COL_BRANCH_ID: branchId,
    };
  }

  factory SQLiteInsertAndUpdateModel.fromMap(Map<String, dynamic> map) {
    return SQLiteInsertAndUpdateModel(
      id: map[COL_ID],
      name: map[COL_NAME],
      enrollmentNumber: map[COL_ENROLLMENT_NUMBER],
      grade12: map[COL_GRADE_12],
      diplomaCgpa: map[COL_DIPLOMA_CGPA],
      currentCgpa: map[COL_CURRENT_CGPA],
      email: map[COL_EMAIL],
      phone: map[COL_PHONE],
      city: map[COL_CITY],
      universityId: map[COL_UNIVERSITY_ID],
      semesterId: map[COL_SEMESTER_ID],
      branchId: map[COL_BRANCH_ID],
    );
  }
}

class University {
  final int? id;
  final String name;

  University({this.id, required this.name});

  Map<String, dynamic> toMap() => {COL_ID: id, COL_NAME: name};

  factory University.fromMap(Map<String, dynamic> map) =>
      University(id: map[COL_ID], name: map[COL_NAME]);
}

class Semester {
  final int? id;
  final String name;

  Semester({this.id, required this.name});

  Map<String, dynamic> toMap() => {COL_ID: id, COL_NAME: name};

  factory Semester.fromMap(Map<String, dynamic> map) =>
      Semester(id: map[COL_ID], name: map[COL_NAME]);
}

class Branch {
  final int? id;
  final String name;

  Branch({this.id, required this.name});

  Map<String, dynamic> toMap() => {COL_ID: id, COL_NAME: name};

  factory Branch.fromMap(Map<String, dynamic> map) =>
      Branch(id: map[COL_ID], name: map[COL_NAME]);
}