import 'package:second/lab_12/3/utils/import_export.dart';

class TodoController extends GetxController {
  final todos = <Todo>[].obs;
  final TodoApiService _api = TodoApiService();

  @override
  void onInit() {
    fetchTodos();
    super.onInit();
  }

  void fetchTodos() async {
    todos.value = await _api.fetchTodos();
  }

  void addTodo(String title) async {
    await _api.addTodo(Todo(title: title, isCompleted: false));
    fetchTodos();
  }

  void updateTodo(Todo todo) async {
    await _api.updateTodo(todo.id!, Todo(title: todo.title, isCompleted: !todo.isCompleted));
    fetchTodos();
  }

  void deleteTodo(String id) async {
    final confirm = await Get.dialog(AlertDialog(
      title: Text("Confirm Delete"),
      content: Text("Are you sure you want to delete this task?"),
      actions: [
        TextButton(onPressed: () => Get.back(result: false), child: Text("No")),
        TextButton(onPressed: () => Get.back(result: true), child: Text("Yes")),
      ],
    ));
    if (confirm == true) {
      await _api.deleteTodo(id);
      fetchTodos();
    }
  }
}
