import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home/screens/home_screen.dart';

class AppRoute {
  late final GoRouter router;

  AppRoute() {
    router = GoRouter(
      initialLocation: "/Home",
      observers: [GoRouterObserver()],
      routes: [
        GoRoute(
          path: '/Home',
          name: 'Home',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}
}
