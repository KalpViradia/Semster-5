import 'package:second/lab_12/2/utils/import_export.dart';

class StudentDeleteApiService extends GetConnect {
  final String baseUrl = 'https://66ed2084380821644cdb7fe9.mockapi.io/users';

  Future<Response> fetchStudents() => get(baseUrl);

  Future<Response> addStudent(StudentDeleteApiModel student) => post(baseUrl, student.toJson());

  Future<Response> updateStudent(String id, StudentDeleteApiModel student) =>
      put('$baseUrl/$id', student.toJson());

  Future<Response> deleteStudent(String id) => delete('$baseUrl/$id');
}

