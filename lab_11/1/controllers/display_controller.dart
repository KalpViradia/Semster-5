import 'package:second/lab_11/1/utils/import_export.dart';


class StudentController extends GetxController {
  final ApiService apiService = Get.find<StudentApiService>();
  var students = <Student>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final response = await apiService.getStudents();

    students.value = response.cast<Student>();
  }
}