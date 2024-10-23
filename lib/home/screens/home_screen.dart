import 'package:flutter/material.dart';

import '../widgets/habit_table.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _initializeHome();
  }

  Future<void> _initializeHome() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('hi how are you'),
          backgroundColor: Colors.green,
          toolbarHeight: 20,
        ),
        body: Container(
          color: Colors.black12,
          height: double.infinity,
          width: double.infinity,
          child: const HabitTable(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: 0, // Default selected tab
          onTap: (index) {
            // Handle the tab tap, like navigating to a new screen or updating content
            print("Selected Index: $index");
          },
        ),
      ),
    );
  }
}
