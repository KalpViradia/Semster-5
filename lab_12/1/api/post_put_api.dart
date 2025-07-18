import 'package:second/lab_12/1/utils/import_export.dart';

class StudentPostPutApiService extends GetConnect {
  final String baseUrl = 'https://66ed2084380821644cdb7fe9.mockapi.io/';

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    allowAutoSignedCert = true;
  }

  Future<Response> fetchStudents() => get('users');

  Future<Response> addStudent(StudentPostPutModel student) =>
      post('users', student.toJson());

  Future<Response> updateStudent(String id, StudentPostPutModel student) =>
      put('users/$id', student.toJson());
}
