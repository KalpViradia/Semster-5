import 'package:advance_flutter_lab/lab_9/4/utils/import_export.dart';

class ListController extends GetxController {
  RxList<University> universities = <University>[].obs;
  RxList<Semester> semesters = <Semester>[].obs;
  RxList<Branch> branches = <Branch>[].obs;
  RxList<SQLiteMultipleTablesModel> students = <SQLiteMultipleTablesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllLists();
    fetchStudents();
  }

  Future<void> fetchAllLists() async {
    final db = await SQLiteMultipleTablesDatabase.instance.database;

    final uniResult = await db.query(TBL_UNIVERSITY);
    final semResult = await db.query(TBL_SEMESTER);
    final branchResult = await db.query(TBL_BRANCH);

    universities.value = uniResult.map((e) => University.fromMap(e)).toList();
    semesters.value = semResult.map((e) => Semester.fromMap(e)).toList();
    branches.value = branchResult.map((e) => Branch.fromMap(e)).toList();
  }

  Future<void> fetchStudents() async {
    final db = await SQLiteMultipleTablesDatabase.instance.database;
    final result = await db.query(TBL_STUDENT);
    students.value = result.map((e) => SQLiteMultipleTablesModel.fromMap(e)).toList();
  }

  Future<void> addSampleData() async {
    final db = await SQLiteMultipleTablesDatabase.instance.database;

    await db.insert(TBL_UNIVERSITY, {COL_NAME: 'DU'});
    await db.insert(TBL_SEMESTER, {COL_NAME: 'Sem 5'});
    await db.insert(TBL_BRANCH, {COL_NAME: 'Computer'});

    fetchAllLists();
  }

  Future<void> addSampleStudent({
    required int universityId,
    required int semesterId,
    required int branchId,
  }) async {
    final db = await SQLiteMultipleTablesDatabase.instance.database;

    final student = SQLiteMultipleTablesModel(
      name: "Kalp",
      enrollmentNumber: "23010101",
      grade12: 89.5,
      currentCgpa: 8.58,
      email: "kalp@example.com",
      phone: "9876543210",
      city: "Rajkot",
    );

    final data = student.toMap()
      ..addAll({
        COL_UNIVERSITY_ID: universityId,
        COL_SEMESTER_ID: semesterId,
        COL_BRANCH_ID: branchId,
      });

    await db.insert(TBL_STUDENT, data);
    fetchStudents();
  }

  Future<void> deleteAllStudents() async {
    final db = await SQLiteMultipleTablesDatabase.instance.database;
    await db.delete(TBL_STUDENT);
    fetchStudents();
  }
}
