// ignore: file_names
import 'package:flutter/material.dart';

const List<String> weekdays = <String>[
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

/// The drop down box with all the days of the week
class DropDownWeek extends StatefulWidget {
  const DropDownWeek({super.key});

  @override
  State<DropDownWeek> createState() => _DropDownWeekState();
}

class _DropDownWeekState extends State<DropDownWeek> {
  String dropdownValue = weekdays.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: MediaQuery.of(context).size.width,
      initialSelection: weekdays.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: 
        weekdays.map <DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
    );
  }
}
