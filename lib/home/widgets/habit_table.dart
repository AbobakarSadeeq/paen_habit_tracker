import 'package:flutter/material.dart';

class HabitTable extends StatelessWidget {
  const HabitTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Table(
            border: TableBorder.all(), // Adds borders to the table
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
                  child: Center(child: Text('Habits')),
                ),
                Column(
                  children: [
                    Text('F'),
                    Divider(
                      height: 8, // Space around the divider
                      color: Colors.black, // Color of the line
                      thickness: 2,
                    ),
                    Text('1')
                  ],
                ),
                Column(
                  children: [
                    Text('S'),
                    Divider(
                      height: 8, // Space around the divider
                      color: Colors.black, // Color of the line
                      thickness: 2,
                    ),
                    Text('2')
                  ],
                ),
                Column(
                  children: [
                    Text('S'),
                    Divider(
                      height: 8, // Space around the divider
                      color: Colors.black, // Color of the line
                      thickness: 2,
                    ),
                    Text('3')
                  ],
                ),
                Column(
                  children: [
                    Text('M'),
                    Divider(
                      height: 8, // Space around the divider
                      color: Colors.black, // Color of the line
                      thickness: 2,
                    ),
                    Text('4')
                  ],
                ),
                Column(
                  children: [
                    Text('T'),
                    Divider(
                      height: 8, // Space around the divider
                      color: Colors.black, // Color of the line
                      thickness: 2,
                    ),
                    Text('5')
                  ],
                ),
                Column(
                  children: [
                    Text('W'),
                    Divider(
                      height: 8, // Space around the divider
                      color: Colors.black, // Color of the line
                      thickness: 2,
                    ),
                    Text('6')
                  ],
                ),
                Column(
                  children: [
                    Text('T'),
                    Divider(
                      height: 8, // Space around the divider
                      color: Colors.black, // Color of the line
                      thickness: 2,
                    ),
                    Text('7')
                  ],
                ),
              ]),
              TableRow(children: [
                Center(child: Text('Read book Automatic heart')),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
              ]),
              TableRow(children: [
                Center(child: Text('10 mints cleaning')),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
              ]),
              TableRow(children: [
                Center(child: Text('coding practice')),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15, // You can change the size as needed
                        ))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                        color: Colors.red,
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
                        primary: Colors.green[800], // Dark  green color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Rectangular shape
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 1)),
                    onPressed: () {
                      // Action when the button is pressed
                      print('Add Habit button clicked');
                    },
                    child: Text(
                      'Add Habit +',
                      style: TextStyle(color: Colors.white),
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
                        color: Colors.red // Make the container circular
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
                        color: Colors.red // Make the container circular
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
                        color: Colors.red // Make the container circular
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
                        color: Colors.red // Make the container circular
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
                        color: Colors.red // Make the container circular
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
                        color: Colors.red // Make the container circular
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
                        color: Colors.red // Make the container circular
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
