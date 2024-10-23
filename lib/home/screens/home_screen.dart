import 'package:flutter/material.dart';

import '../widgets/habit_table.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int currentIndexOfSelectedBottomNavigationBar = 0;
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
            title: Text('Paen Habit Tracker',
                style: TextStyle(color: Colors.white, fontSize: 15)),
            backgroundColor: Color.fromRGBO(2, 108, 186, 1),
            toolbarHeight: 20,
          ),
          body: Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
            child: const HabitTable(),
          ),
          bottomNavigationBar: Container(
            child: BottomNavigationBar(
              iconSize: 25,
              selectedFontSize: 1,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,
                      color: currentIndexOfSelectedBottomNavigationBar == 0
                          ? Colors.green
                          : Colors.grey),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.grey),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.grey),
                  label: '',
                ),
              ],
              backgroundColor: Colors.black,
              currentIndex:
                  currentIndexOfSelectedBottomNavigationBar, // Default selected tab
              onTap: (index) {
                // Handle the tab tap, like navigating to a new screen or updating content
                print("Selected Index: $index");
              },
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(top: BorderSide(color: Colors.white, width: .4))),
          )),
    );
  }
}
