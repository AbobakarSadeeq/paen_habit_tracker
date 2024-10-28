import 'package:intl/intl.dart';
import 'package:paen_habit_tracker/home/models/habits.dart';
import 'package:paen_habit_tracker/service_locator.dart';
import 'package:paen_habit_tracker/shared/database/database_context.dart';

abstract class IHabitRepository {
  Future<void> saveHabitToMobileDbAsync(Habits habit);
  Future<List<Map<String, dynamic?>>?>
      getHabitsAndHabitsTrackingDaysListAsync();
  Future<void> updateSingleHabitTrackingStatusToMobileDbAsync(
      int updateHabitTrackingStatus, int habitTrackingId);
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
      var batch = txn.batch();
      for (int i = 0; i < 7; i++) {
        await txn.rawInsert(
          'INSERT INTO HabitsTrackingDays (IsHabitDoneToday, CreatedAt, HabitId) VALUES (?, ?, ?)',
          [0, habit.created_At, newHabitRowAddId],
        );
      }
      await batch.commit(noResult: true);
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

    return await db?.rawQuery('''
     SELECT *
      FROM (
          SELECT 
          HabitsTrackingDaysID, HabitId, IsHabitDoneToday, CreatedAt AS habitTrackingDaysCreatedAt
          FROM HabitsTrackingDays
          WHERE CreatedAt IN (${last7Days.map((d) => "'$d'").join(', ')})
      ) AS HabitsTrackingDays
      JOIN Habits ON HabitsTrackingDays.HabitId = Habits.HabitID;
    ''');
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
}
