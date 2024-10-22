import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paen_habit_tracker/route/router.dart';

void main() {
  final AppRoute appRoute = AppRoute();
  runApp(MyApp(router: appRoute.router));
}

class MyApp extends StatefulWidget {
  final GoRouter router;

  MyApp({required this.router});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: widget.router,
    );
  }
}
