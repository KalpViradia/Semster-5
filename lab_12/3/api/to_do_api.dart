import 'package:second/lab_12/3/utils/import_export.dart';

class TodoApiService extends GetConnect implements ApiService {
  final String baseUrl = 'https://66ed2084380821644cdb7fe9.mockapi.io/';

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    allowAutoSignedCert = true;
  }

  @override
  Future<List<Todo>> fetchTodos() async {
    final res = await get('todos');
    if (res.statusCode == 200) {
      return (res.body as List).map((e) => Todo.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> addTodo(Todo todo) async {
    await post('todos', todo.toJson());
  }

  @override
  Future<void> updateTodo(String id, Todo todo) async {
    await put('todos/$id', todo.toJson());
  }

  @override
  Future<void> deleteTodo(String id) async {
    await delete('todos/$id');
  }
}
