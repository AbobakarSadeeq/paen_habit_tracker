import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseContext {
  Database? _database;

  Future<Database?> get database async {
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    var databaseFileName = 'paen_habit_tracker.db';
    var path = await getDatabasesPath();
    var databasePath = join(path, databaseFileName);
    var database =
        await openDatabase(databasePath, version: 1, onCreate: create);
    return database;
  }

  Future<void> create(Database database, int version) async {
    // all tables here like below
    // await createSignalRGroupsTable(database);
  }

  Future<void> createSignalRGroupsTable(Database database) async {
    //   await database.execute('''
    //   CREATE TABLE Groups (
    //   SignalRGroupID INTEGER PRIMARY KEY AUTOINCREMENT,
    //   GroupId TEXT NOT NULL);
    //       ''');
  }
}
