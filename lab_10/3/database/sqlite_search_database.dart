import 'package:advance_flutter_lab/lab_10/3/utils/import_export.dart';

class SQLiteSearchDatabase {
  static final SQLiteSearchDatabase instance = SQLiteSearchDatabase._init();
  static Database? _database;

  SQLiteSearchDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(DB_NAME);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 3,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $TBL_STUDENT (
        $COL_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $COL_NAME TEXT NOT NULL,
        $COL_ENROLLMENT_NUMBER TEXT NOT NULL,
        $COL_GRADE_12 REAL,
        $COL_DIPLOMA_CGPA REAL,
        $COL_CURRENT_CGPA REAL,
        $COL_EMAIL TEXT,
        $COL_PHONE TEXT,
        $COL_CITY TEXT
      )
    ''');
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE $TBL_UNIVERSITY (
          $COL_ID INTEGER PRIMARY KEY AUTOINCREMENT,
          $COL_NAME TEXT NOT NULL
        )
      ''');

      await db.execute('''
        CREATE TABLE $TBL_SEMESTER (
          $COL_ID INTEGER PRIMARY KEY AUTOINCREMENT,
          $COL_NAME TEXT NOT NULL
        )
      ''');

      await db.execute('''
        CREATE TABLE $TBL_BRANCH (
          $COL_ID INTEGER PRIMARY KEY AUTOINCREMENT,
          $COL_NAME TEXT NOT NULL
        )
      ''');

      int universityId = await db.insert(TBL_UNIVERSITY, {COL_NAME: 'Darshan University'});
      int semesterId = await db.insert(TBL_SEMESTER, {COL_NAME: 'Semester 5'});
      int branchId = await db.insert(TBL_BRANCH, {COL_NAME: 'B.TECH CSE'});

      await db.execute('''
        CREATE TABLE $TBL_STUDENT_NEW (
          $COL_ID INTEGER PRIMARY KEY AUTOINCREMENT,
          $COL_NAME TEXT NOT NULL,
          $COL_ENROLLMENT_NUMBER TEXT NOT NULL,
          $COL_GRADE_12 REAL,
          $COL_DIPLOMA_CGPA REAL,
          $COL_CURRENT_CGPA REAL,
          $COL_EMAIL TEXT,
          $COL_PHONE TEXT,
          $COL_CITY TEXT,
          $COL_UNIVERSITY_ID INTEGER,
          $COL_SEMESTER_ID INTEGER,
          $COL_BRANCH_ID INTEGER,
          FOREIGN KEY ($COL_UNIVERSITY_ID) REFERENCES $TBL_UNIVERSITY($COL_ID),
          FOREIGN KEY ($COL_SEMESTER_ID) REFERENCES $TBL_SEMESTER($COL_ID),
          FOREIGN KEY ($COL_BRANCH_ID) REFERENCES $TBL_BRANCH($COL_ID)
        )
      ''');

      final oldData = await db.query(TBL_STUDENT);
      for (final row in oldData) {
        final newRow = Map<String, dynamic>.from(row)
          ..[COL_UNIVERSITY_ID] = universityId
          ..[COL_SEMESTER_ID] = semesterId
          ..[COL_BRANCH_ID] = branchId;

        await db.insert(TBL_STUDENT_NEW, newRow);
      }

      await db.execute('DROP TABLE IF EXISTS $TBL_STUDENT');
      await db.execute('ALTER TABLE $TBL_STUDENT_NEW RENAME TO $TBL_STUDENT');
    }
  }
}
