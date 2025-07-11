import 'package:second/lab_12/3/utils/import_export.dart';

abstract class ApiService {
  Future<List<Todo>> fetchTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(String id, Todo todo);
  Future<void> deleteTodo(String id);
}
