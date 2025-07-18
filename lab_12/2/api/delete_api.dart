import 'package:second/lab_12/2/utils/import_export.dart';

class StudentDeleteApiService extends GetConnect {
  final String baseUrl = 'https://66ed2084380821644cdb7fe9.mockapi.io/';

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    allowAutoSignedCert = true;
  }

  Future<Response> fetchStudents() => get('users');

  Future<Response> addStudent(StudentDeleteApiModel student) => post('users', student.toJson());

  Future<Response> updateStudent(String id, StudentDeleteApiModel student) =>
      put('users/$id', student.toJson());

  Future<Response> deleteStudent(String id) => delete('users/$id');
}

