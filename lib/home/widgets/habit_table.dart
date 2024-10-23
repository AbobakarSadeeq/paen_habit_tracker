import 'package:flutter/material.dart';

class HabitTable extends StatelessWidget {
  const HabitTable({super.key});

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
                    Text('F', style: TextStyle(color: Colors.white)),
                    Text('1', style: TextStyle(color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    Text('S', style: TextStyle(color: Colors.white)),
                    Text('2', style: TextStyle(color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    Text('S', style: TextStyle(color: Colors.white)),
                    Text('3', style: TextStyle(color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    Text('M', style: TextStyle(color: Colors.white)),
                    Text('4', style: TextStyle(color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    Text('T', style: TextStyle(color: Colors.white)),
                    Text('5', style: TextStyle(color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    Text('W', style: TextStyle(color: Colors.white)),
                    Text('6', style: TextStyle(color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    Text('T', style: TextStyle(color: Colors.white)),
                    Text('7', style: TextStyle(color: Colors.white))
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
