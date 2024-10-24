import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/habit_table.dart';
import 'package:intl/intl.dart'; // Import intl package

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int currentIndexOfSelectedBottomNavigationBar = 0;
  String currentMonth = "";
  String currentYear = "";
  String currentDate = "";
  String currentWeekNo = "";
  dynamic last7Days = [];
  @override
  void initState() {
    super.initState();
    _initializeHome();
  }

  Future<void> _initializeHome() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getCurrentMonth();
      _getCurrentYear();
      _getCurrentDate();
      _getCurrentWeekNo();
      _getLast7Days();
    });
  }

  _getCurrentYear() {
    DateTime now = DateTime.now();
    if (mounted) {
      setState(() {
        currentYear = now.year.toString();
      });
    }
    return currentYear;
  }

  _getCurrentMonth() {
    DateTime now = DateTime.now();
    String formattedMonth = DateFormat.MMMM().format(now);
    if (mounted) {
      setState(() {
        currentMonth = formattedMonth;
      });
    }
    return formattedMonth;
  }

  _getCurrentWeekNo() {
    DateTime now = DateTime.now();
    // Get the first day of the current month
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);

    // Calculate the difference in days from the first day of the month to today
    int dayOfMonth = now.day;

    // Get the weekday of the first day of the month (1 = Monday, 7 = Sunday)
    int firstDayWeekday = firstDayOfMonth.weekday;

    // Calculate the week number
    int weekNumber = ((dayOfMonth + firstDayWeekday - 1) / 7).ceil();
    setState(() {
      currentWeekNo = weekNumber.toString();
    });

    return weekNumber;
  }

  void _getLast7Days() {
    dynamic last7DaysLocal = [];
    DateTime now = DateTime.now();

    for (int i = 0; i < 7; i++) {
      DateTime day = now.subtract(Duration(days: i));
      String dayName =
          DateFormat.EEEE().format(day); // Get day name like "Monday"
      String onlyDate =
          DateFormat('d').format(day); // Get day of the month as "24"
      String month =
          DateFormat.MMMM().format(day); // Get full month name from 'day'
      String year = day.year.toString(); // Use 'day' to get the correct year
      if (month == currentMonth &&
          currentYear == year &&
          onlyDate == currentDate) {
        last7DaysLocal.add({
          'dayName': dayName[0],
          'date': onlyDate,
          'isCurrentDateIsTodayDate': true
        });
      } else {
        last7DaysLocal.add({
          'dayName': dayName[0],
          'date': onlyDate,
          'isCurrentDateIsTodayDate': false
        });
      }
    }
    if (mounted) {
      setState(() {
        last7Days = [...last7DaysLocal];
      });
    }
  }

  _getCurrentDate() {
    DateTime now = DateTime.now();
    if (mounted) {
      setState(() {
        currentDate = now.day.toString();
      });
    }
    return currentYear;
  }

  _changeMonth() {}

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
            width: double.infinity,
            color: Colors.black,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 17,
                        ),
                        onPressed: () {
                          // Handle forward button pressed logic here
                          print("Backward button pressed");
                        },
                      ),
                      Text(
                        '$currentMonth: $currentYear', // Correct string interpolation
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 17,
                        ),
                        onPressed: () {
                          // Handle forward button pressed logic here
                          print("Forward button pressed");
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 17,
                        ),
                        onPressed: () {
                          // Handle forward button pressed logic here
                          print("Backward button pressed of week no:");
                        },
                      ),
                      Text(
                        'Week No: $currentWeekNo', // Correct string interpolation
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 17,
                        ),
                        onPressed: () {
                          // Handle forward button pressed logic here
                          print("Forward button pressed week no:");
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: last7Days.length > 0
                      ? HabitTable(last7Days: last7Days)
                      : Container(), // last7DaysList:last7Days
                ),
              ],
            ),
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
