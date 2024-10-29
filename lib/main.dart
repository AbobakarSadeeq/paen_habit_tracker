import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paen_habit_tracker/home/repository/habit_repository.dart';
import 'package:paen_habit_tracker/home/services/habit_service.dart';
import 'package:paen_habit_tracker/route/router.dart';
import 'package:paen_habit_tracker/service_locator.dart';

void main() async {
  final AppRoute appRoute = AppRoute();
  setupLocator();
  final habitRepo = getIt.get<IHabitRepository>();
  await habitRepo.updateTrackingHabitWhenNewDaysComesUpOnMobileDBAsync();
  runApp(MyApp(router: appRoute.router));
}

class MyApp extends StatefulWidget {
  final GoRouter router;

  MyApp({required this.router});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final habitRepo = getIt.get<IHabitRepository>();
  final habitService = getIt.get<HabitService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('paused app!');
    } else if (state == AppLifecycleState.resumed) {
      print('resume app back!');
      habitRepo
          .updateTrackingHabitWhenNewDaysComesUpOnMobileDBAsync()
          .then((value) => {habitService.addedSingleDaySlotOfHabit.add(true)});
      // get last row
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: widget.router,
    );
  }
}
