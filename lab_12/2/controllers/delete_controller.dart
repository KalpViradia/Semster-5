import 'package:second/lab_12/2/utils/import_export.dart';

class StudentDeleteApiController extends GetxController {
  var students = <StudentDeleteApiModel>[].obs;
  final StudentDeleteApiService _api = StudentDeleteApiService();

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  void fetchStudents() async {
    final response = await _api.fetchStudents();
    if (response.statusCode == 200) {
      students.value = (response.body as List)
          .map((e) => StudentDeleteApiModel.fromJson(e))
          .toList();
    }
  }

  void addStudent(StudentDeleteApiModel student) async {
    final response = await _api.addStudent(student);
    if (response.statusCode == 201) fetchStudents();
  }

  void updateStudent(String id, StudentDeleteApiModel student) async {
    final response = await _api.updateStudent(id, student);
    if (response.statusCode == 200) fetchStudents();
  }

  void deleteStudent(String id) async {
    final confirm = await Get.defaultDialog(
      title: "Delete",
      middleText: "Are you sure you want to delete?",
      textCancel: "No",
      textConfirm: "Yes",
      onConfirm: () {
        Get.back(result: true);
      },
      onCancel: () {
        Get.back(result: false);
      },
    );

    if (confirm == true) {
      final response = await _api.deleteStudent(id);
      if (response.statusCode == 200) fetchStudents();
    }
  }
}
