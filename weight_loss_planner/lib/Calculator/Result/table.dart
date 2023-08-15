import 'package:flutter/material.dart';

/// A table which holds different calorie thresholds
/// for the resulting input data
class CalorieTable extends StatelessWidget {
  final List<Map> tabledata;

  const CalorieTable({Key? key, required this.tabledata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
          child: Table(
            columnWidths: const {0: FlexColumnWidth(4), 1: FlexColumnWidth(2)},
            border: TableBorder.all(color: Colors.white),
            children: <TableRow>[
              TableRow(children: <Widget>[
                Container(
                  height: 100,
                  alignment: Alignment.centerLeft,
                  color: Colors.blue[900],
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Weight Amount',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white)),
                  ),
                ),
                Container(
                  height: 100,
                  alignment: Alignment.centerLeft,
                  color: Colors.blue[900],
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Calories',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                )
              ]),
              for (int i = 0; i < tabledata.length; i++) ...[
                TableRow(children: <Widget>[
                  Container(
                    height: 100,
                    alignment: Alignment.centerLeft,
                    color: Colors.blue[700],
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(tabledata[i]['value'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ))),
                  ),
                  Container(
                    height: 100,
                    alignment: Alignment.centerLeft,
                    color: Colors.lightBlue,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '${double.parse(tabledata[i]['calories']).round()}/day',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                ])
              ]
            ],
          ),
        )
      ],
    );
  }
}
