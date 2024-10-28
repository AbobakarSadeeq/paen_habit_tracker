class HabitsViewModel {
  int? HabitsTrackingDaysID;
  int? HabitId;
  int? IsHabitDoneToday;
  String? HabitTrackingDaysCreatedAt;
  String? HabitName;
  String? HabitCreatedAt;

  HabitsViewModel({
    required this.HabitsTrackingDaysID,
    required this.HabitId,
    required this.IsHabitDoneToday,
    required this.HabitTrackingDaysCreatedAt,
    required this.HabitName,
    required this.HabitCreatedAt,
  });

  factory HabitsViewModel.fromJsonCapitalLetterObjectName(
      Map<String, dynamic> json) {
    return HabitsViewModel(
        HabitsTrackingDaysID: json['HabitsTrackingDaysID'],
        HabitId: json['HabitId'],
        IsHabitDoneToday: json['IsHabitDoneToday'],
        HabitTrackingDaysCreatedAt: json['habitTrackingDaysCreatedAt'],
        HabitName: json['HabitName'],
        HabitCreatedAt: json['CreatedAt']);
  }
}
