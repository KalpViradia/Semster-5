import 'package:advance_flutter_lab/lab_10/2/utils/import_export.dart';

class SQLiteInsertAndUpdateController extends GetxController {
  RxList<SQLiteInsertAndUpdateModel> students = <SQLiteInsertAndUpdateModel>[].obs;

  RxList<University> universities = <University>[].obs;
  RxList<Semester> semesters = <Semester>[].obs;
  RxList<Branch> branches = <Branch>[].obs;

  final db = SQLiteInsertAndUpdateDatabase.instance;

  Future<void> insertStudent(SQLiteInsertAndUpdateModel student) async {
    final database = await db.database;
    await database.insert(TBL_STUDENT, student.toMap());
    fetchStudents();
  }

  Future<void> updateStudent(SQLiteInsertAndUpdateModel student) async {
    final database = await db.database;
    await database.update(
      TBL_STUDENT,
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
    fetchStudents();
  }

  Future<void> deleteStudent(int id) async {
    final database = await db.database;

    await database.delete(
      TBL_STUDENT,
      where: 'id = ?',
      whereArgs: [id],
    );

    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final database = await db.database;
    final result = await database.query(TBL_STUDENT);
    students.value = result.map((e) => SQLiteInsertAndUpdateModel.fromMap(e)).toList();
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