import 'package:flutter/material.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  MyCalendarState createState() => MyCalendarState();
}

class MyCalendarState extends State<MyCalendar> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        const Text(
          'jan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day,
            itemBuilder: (context, index) {
              DateTime day =
                  DateTime(_selectedDate.year, _selectedDate.month, index + 1);

              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedDate = day;
                  });
                },
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  margin: const EdgeInsets.only(right: 8.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: _selectedDate.day == day.day
                          ? Colors.black
                          : Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(
                      color: _selectedDate.day == day.day
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
