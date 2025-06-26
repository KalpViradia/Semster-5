import 'package:advance_flutter_lab/lab_7/4/utils/import_export.dart';

class GetXRxListCrudController {
  RxList<GetXRxListCrudModel> studentList = <GetXRxListCrudModel>[].obs;

  void addStudent(String name, int rollNumber) {
    studentList.add(GetXRxListCrudModel(name: name, rollNumber: rollNumber));
  }

  void deleteStudent(int index) {
    if (index >= 0 && index < studentList.length) {
      studentList.removeAt(index);
    }
  }

  void updateStudent(int index, String name, int rollNumber) {
    if (index >= 0 && index < studentList.length) {
      final student = studentList[index];
      student.name = name;
      student.rollNumber = rollNumber;
      studentList[index] = student;
    }
  }

  void toggleFavourite(int index) {
    if (index >= 0 && index < studentList.length) {
      final student = studentList[index];
      student.isFavourite.value = !student.isFavourite.value;
    }
  }
}