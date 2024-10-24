import 'package:flutter/material.dart';

class HabitTable extends StatefulWidget {
  dynamic last7Days;
  HabitTable({super.key, this.last7Days});

  @override
  _HabitTableState createState() => _HabitTableState();
}

class _HabitTableState extends State<HabitTable> {
  @override
  void initState() {
    super.initState();
    _initializeHabitTable();
  }

  Future<void> _initializeHabitTable() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    'Habits',
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
              TableRow(children: [
                Center(
                    child: Text('Read book Automatic heart',
                        style: TextStyle(color: Colors.white))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(
                            45, 162, 13, 1), // Colors.transparent
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
              ]),
              TableRow(children: [
                Center(
                    child: Text('10 mints cleaning',
                        style: TextStyle(color: Colors.white))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
              ]),
              TableRow(children: [
                Center(
                    child: Text('coding practice',
                        style: TextStyle(color: Colors.white))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Color.fromRGBO(45, 162, 13, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
              ]),
            ],
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
                        primary: Colors.transparent, // Transparent background
                        shadowColor: Colors.transparent, // Remove button shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              3), // Optional: Adjust corner radius
                          side: BorderSide(
                            color:
                                Color.fromRGBO(45, 162, 13, 1), // Border color
                            width: 2, // Border width
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 1)),
                    onPressed: () {
                      // Action when the button is pressed
                      print('Add Habit button clicked');
                    },
                    child: Text(
                      '+ new habit',
                      style: TextStyle(color: Color.fromRGBO(45, 162, 13, 1)),
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
    );
  }
}
