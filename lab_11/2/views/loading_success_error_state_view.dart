import 'package:second/lab_11/2/utils/import_export.dart';

class ErrorStateScreen extends StatelessWidget {
  final ErrorStateController controller = Get.find<ErrorStateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Obx(() {
        switch (controller.status.value) {
          case StudentFetchStatus.loading:
            return const Center(child: CircularProgressIndicator());

          case StudentFetchStatus.error:
            return Center(child: Text('Error: ${controller.errorMessage}'));

          case StudentFetchStatus.success:
            return ListView.builder(
              itemCount: controller.students.length,
              itemBuilder: (context, index) {
                final student = controller.students[index];
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text('Age: ${student.age} | Email: ${student.email}'),
                );
              },
            );

          default:
            return const Center(child: Text('Press button to load students.'));
        }
      }),
    );
  }
}