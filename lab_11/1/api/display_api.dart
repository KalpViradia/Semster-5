import 'package:second/lab_11/1/utils/import_export.dart';
import 'package:http/http.dart' as http;

class StudentApiService implements ApiService {
  final String baseUrl = 'https://66ed2084380821644cdb7fe9.mockapi.io/users';

  @override
  Future<List<dynamic>> getStudents() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Student.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}