class HabitsTrackingDays {
  int? habitsTrackingDaysID;
  int? isHabitDoneToday;
  String? habitDoneAt;
  int? habitId;

  HabitsTrackingDays({
    required this.habitsTrackingDaysID,
    required this.isHabitDoneToday,
    required this.habitDoneAt,
    required this.habitId,
  });

// if fetching from db got any issue then make the below function to resolve it.
// factory Habits.fromJsonCapitalLetterObjectName() {
//   return Habits(
//     messageDateStamp: json['MessageDateStamp'],
//     messageTimeStamp: json['MessageTimeStamp'],
//     messageSeen: json['MessageSeen'],
//     userMessage: json['UserMessage'],
//     senderContactNumber: json['SenderContactNumber'],
//     receiverContactNumber: json['ReceiverContactNumber'],
//     groupId: groupId,
//   );
// }

// for fetching use this query
//   SELECT *
//   FROM (
//   SELECT *
//   FROM HabitTrackingDays
//   WHERE HabitDoneAt IN ("2024-10-19", "2024-10-18", "2024-10-17",
//   "2024-10-16", "2024-10-15", "2024-10-14", "2024-10-13")
//   ) AS HabitTrackingDays
//   JOIN habit ON HabitTrackingDays.habit_id = Habits.habit_id
}
