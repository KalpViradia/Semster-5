import 'package:advance_flutter_lab/lab_7/3/utils/import_export.dart';

class GetXAddDeleteController {
  RxList<GetXAddDeleteModel> studentList = <GetXAddDeleteModel>[].obs;

  void addStudent(String name, int rollNumber) {
    studentList.add(GetXAddDeleteModel(name: name, rollNumber: rollNumber));
  }

  void deleteStudent(int index) {
    if (index >= 0 && index < studentList.length) {
      studentList.removeAt(index);
    }
  }

  void toggleFavourite(int index) {
    if (index >= 0 && index < studentList.length) {
      final student = studentList[index];
      student.isFavourite.value = !student.isFavourite.value;
    }
  }
}