import 'package:advance_flutter_lab/lab_9/2/utils/import_export.dart';

class SQLiteDatabaseMapController extends GetxController {
  var studentList = <SQLiteDatabaseMapModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final db = await SQLiteDatabase.instance.database;
    final result = await db.query(TBL_STUDENT);
    studentList.value = result.map((map) => SQLiteDatabaseMapModel.fromMap(map)).toList();
  }

  Future<void> addStudent(SQLiteDatabaseMapModel student) async {
    final db = await SQLiteDatabase.instance.database;
    await db.insert(TBL_STUDENT, student.toMap());
    fetchStudents();
  }
}
