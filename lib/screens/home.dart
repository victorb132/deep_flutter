<<<<<<< HEAD
import 'package:deep_flutter/util/my_calendar.dart';
=======
>>>>>>> 528f30d (feat/change-project)
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            iconSize: 40,
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: Colors.white,
            iconSize: 30,
          ),
        ],
      ),
<<<<<<< HEAD
      body: const Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'wake up early',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            MyCalendar(),
            SizedBox(height: 64),
            Text(
              'workout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            MyCalendar(),
            SizedBox(height: 64),
            Text(
              'read a book',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            MyCalendar()
          ],
        ),
=======
      body: const Column(
        children: [
          Text(
            'wake up early',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ],
>>>>>>> 528f30d (feat/change-project)
      ),
    );
  }
}
