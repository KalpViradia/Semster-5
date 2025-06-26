import 'package:advance_flutter_lab/lab_7/4/utils/import_export.dart';

class GetXRxListCrudView extends StatelessWidget {
  GetXRxListCrudView({super.key});

  final GetXRxListCrudController controller = Get.put(GetXRxListCrudController());

  void showStudentDialog(BuildContext context, {int? index, String? name, int? roll}) {
    final nameController = TextEditingController(text: name);
    final rollController = TextEditingController(text: roll?.toString());

    final isEdit = index != null;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isEdit ? EDIT_FORM_TITLE : ADD_FORM_TITLE),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: rollController,
              decoration: const InputDecoration(labelText: 'Roll Number'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(BTN_CANCEL),
          ),
          ElevatedButton(
            onPressed: () {
              final newName = nameController.text.trim();
              final newRoll = int.tryParse(rollController.text.trim());

              if (newName.isNotEmpty && newRoll != null) {
                if (isEdit) {
                  controller.updateStudent(index, newName, newRoll);
                } else {
                  controller.addStudent(newName, newRoll);
                }
                Navigator.pop(context);
              }
            },
            child: Text(isEdit ? BTN_UPDATE_STUDENT : BTN_ADD_STUDENT),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),

      body: Obx(() {
        final list = controller.studentList;

        if (list.isEmpty) {
          return Center(child: Text(MSG_NO_DATA));
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: list.length,
          itemBuilder: (context, index) {
            final student = list[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: ListTile(
                leading: Obx(() => IconButton(
                  icon: Icon(
                    student.isFavourite.value
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: student.isFavourite.value ? Colors.red : Colors.grey,
                  ),
                  onPressed: () => controller.toggleFavourite(index),
                )),
                title: Text(student.name ?? 'No Name'),
                subtitle: Text('Roll Number: ${student.rollNumber}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => showStudentDialog(
                        context,
                        index: index,
                        name: student.name,
                        roll: student.rollNumber,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.deleteStudent(index),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () => showStudentDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}