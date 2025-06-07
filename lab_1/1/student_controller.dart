import './utils/import_export.dart';

class StudentController {
  StudentModel _studentModel = StudentModel();

  Map<String, dynamic> displayDetails() => _studentModel.displayDetails();
}