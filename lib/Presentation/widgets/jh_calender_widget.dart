import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class JHCalenderWidget extends StatefulWidget {
  const JHCalenderWidget({super.key});

  @override
  State<JHCalenderWidget> createState() => _JHCalenderWidgetState();
}

class _JHCalenderWidgetState extends State<JHCalenderWidget> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      
      locale: "en_US",
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) => isSameDay(day, today),
      focusedDay: today,
      firstDay: DateTime.utc(2010, 18, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      onDaySelected: _onDaySelected,
    );
  }
}