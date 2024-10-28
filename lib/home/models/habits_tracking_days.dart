class HabitsTrackingDays {
  int? habitsTrackingDaysID;
  int? isHabitDoneToday;
  String? createdAt;
  int? habitId;

  HabitsTrackingDays({
    required this.habitsTrackingDaysID,
    required this.isHabitDoneToday,
    required this.createdAt,
    required this.habitId,
  });

// if fetching from db got any issue then make the below function to resolve it.
  @override
  String toString() {
    return 'Habits(habitId: $habitId, created_At: $createdAt, isHabitDoneToday: $isHabitDoneToday, habitsTrackingDaysID: $habitsTrackingDaysID)';
  }
// for fetching use this query
}
