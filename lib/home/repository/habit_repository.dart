import 'package:intl/intl.dart';
import 'package:paen_habit_tracker/home/models/habits.dart';
import 'package:paen_habit_tracker/service_locator.dart';
import 'package:paen_habit_tracker/shared/database/database_context.dart';
import 'package:sqflite/sqflite.dart';

abstract class IHabitRepository {
  Future<void> saveHabitToMobileDbAsync(Habits habit);
  Future<List<Map<String, dynamic?>>?>
      getHabitsAndHabitsTrackingDaysListAsync();
  Future<void> updateSingleHabitTrackingStatusToMobileDbAsync(
      int updateHabitTrackingStatus, int habitTrackingId);

  Future<Map<String, dynamic>?>
      updateTrackingHabitWhenNewDaysComesUpOnMobileDBAsync();
}

class HabitRepository implements IHabitRepository {
  @override
  Future<void> saveHabitToMobileDbAsync(Habits habit) async {
    final db = await getIt.get<DatabaseContext>().database;

    await db?.transaction((txn) async {
      int newHabitRowAddId = await txn.rawInsert(
        'INSERT INTO Habits (HabitName, CreatedAt) VALUES (?, ?)',
        [habit.habitName, habit.created_At],
      );
      final List<String> last7Days = getLast7Days();
      for (int i = 0; i < last7Days.length; i++) {
        await txn.rawInsert(
          'INSERT INTO HabitsTrackingDays (IsHabitDoneToday, CreatedAt, HabitId) VALUES (?, ?, ?)',
          [0, last7Days[i], newHabitRowAddId],
        );
      }
    });
  }

  List<String> getLast7Days() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final DateTime startDate = DateTime.now().subtract(Duration(days: 7));

    return List<String>.generate(7, (index) {
      final DateTime date = startDate.add(Duration(days: index + 1));
      return formatter.format(date);
    });
  }

  @override
  Future<List<Map<String, dynamic>>?>
      getHabitsAndHabitsTrackingDaysListAsync() async {
    final db = await getIt.get<DatabaseContext>().database;
    final List<String> last7Days = getLast7Days();
    print(last7Days.map((d) => "'$d'").join(', '));
    final String placeholders = last7Days.map((_) => '?').join(', ');
    print(placeholders);
    return await db?.rawQuery('''
      SELECT *
      FROM (
          SELECT 
          HabitsTrackingDaysID, HabitId, IsHabitDoneToday, CreatedAt AS habitTrackingDaysCreatedAt
          FROM HabitsTrackingDays
          WHERE habitTrackingDaysCreatedAt IN ($placeholders)
      ) AS HabitsTrackingDays
      JOIN Habits ON HabitsTrackingDays.HabitId = Habits.HabitID;
    ''', last7Days);
  }

  @override
  Future<void> updateSingleHabitTrackingStatusToMobileDbAsync(
      int updateHabitTrackingStatus, int habitTrackingId) async {
    final db = await getIt.get<DatabaseContext>().database;
    print(habitTrackingId);
    try {
      await db?.rawUpdate(
        'UPDATE HabitsTrackingDays SET IsHabitDoneToday = ? WHERE HabitsTrackingDaysID = ?',
        [updateHabitTrackingStatus, habitTrackingId],
      );
    } catch (ex) {
      // Handle any exceptions
      print('Error updating habit tracking receipt: $ex');
    }
  }

  @override
  Future<Map<String, dynamic>?>
      updateTrackingHabitWhenNewDaysComesUpOnMobileDBAsync() async {
    print('executed');
    final db = await getIt.get<DatabaseContext>().database;
    var result = await db?.rawQuery(
      'SELECT * FROM HabitsTrackingDays ORDER BY HabitsTrackingDaysID DESC LIMIT 1',
    );
    if (result?.length != 0) {
      var lastRowTrackingHabitCreatedAt = result?[0]['CreatedAt'];
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);
      if (formattedDate != lastRowTrackingHabitCreatedAt) {
        var allHabitsIds = await db?.rawQuery(
          'SELECT HabitID FROM Habits',
        );
        var batch = db?.batch();
        for (var singleHabitId in allHabitsIds!) {
          batch?.rawInsert(
            'INSERT INTO HabitsTrackingDays (IsHabitDoneToday, CreatedAt, HabitId) VALUES (?, ?, ?)',
            [0, formattedDate, singleHabitId['HabitID']],
          );
        }
        await batch?.commit(noResult: true);
        print('added for today slots on habitTrackingDays');
      }
    }
  }
}
