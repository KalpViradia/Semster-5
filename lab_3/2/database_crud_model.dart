import 'package:advance_flutter_lab/lab_3/2/utils/import_export.dart';

class DatabaseModel {
  final int? uid;
  final String name;
  final String city;
  final String gender;

  DatabaseModel({
    this.uid,
    required this.name,
    required this.city,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'city': city,
      'gender': gender,
    };
  }

  factory DatabaseModel.fromMap(Map<String, dynamic> map) {
    return DatabaseModel(
      uid: map['uid'] as int?,
      name: map['name'],
      city: map['city'],
      gender: map['gender'],
    );
  }

  static Database? _database;

  static Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE TBL_USER(
            uid INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            city TEXT NOT NULL,
            gender TEXT NOT NULL
          )
        ''');
      },
    );
  }

  static Future<void> insert(DatabaseModel user) async {
    final db = await database;
    await db.insert('TBL_USER', user.toMap());
  }

  static Future<List<DatabaseModel>> getAllUsers() async {
    final db = await database;
    final maps = await db.query('TBL_USER');
    return maps.map((map) => DatabaseModel.fromMap(map)).toList();
  }

  static Future<void> update(DatabaseModel user) async {
    final db = await database;
    await db.update(
      'TBL_USER',
      user.toMap(),
      where: 'uid = ?',
      whereArgs: [user.uid],
    );
  }

  static Future<void> delete(int uid) async {
    final db = await database;
    await db.delete(
      'TBL_USER',
      where: 'uid = ?',
      whereArgs: [uid],
    );
  }
}