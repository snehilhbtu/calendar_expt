import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarExample extends StatefulWidget {
  const TableCalendarExample({super.key});

  @override
  State<TableCalendarExample> createState() => _TableCalendarExampleState();
}

class _TableCalendarExampleState extends State<TableCalendarExample> {
  var colorDb = [
    Colors.blue,
    Color(0xff3EB0E1),
    Color(0xff3EB0E1),
    Color(0xff2C74B3),
    Color(0xff6E55D3),
    Colors.purpleAccent,
    Color(0xffF168CB),
    Colors.redAccent,
    Colors.deepOrange,
    Color(0xffEC6464),
    Color(0xffF24D28),
    Color(0xffFFA25F),
    Color(0xffad9c00),
    Color(0xffC2A408),
    Colors.grey[700]
  ];

  //vars for calendar range, current & selected day
  DateTime firstDay = DateTime.utc(2023, 1, 1);
  DateTime lastDay = DateTime.utc(2023, 12, 31);
  DateTime focusedDay = DateTime.now();
  DateTime? alreadySelectedDay;
  CalendarFormat calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Table Calendar Example",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: TableCalendar(
        focusedDay: focusedDay,
        firstDay: firstDay,
        lastDay: lastDay,
        calendarFormat: calendarFormat,

        selectedDayPredicate: (day) {
          //if this return true the day will be marked
          return isSameDay(alreadySelectedDay, day);
        },

        onDaySelected: (selectedDay, _focusedDay) {
          //value of both vars are same , use not clear
          setState(() {
            alreadySelectedDay = selectedDay;
            focusedDay = _focusedDay;
            //print("selected day $selectedDay -- focusedDay $_focusedDay");
          });
        },

        //changing format
        onFormatChanged: (format) {
          if (format != calendarFormat) {
            setState(() {
              calendarFormat = format;
            });
          }
        },

        //month name and arrows
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
          titleCentered: true,
          titleTextStyle: TextStyle(color: Colors.white),
          formatButtonTextStyle: TextStyle(color: Colors.white),
        ),
        //week bar
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.white),
          weekendStyle: TextStyle(color: Colors.white),
        ),
        //actual calendar
        calendarStyle: CalendarStyle(
          //current day
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          todayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),

          //selected day
          selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorDb[5],
          ),
          selectedTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),

          //dates apart from current month
          outsideDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          outsideTextStyle: TextStyle(
            color: Colors.white30,
          ),

          //weekends sat & sun
          weekendDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white30,
          ),
          weekendTextStyle: TextStyle(
            color: Colors.white,
          ),

          //default-> apart from weekend,today,selected,outside date
          defaultTextStyle: TextStyle(
            color: Colors.white,
          ),
          defaultDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white30,
          ),
        ),

        /*onPageChanged: (_focusedDay) {
          focusedDay = _focusedDay;
        },*/
      ),
    );
  }
}
