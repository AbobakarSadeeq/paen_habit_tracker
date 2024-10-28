import 'package:get_it/get_it.dart';
import 'package:paen_habit_tracker/home/repository/habit_repository.dart';
import 'package:paen_habit_tracker/shared/database/database_context.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Register the Services here so, we can use or call them through DI easily.
  getIt.registerSingleton(DatabaseContext());
  getIt.registerSingleton<IHabitRepository>(HabitRepository());
  print("dependencies registers");
}
