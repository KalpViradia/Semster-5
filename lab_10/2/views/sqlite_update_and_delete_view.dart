import 'package:advance_flutter_lab/lab_10/2/utils/import_export.dart';

class SQLiteInsertAndUpdateView extends StatelessWidget {
  final controller = Get.put(SQLiteInsertAndUpdateController());

  SQLiteInsertAndUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE_VIEW)),
      body: Obx(() {
        final students = controller.students;

        if (students.isEmpty) {
          return Center(
            child: Text(
              MSG_NO_DATA,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            final s = students[index];
            return ListTile(
              title: Text(s.name),
              subtitle: Text(s.enrollmentNumber),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => Get.to(() => SQLiteInsertAndUpdateFormView(student: s)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await controller.deleteStudent(s.id!);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.to(() => const SQLiteInsertAndUpdateFormView()),
      ),
    );
  }
}