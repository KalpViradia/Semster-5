import 'package:second/lab_11/3/utils/import_export.dart';
import 'package:http/http.dart' as http;

class SearchApi {
  static const String baseUrl = 'https://66ed2084380821644cdb7fe9.mockapi.io/users';

  Future<List<ApiSearchModel>> fetchData() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => ApiSearchModel.fromMap(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}