import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paen_habit_tracker/home/models/habits.dart';
import 'package:paen_habit_tracker/home/models/habits_tracking_days.dart';
import 'package:paen_habit_tracker/home/repository/habit_repository.dart';
import 'package:paen_habit_tracker/home/services/habit_service.dart';
import 'package:paen_habit_tracker/home/view_modal/habits_view_modal.dart';
import 'package:paen_habit_tracker/service_locator.dart';

class HabitTable extends StatefulWidget {
  dynamic last7Days;
  final VoidCallback onGetLast7DaysUpdate;
  final VoidCallback updateCurrentDateIsStatus;
  HabitTable(
      {super.key,
      this.last7Days,
      required this.onGetLast7DaysUpdate,
      required this.updateCurrentDateIsStatus});

  @override
  _HabitTableState createState() => _HabitTableState();
}

class _HabitTableState extends State<HabitTable> {
  List<Habits> habitList = [];
  TextEditingController habitFieldController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final habitRepo = getIt.get<IHabitRepository>();
  final habitService = getIt.get<HabitService>();

  @override
  void initState() {
    super.initState();
    _initializeHabitTable();
  }

  Future<void> _initializeHabitTable() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getAllHabitsFromMobileDB();
      _addedAllHabitsSlotsOnTrackingHabitDays();
    });
  }

  Future<void> getAllHabitsFromMobileDB() async {
    var allHabitsWithItsTrackingDays =
        await habitRepo.getHabitsAndHabitsTrackingDaysListAsync();
    if (allHabitsWithItsTrackingDays?.length == 0) return;
    List<Habits> habits = Habits.parseHabitsData(allHabitsWithItsTrackingDays!);
    if (habits != null) {
      setState(() {
        habitList = habits;
      });
    }
  }

  void _addedAllHabitsSlotsOnTrackingHabitDays() {
    habitService.addedSingleDaySlotOfHabit.stream.listen((isHabitSlotAdded) {
      if (isHabitSlotAdded == true) {
        getAllHabitsFromMobileDB();
        widget.onGetLast7DaysUpdate();
        widget.updateCurrentDateIsStatus();
      }
    });
    habitService.addedSingleDaySlotOfHabit.add(false);
  }

  Future<void> addHabitHandler(BuildContext dialogContext) async {
    if (habitFieldController.text.length > 0) {
      DateTime now = DateTime.now();
      String formattedDateNow = DateFormat('yyyy-MM-dd').format(now);
      Habits newHabit = Habits(
          habitID: 0,
          habitName: habitFieldController.text,
          created_At: formattedDateNow,
          habitsTrackingDays: []);
      await habitRepo.saveHabitToMobileDbAsync(newHabit);
      getAllHabitsFromMobileDB();
      print('data saved to db');
      habitFieldController.clear();
      Navigator.of(dialogContext).pop();
    }
  }

  Future<void> updateHabitDoneStatus(
      int habitIndex, int habitTrackingIndex) async {
    int previousHabitTrackingDoneToday = habitList[habitIndex]
        .habitsTrackingDays[habitTrackingIndex]
        .isHabitDoneToday!;
    List<Habits> updateHabitsTrackingStatusList = [...habitList];
    updateHabitsTrackingStatusList[habitIndex]
        .habitsTrackingDays[habitTrackingIndex]
        .isHabitDoneToday = previousHabitTrackingDoneToday == 0 ? 1 : 0;
    setState(() {
      habitList = [...updateHabitsTrackingStatusList];
    });
    habitRepo.updateSingleHabitTrackingStatusToMobileDbAsync(
        previousHabitTrackingDoneToday == 0 ? 1 : 0,
        habitList[habitIndex]
            .habitsTrackingDays[habitTrackingIndex]
            .habitsTrackingDaysID!);
    print('update tracking habit done');
  }

  onTapHabitInputHandler() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Table(
                border: TableBorder.symmetric(), // Adds borders to the table
                columnWidths: {
                  0: FlexColumnWidth(2), // Column 1 width
                  1: FlexColumnWidth(1), // Column 2 width
                  2: FlexColumnWidth(1), // Column 3 width
                  3: FlexColumnWidth(1), // Column 4 width
                  4: FlexColumnWidth(1), // Column 5 width
                  5: FlexColumnWidth(1), // Column 6 width
                  6: FlexColumnWidth(1), // Column 7 width
                  7: FlexColumnWidth(1), // Column 8 width
                },
                children: [
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.only(top: 13, bottom: 13),
                      child: Center(
                          child: Text(
                        MediaQuery.of(context).size.height.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    Column(
                      children: [
                        Text(widget.last7Days[6]['dayName'],
                            style: TextStyle(color: Colors.white)),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.last7Days[6]
                                        ['isCurrentDateIsTodayDate'] ==
                                    true
                                ? Color.fromRGBO(45, 162, 13, 1)
                                : Colors.transparent, // Colors.transparent
                          ),
                          child: Center(
                              child: Text(
                            widget.last7Days[6]['date'],
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(widget.last7Days[5]['dayName'],
                            style: TextStyle(color: Colors.white)),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.last7Days[5]
                                        ['isCurrentDateIsTodayDate'] ==
                                    true
                                ? Color.fromRGBO(45, 162, 13, 1)
                                : Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            widget.last7Days[5]['date'],
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(widget.last7Days[4]['dayName'],
                            style: TextStyle(color: Colors.white)),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.last7Days[4]
                                        ['isCurrentDateIsTodayDate'] ==
                                    true
                                ? Color.fromRGBO(45, 162, 13, 1)
                                : Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            widget.last7Days[4]['date'],
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(widget.last7Days[3]['dayName'],
                            style: TextStyle(color: Colors.white)),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.last7Days[3]
                                        ['isCurrentDateIsTodayDate'] ==
                                    true
                                ? Color.fromRGBO(45, 162, 13, 1)
                                : Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            widget.last7Days[3]['date'],
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(widget.last7Days[2]['dayName'],
                            style: TextStyle(color: Colors.white)),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.last7Days[2]
                                        ['isCurrentDateIsTodayDate'] ==
                                    true
                                ? Color.fromRGBO(45, 162, 13, 1)
                                : Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            widget.last7Days[2]['date'],
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(widget.last7Days[1]['dayName'],
                            style: TextStyle(color: Colors.white)),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.last7Days[1]
                                        ['isCurrentDateIsTodayDate'] ==
                                    true
                                ? Color.fromRGBO(45, 162, 13, 1)
                                : Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            widget.last7Days[1]['date'],
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(widget.last7Days[0]['dayName'],
                            style: TextStyle(color: Colors.white)),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.last7Days[0]
                                        ['isCurrentDateIsTodayDate'] ==
                                    true
                                ? Color.fromRGBO(45, 162, 13, 1)
                                : Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            widget.last7Days[0]['date'],
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 310,
              child: ListView.builder(
                itemCount: habitList.length,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, habitIndex) {
                  // Your item widget here
                  return Table(
                    border:
                        TableBorder.symmetric(), // Adds borders to the table
                    columnWidths: {
                      0: FlexColumnWidth(2), // Column 1 width
                      1: FlexColumnWidth(1), // Column 2 width
                      2: FlexColumnWidth(1), // Column 3 width
                      3: FlexColumnWidth(1), // Column 4 width
                      4: FlexColumnWidth(1), // Column 5 width
                      5: FlexColumnWidth(1), // Column 6 width
                      6: FlexColumnWidth(1), // Column 7 width
                      7: FlexColumnWidth(1), // Column 8 width
                    },
                    children: [
                      TableRow(children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            habitList[habitIndex].habitName!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ...List.generate(
                            habitList[habitIndex].habitsTrackingDays.length,
                            (habitTrackingIndex) {
                          return TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: TextButton(
                              onPressed: () => updateHabitDoneStatus(
                                  habitIndex, habitTrackingIndex),
                              style: TextButton.styleFrom(
                                backgroundColor: habitList[habitIndex]
                                            .habitsTrackingDays[
                                                habitTrackingIndex]
                                            .isHabitDoneToday ==
                                        1
                                    ? Color.fromRGBO(45, 162, 13, 1)
                                    : Color.fromRGBO(36, 39, 35, 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.zero, // Ensure no rounding
                                ),
                                padding: EdgeInsets
                                    .zero, // Remove padding for a simpler look
                              ),
                              child: habitList[habitIndex]
                                          .habitsTrackingDays[
                                              habitTrackingIndex]
                                          .isHabitDoneToday ==
                                      1
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size:
                                          15, // You can change the size as needed
                                    )
                                  : Container(),
                            ),
                          );
                        }),
                      ]),
                    ],
                  );
                },
              ),
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Table(
                border: TableBorder
                    .symmetric(), // Remove the default border for the entire table
                columnWidths: {
                  0: FlexColumnWidth(2), // Column 1 width
                  1: FlexColumnWidth(1), // Column 2 width
                  2: FlexColumnWidth(1), // Column 3 width
                  3: FlexColumnWidth(1), // Column 4 width
                  4: FlexColumnWidth(1), // Column 5 width
                  5: FlexColumnWidth(1), // Column 6 width
                  6: FlexColumnWidth(1), // Column 7 width
                  7: FlexColumnWidth(1), // Column 8 width
                },
                children: [
                  TableRow(children: [
                    Container(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Colors.transparent, // Transparent background
                            shadowColor:
                                Colors.transparent, // Remove button shadow
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  3), // Optional: Adjust corner radius
                              side: BorderSide(
                                color: Color.fromRGBO(
                                    45, 162, 13, 1), // Border color
                                width: 2, // Border width
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 1)),
                        onPressed: () {
                          // Action when the button is pressed
                          print('Add Habit button clicked');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                title: Text(
                                  "Add new habit",
                                  style: TextStyle(
                                      color: Color.fromRGBO(45, 162, 13, 1)),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: TextFormField(
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        showCursor: true,
                                        focusNode: _focusNode,
                                        cursorColor: Colors.white,
                                        controller: habitFieldController,
                                        onTap: onTapHabitInputHandler,
                                        validator: (value) {
                                          if (value == null) {
                                            return '';
                                          }
                                        },
                                        onChanged: (text) {},
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 7),
                                            hintText: 'Habit',
                                            // border: b,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      45,
                                                      162,
                                                      13,
                                                      1)), // Color when input is not focused
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      45, 162, 13, 1),
                                                  width:
                                                      2.0), // Color when input is focused
                                            ),
                                            //  focusedBorder: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 162, 13, 1),
                                                fontSize: 16)),
                                        style: TextStyle(
                                          color: Color.fromRGBO(45, 162, 13, 1),
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    child: Text("Cancel"),
                                    style: ButtonStyle(
                                      textStyle: MaterialStateProperty.all(
                                        TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red), // Color of the text
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                  ),
                                  TextButton(
                                    child: Text("Add"),
                                    onPressed: () => addHabitHandler(context),
                                    style: ButtonStyle(
                                      textStyle: MaterialStateProperty.all(
                                        TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(45, 162, 13,
                                                  1)), // Color of the text
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          '+ new habit',
                          style:
                              TextStyle(color: Color.fromRGBO(45, 162, 13, 1)),
                        ), // Button label
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(45, 162, 13, 1),
                        ),
                        child: Center(
                            child: Text(
                          '90',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(45, 162, 13, 1),
                          // Make the container circular
                        ),
                        child: Center(
                            child: Text(
                          '90',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(
                              45, 162, 13, 1), // Make the container circular
                        ),
                        child: Center(
                            child: Text(
                          '20',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(
                              45, 162, 13, 1), // Make the container circular
                        ),
                        child: Center(
                            child: Text(
                          '45',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(
                              45, 162, 13, 1), // Make the container circular
                        ),
                        child: Center(
                            child: Text(
                          '45',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(
                              45, 162, 13, 1), // Make the container circular
                        ),
                        child: Center(
                            child: Text(
                          '43',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(
                              45, 162, 13, 1), // Make the container circular
                        ),
                        child: Center(
                            child: Text(
                          '35',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
