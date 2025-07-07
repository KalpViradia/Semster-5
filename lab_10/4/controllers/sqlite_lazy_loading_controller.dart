// import 'package:advance_flutter_lab/lab_10/4/utils/import_export.dart';
//
// class SQLiteLazyLoadingController extends GetxController {
//   RxList<SQLiteLazyLoadingModel> students = <SQLiteLazyLoadingModel>[].obs;
//
//   RxList<University> universities = <University>[].obs;
//   RxList<Semester> semesters = <Semester>[].obs;
//   RxList<Branch> branches = <Branch>[].obs;
//
//   RxString searchQuery = ''.obs;
//
//   final RxBool isLoading = false.obs;
//   final RxBool hasMoreData = true.obs;
//
//   final int _limit = 10;
//   int _offset = 0;
//
//   final db = SQLiteLazyLoadingDatabase.instance;
//
//   Future<void> fetchStudents({bool isInitial = false}) async {
//     if (isLoading.value) return;
//
//     if (isInitial) {
//       resetPagination();
//     }
//
//     if (!hasMoreData.value) return;
//
//     isLoading.value = true;
//
//     final database = await db.database;
//
//     final result = await database.query(
//       TBL_STUDENT,
//       limit: _limit,
//       offset: _offset,
//     );
//
//     final fetched = result.map((e) => SQLiteLazyLoadingModel.fromMap(e)).toList();
//
//     if (fetched.length < _limit) {
//       hasMoreData.value = false;
//     }
//
//     students.addAll(fetched);
//     _offset += _limit;
//
//     isLoading.value = false;
//   }
//
//   void resetPagination() {
//     _offset = 0;
//     students.clear();
//     hasMoreData.value = true;
//   }
//
//   Future<void> insertStudent(SQLiteLazyLoadingModel student) async {
//     final database = await db.database;
//     await database.insert(TBL_STUDENT, student.toMap());
//
//     resetPagination();
//     await fetchStudents();
//   }
//
//   Future<void> updateStudent(SQLiteLazyLoadingModel student) async {
//     final database = await db.database;
//     await database.update(
//       TBL_STUDENT,
//       student.toMap(),
//       where: 'id = ?',
//       whereArgs: [student.id],
//     );
//
//     resetPagination();
//     await fetchStudents();
//   }
//
//   Future<void> deleteStudent(int id) async {
//     final database = await db.database;
//     await database.delete(TBL_STUDENT, where: 'id = ?', whereArgs: [id]);
//
//     resetPagination();
//     await fetchStudents();
//   }
//
//   List<SQLiteLazyLoadingModel> get filteredStudents {
//     if (searchQuery.value.isEmpty) return students;
//     return students
//         .where((s) =>
//     s.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
//         s.enrollmentNumber
//             .toLowerCase()
//             .contains(searchQuery.value.toLowerCase()))
//         .toList();
//   }
//
//   Future<void> fetchDropdownData() async {
//     final database = await db.database;
//
//     final uniResult = await database.query(TBL_UNIVERSITY);
//     universities.value = uniResult.map((e) => University.fromMap(e)).toList();
//
//     final semResult = await database.query(TBL_SEMESTER);
//     semesters.value = semResult.map((e) => Semester.fromMap(e)).toList();
//
//     final branchResult = await database.query(TBL_BRANCH);
//     branches.value = branchResult.map((e) => Branch.fromMap(e)).toList();
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchDropdownData();
//     fetchStudents(isInitial: true);
//   }
// }

import 'package:advance_flutter_lab/lab_10/4/utils/import_export.dart';

class SQLiteLazyLoadingController extends GetxController {
  RxList<SQLiteLazyLoadingModel> students = <SQLiteLazyLoadingModel>[].obs;

  RxList<University> universities = <University>[].obs;
  RxList<Semester> semesters = <Semester>[].obs;
  RxList<Branch> branches = <Branch>[].obs;

  RxString searchQuery = ''.obs;

  final RxBool isLoading = false.obs;
  final RxBool hasMoreData = true.obs;

  final int _limit = 10;
  int _offset = 0;

  final db = SQLiteLazyLoadingDatabase.instance;

  Future<void> fetchStudents({bool isInitial = false}) async {
    if (isLoading.value) return;

    if (isInitial) {
      resetPagination();
    }

    if (!hasMoreData.value) return;

    isLoading.value = true;

    final database = await db.database;

    final result = await database.query(
      TBL_STUDENT,
      limit: _limit,
      offset: _offset,
    );

    final fetched = result.map((e) => SQLiteLazyLoadingModel.fromMap(e)).toList();

    if (fetched.length < _limit) {
      hasMoreData.value = false;
    }

    students.addAll(fetched);
    _offset += _limit;

    isLoading.value = false;
  }

  void resetPagination() {
    _offset = 0;
    students.clear();
    hasMoreData.value = true;
  }

  Future<void> insertStudent(SQLiteLazyLoadingModel student) async {
    final database = await db.database;
    await database.insert(TBL_STUDENT, student.toMap());

    resetPagination();
    await fetchStudents(isInitial: true);
  }

  Future<void> updateStudent(SQLiteLazyLoadingModel student) async {
    final database = await db.database;
    await database.update(
      TBL_STUDENT,
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );

    resetPagination();
    await fetchStudents(isInitial: true);
  }

  Future<void> deleteStudent(int id) async {
    final database = await db.database;
    await database.delete(TBL_STUDENT, where: 'id = ?', whereArgs: [id]);

    resetPagination();
    await fetchStudents(isInitial: true);
  }

  List<SQLiteLazyLoadingModel> get filteredStudents {
    if (searchQuery.value.isEmpty) return students;
    return students
        .where((s) =>
    s.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
        s.enrollmentNumber
            .toLowerCase()
            .contains(searchQuery.value.toLowerCase()))
        .toList();
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
    fetchDropdownData();
    fetchStudents(isInitial: true);
  }
}
