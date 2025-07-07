import 'package:advance_flutter_lab/lab_10/1/utils/import_export.dart';

class SQLiteInsertView extends StatelessWidget {
  final controller = Get.put(SQLiteInsertController());

  SQLiteInsertView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE_VIEW)),
      body: Obx(() {
        final students = controller.students;
        final hasData = controller.universities.isNotEmpty ||
            controller.semesters.isNotEmpty ||
            controller.branches.isNotEmpty ||
            controller.students.isNotEmpty;

        if (!hasData) {
          return Center(
            child: Text(
              MSG_NO_DATA,
              style: TextStyle(fontSize: 18, color: Colors.grey),
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
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.to(() => const SQLiteInsertFormView()),
      ),
    );
  }
}
