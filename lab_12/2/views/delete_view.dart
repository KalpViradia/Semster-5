import 'package:second/lab_12/2/utils/import_export.dart';

class StudentDeleteApiView extends StatelessWidget {
  final StudentDeleteApiController controller = Get.put(StudentDeleteApiController());

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Obx(() => ListView.builder(
        itemCount: controller.students.length,
        itemBuilder: (_, index) {
          final student = controller.students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text("${student.age}, ${student.email}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => showStudentForm(student: student),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.deleteStudent(student.id!),
                ),
              ],
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showStudentForm(),
        child: Icon(Icons.add),
      ),
    );
  }

  void showStudentForm({StudentDeleteApiModel? student}) {
    if (student != null) {
      nameController.text = student.name;
      ageController.text = student.age.toString();
      emailController.text = student.email;
    } else {
      nameController.clear();
      ageController.clear();
      emailController.clear();
    }

    Get.defaultDialog(
      title: student == null ? BTN_ADD : BTN_UPDATE,
      content: Column(
        children: [
          TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
          TextField(controller: ageController, decoration: InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
          TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
        ],
      ),
      textConfirm: "Save",
      textCancel: "Cancel",
      onConfirm: () {
        final s = StudentDeleteApiModel(
          id: student?.id,
          name: nameController.text,
          age: int.parse(ageController.text),
          email: emailController.text,
        );
        if (student == null) {
          controller.addStudent(s);
        } else {
          controller.updateStudent(student.id!, s);
        }
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }
}
