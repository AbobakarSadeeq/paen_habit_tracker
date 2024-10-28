import 'habits_tracking_days.dart';

class Habits {
  int? habitID;
  String? habitName;
  String? created_At;
  List<HabitsTrackingDays> habitsTrackingDays;

  Habits(
      {required this.habitID,
      required this.habitName,
      required this.created_At,
      required this.habitsTrackingDays});

  static List<Habits> parseHabitsData(
      List<Map<String, dynamic>> allHabitsWithItsTrackingDays) {
    Map<int, Habits> habitsMap = {};

    // Iterate over each record in the list
    for (var json in allHabitsWithItsTrackingDays) {
      int habitId = json['HabitID'];

      // Check if the habit already exists in the map
      if (!habitsMap.containsKey(habitId)) {
        habitsMap[habitId] = Habits(
          habitID: habitId,
          created_At: json['CreatedAt'],
          habitName: json['HabitName'],
          habitsTrackingDays: [],
        );
      }

      // Create the HabitsTrackingDays object and add it to the corresponding Habits object
      habitsMap[habitId]?.habitsTrackingDays.add(HabitsTrackingDays(
            habitsTrackingDaysID: json['HabitsTrackingDaysID'],
            isHabitDoneToday: json['IsHabitDoneToday'],
            createdAt: json['habitTrackingDaysCreatedAt'],
            habitId: habitId,
          ));
    }

    // Convert the map values to a list
    List<Habits> habitsList = habitsMap.values.toList();

    // Keep only the last 7 tracking days for each habit
    for (var habit in habitsList) {
      if (habit.habitsTrackingDays.length > 7) {
        habit.habitsTrackingDays = habit.habitsTrackingDays.take(7).toList();
      }
    }

    return habitsList;
  }

  @override
  String toString() {
    return 'Habits(habitID: $habitID, created_At: $created_At, habitName: $habitName, habitsTrackingDays: $habitsTrackingDays)';
  }
}

// if fetching from db got any issue then make the below function to resolve it.
