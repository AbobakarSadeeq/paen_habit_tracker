import 'package:flutter/material.dart';

class HomeAddHabitModalScreen extends StatefulWidget {
  const HomeAddHabitModalScreen({super.key});

  @override
  _HomeAddHabitModalScreen createState() => _HomeAddHabitModalScreen();
}

class _HomeAddHabitModalScreen extends State<HomeAddHabitModalScreen> {
  @override
  void initState() {
    super.initState();
    _initializeHomeAddHabitModal();
  }

  Future<void> _initializeHomeAddHabitModal() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
