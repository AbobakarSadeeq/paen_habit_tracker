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
      HabitId INTEGER NOT NULL, -- Define the foreign key column
      IsHabitDoneToday INTEGER NOT NULL CHECK (IsHabitDoneToday IN (0, 1)),
      CreatedAt TEXT NOT NULL,
      FOREIGN KEY (HabitId) REFERENCES Habits(HabitID)
    );
  ''');
  }

  // get the last row of habittrackingdays for tracking and for how much insert does we need if user have yestarday record then only add one habittrackingDays row for each habits other wise it will increase
}
