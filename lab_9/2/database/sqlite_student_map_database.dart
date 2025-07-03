import 'package:advance_flutter_lab/lab_9/2/utils/import_export.dart';

class SQLiteDatabaseMapDatabase {
  static final SQLiteDatabaseMapDatabase instance = SQLiteDatabaseMapDatabase._init();
  static Database? _database;

  SQLiteDatabaseMapDatabase._init();

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
      version: 1,
      onCreate: _createDB,
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
}
