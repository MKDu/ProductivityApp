import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _stopWatch();
  }
}

class _stopWatch extends State<StopWatch> {
  bool startButton = true;
  bool stopButton = true;
  bool resetButton = true;
  var watch = Stopwatch();
  String timeDisplayed = "00:00:00";
  final dur = const Duration(seconds: 1);

  void starttimer() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
    if (watch.isRunning) {
      starttimer();
    }
    setState(() {
      timeDisplayed = watch.elapsed.inHours.toString().padLeft(2, "0") +
          ":" +
          (watch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
          ":" +
          (watch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    });
  }

  //starts the stopwatch
  void startStopwatch() {
    setState(() {
      startButton = true;
      stopButton = false;
      resetButton = false;
    });
    watch.start();
    starttimer();
  }

  void resetStopwatch() {
    setState(() {
      resetButton = true;
      startButton = true;
      stopButton = false;
    });
    watch.reset();
    timeDisplayed = "00:00:00";
  }

  void stopStopwatch() {
    setState(() {
      stopButton = true;
      startButton = false;
    });
    watch.stop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: Text(
              "StopWatch",
              style: TextStyle(
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        body: Column(children: <Widget>[
        Expanded(
        flex: 6,
        child: Container(
            alignment: Alignment.center,
            child: Text(timeDisplayed,
                style: TextStyle(
                  fontSize: 50.0,
                )))),
    Expanded(
    flex: 4,
    child: Container(
    child: Column(children: <Widget>[
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    //stopbutton
    RaisedButton(
    onPressed: stopButton ? null : stopStopwatch,
    color: Colors.red,
    child: Text("Stop"),
    ),
    //resetbutton
    RaisedButton(
    onPressed: resetButton ? null : resetStopwatch,
    color: Colors.cyan,
    child: Text("Reset"),
    )
    ]),
    RaisedButton(
    //startbutton
    onPressed: startButton ? startStopwatch : null,
    color: Colors.green,
    child: Text("Start"))
    ])))
    ],
    ),
    ));
  }
}

