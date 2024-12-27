import 'package:agecalculator/models/Birthday.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Databasehelper {
  static  final Databasehelper dbhelper=Databasehelper._();
  late Database db;
  factory Databasehelper()=>dbhelper;
  Databasehelper._();
  Future<void> initializeDataBase() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, "age_calculator.db"),
      onCreate: (database, version) async {
        await database.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          userName TEXT NOT NULL,
          dateOfBirth TEXT NOT NULL,
          upcomingDateOfBirth TEXT NOT NULL,
          yearsOld INTEGER NOT NULL,
          gender TEXT NOT NULL,
          event TEXT NOT NULL,
          createdDate TEXT NOT NULL
        )
      ''');
      },
      version: 2,
      onUpgrade: (database,oldversion,newverion) async {
        if(oldversion<2){
          await database.execute('''
          ALTER TABLE users ADD COLUMN createdDate TEXT NOT NULL
          ''');
        }
      }
    );
  }
  Future<int> insertUser(User user) async {
    int result = await db.insert("users", user.toMap());
     return result;
  }
  Future<int> updateUser(User user) async {
    int result = await db.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
    return result;
  }
  Future<void> deleteUser(int id) async {
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }
  Future<List<User>> retreiveUsers() async {
    final List<Map<String, Object?>> queryResult = await db.rawQuery('''
   SELECT * FROM users ORDER BY createdDate DESC
    ''');
    return queryResult.map((e) => User.fromMap(e)).toList();
  }
}
