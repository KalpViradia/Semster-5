import 'package:advance_flutter_lab/lab_9/3/utils/import_export.dart';

class SQLiteDisplayRXListView extends StatelessWidget {
  SQLiteDisplayRXListView({super.key});

  final controller = Get.put(SQLiteDisplayRXListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),
      body: Obx(() {
        if (controller.studentList.isEmpty) {
          return Center(
            child: Text(
              MSG_NO_DATA,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.studentList.length,
          itemBuilder: (context, index) {
            final s = controller.studentList[index];
            return ListTile(
              title: Text(s.name),
              subtitle: Text("City: ${s.city} | CGPA: ${s.currentCgpa}"),
              trailing: Text(s.enrollmentNumber),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addSampleStudent,
        child: const Icon(Icons.add),
        tooltip: 'Add Sample Student',
      ),
    );
  }
}
