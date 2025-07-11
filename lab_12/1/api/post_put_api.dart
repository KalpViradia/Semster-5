import 'package:second/lab_12/1/utils/import_export.dart';

class StudentPostPutApiService extends GetConnect {
  final String baseUrl = 'https://66ed2084380821644cdb7fe9.mockapi.io/users';

  Future<Response> fetchStudents() => get(baseUrl);

  Future<Response> addStudent(StudentPostPutModel student) =>
      post(baseUrl, student.toJson());

  Future<Response> updateStudent(String id, StudentPostPutModel student) =>
      put('$baseUrl/$id', student.toJson());
}
