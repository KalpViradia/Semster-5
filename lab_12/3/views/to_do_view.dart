import 'package:second/lab_12/3/utils/import_export.dart';

class TodoView extends StatelessWidget {
  final TodoController controller = Get.put(TodoController());
  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (_, index) {
            final todo = controller.todos[index];
            return ListTile(
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () => controller.updateTodo(todo),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.deleteTodo(todo.id!),
                ),
              ]),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog() {
    inputController.clear();
    Get.defaultDialog(
      title: "Add Task",
      content: Column(
        children: [
          TextField(controller: inputController),
        ],
      ),
      textConfirm: "Add",
      onConfirm: () {
        if (inputController.text.trim().isNotEmpty) {
          controller.addTodo(inputController.text.trim());
          Get.back();
        }
      },
      textCancel: "Cancel",
    );
  }
}
