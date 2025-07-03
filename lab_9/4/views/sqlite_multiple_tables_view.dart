import 'package:advance_flutter_lab/lab_9/4/utils/import_export.dart';

class ListDisplayView extends StatelessWidget {
  final controller = Get.put(ListController());

  ListDisplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Obx(() {
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

        return ListView(
          children: [
            const ListTile(title: Text("Universities")),
            ...controller.universities.map((u) => ListTile(title: Text(u.name))),
            const Divider(),

            const ListTile(title: Text("Semesters")),
            ...controller.semesters.map((s) => ListTile(title: Text(s.name))),
            const Divider(),

            const ListTile(title: Text("Branches")),
            ...controller.branches.map((b) => ListTile(title: Text(b.name))),
            const Divider(),

            const ListTile(title: Text("Students")),
            ...controller.students.map((s) => ListTile(title: Text(s.name))),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.to(() => const AddStudentView()),
      ),
    );
  }
}
