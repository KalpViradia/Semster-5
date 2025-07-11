import 'package:second/lab_11/2/utils/import_export.dart';

class ErrorStateController extends GetxController {
  final ApiService apiService = Get.find<StudentApiService>();

  var students = <Student>[].obs;
  var status = StudentFetchStatus.initial.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      status.value = StudentFetchStatus.loading;
      final response = await apiService.getStudents();
      students.value = response.cast<Student>();
      status.value = StudentFetchStatus.success;
    } catch (e) {
      status.value = StudentFetchStatus.error;
      errorMessage.value = e.toString();
    }
  }
}
