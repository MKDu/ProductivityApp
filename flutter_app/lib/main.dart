import 'package:flutter/material.dart';
import 'dart:async';
import './toDoList.dart';
import './StopWatch.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final pages = [
    StopWatch(),
    todoui(),
  ];

  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              title: Text("Stopwatch"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                title: Text("To-Do")),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    ));
  }
}
