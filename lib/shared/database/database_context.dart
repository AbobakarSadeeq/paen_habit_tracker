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
    await createHabitsTable(database);
    await createHabitsTrackingDaysTable(database);
  }

  Future<void> createHabitsTable(Database database) async {
    await database.execute('''
      CREATE TABLE Habits (
      HabitID INTEGER PRIMARY KEY AUTOINCREMENT,
      HabitName TEXT NOT NULL,
      CreatedAt TEXT NOT NULL
      );
          ''');
  }

  Future<void> createHabitsTrackingDaysTable(Database database) async {
    await database.execute('''
      CREATE TABLE HabitsTrackingDays (
      HabitsTrackingDaysID INTEGER PRIMARY KEY AUTOINCREMENT,
      IsHabitDoneToday INTEGER NOT NULL CHECK (IsHabitDoneToday IN (0, 1)),
      HabitDoneAt TEXT NOT NULL
      FOREIGN KEY (HabitId) REFERENCES Habits(HabitID)
      );
          ''');
  }
}
