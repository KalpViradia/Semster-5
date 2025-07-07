import 'package:advance_flutter_lab/lab_10/1/utils/import_export.dart';

class SQLiteInsertController extends GetxController {
  RxList<SQLiteInsertModel> students = <SQLiteInsertModel>[].obs;

  RxList<University> universities = <University>[].obs;
  RxList<Semester> semesters = <Semester>[].obs;
  RxList<Branch> branches = <Branch>[].obs;

  final db = SQLiteInsertDatabase.instance;

  Future<void> insertStudent(SQLiteInsertModel student, {
    required int universityId,
    required int semesterId,
    required int branchId,
  }) async {
    final database = await db.database;

    final data = student.toMap()
      ..addAll({
        COL_UNIVERSITY_ID: universityId,
        COL_SEMESTER_ID: semesterId,
        COL_BRANCH_ID: branchId,
      });

    await database.insert(TBL_STUDENT, data);
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final database = await db.database;
    final result = await database.query(TBL_STUDENT);
    students.value = result.map((e) => SQLiteInsertModel.fromMap(e)).toList();
  }

  Future<void> fetchDropdownData() async {
    final database = await db.database;

    final uniResult = await database.query(TBL_UNIVERSITY);
    universities.value = uniResult.map((e) => University.fromMap(e)).toList();

    final semResult = await database.query(TBL_SEMESTER);
    semesters.value = semResult.map((e) => Semester.fromMap(e)).toList();

    final branchResult = await database.query(TBL_BRANCH);
    branches.value = branchResult.map((e) => Branch.fromMap(e)).toList();
  }

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
    fetchDropdownData();
  }
}