import 'package:advance_flutter_lab/lab_9/2/utils/import_export.dart';

class SQLiteDatabaseMapView extends StatelessWidget {
  final SQLiteDatabaseMapController controller = Get.put(SQLiteDatabaseMapController());

  SQLiteDatabaseMapView({super.key});

  void addSample() {
    final student = SQLiteDatabaseMapModel(
      name: "Kalp",
      enrollmentNumber: "23010101",
      grade12: 89.5,
      currentCgpa: 8.58,
      email: "kalp@example.com",
      phone: "9876543210",
      city: "Rajkot",
    );
    controller.addStudent(student);
  }

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
            final student = controller.studentList[index];
            return ListTile(
              title: Text(student.name),
              subtitle: Text('${student.city} | CGPA: ${student.currentCgpa}'),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: addSample,
        child: const Icon(Icons.add),
      ),
    );
  }
}
