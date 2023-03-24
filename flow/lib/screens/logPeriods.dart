// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable

import 'package:dotted_border/dotted_border.dart';
import 'package:flow/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class LogPeriods extends StatefulWidget {
  LogPeriods({required this.toHighlight, Key? key}) : super(key: key);

  @override
  State<LogPeriods> createState() => _LogPeriodsState();
  late final List<DateTime> toHighlight;
}

class _LogPeriodsState extends State<LogPeriods> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  Map<String, List> mySelectedEvents = {};

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
  }

  _showAddEventDialog() async {
    print(_selectedDate);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
    print(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(2023),
            lastDay: DateTime(2024),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDate, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDate, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDate = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                for (DateTime d in widget.toHighlight) {
                  if (widget.toHighlight.indexOf(d) == 0) {
                    if (day.day == d.day &&
                        day.month == d.month &&
                        day.year == d.year) {
                      return Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${day.day}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.bloodtype_rounded,
                              color: Colors.white,
                              size: 15,
                            )
                          ],
                        )),
                      );
                    }
                  } else {
                    if (day.day == d.day &&
                        day.month == d.month &&
                        day.year == d.year) {
                      return Container(
                        child: DottedBorder(
                          borderType: BorderType.Circle,
                          color: Colors.redAccent,
                          strokeWidth: 1,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${day.day}',
                                style: const TextStyle(color: Colors.redAccent),
                              ),
                            ],
                          )),
                        ),
                      );
                    }
                  }
                }
                return null;
              },
            ),
            eventLoader: _listOfDayEvents,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEventDialog(),
        backgroundColor: Color(0xff479996),
        label: const Text('Confirm Periods'),
      ),
    );
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }
}
