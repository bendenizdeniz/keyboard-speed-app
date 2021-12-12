//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'dart:async';

class MyAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppHomeState();
  }
}

class _MyAppHomeState extends State<MyAppHome> {
  String lorem =
      "                                      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
          .toLowerCase()
          .replaceAll(',', '');
  int step = 0,
      score = 0,
      lastTypedAt = 0,
      stepStartButton = 0,
      stepGettingInput = 1,
      stepGameOver = 2;
  var shownWidget;

  void updateLastTypedAt() {
    this.lastTypedAt = DateTime.now().millisecondsSinceEpoch;
  }

  void onStartClick() {
    setState(() {
      updateLastTypedAt();
      //step++;
      step = 1;
    });
    var timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      int now = DateTime.now().millisecondsSinceEpoch;

      //is Game Over?
      setState(() {
        if (step == stepGettingInput && now - this.lastTypedAt > 4000) {
          //step++;
          step = stepGameOver;
        }

        if (step != stepGettingInput) {
          timer.cancel();
        }
      });
    });
  }

  void onType(String value) {
    updateLastTypedAt();
    String trimmedValue = lorem.trimLeft();
    setState(() {
      if (trimmedValue.indexOf(value) != 0) {
        //is character index that pressed not equal to text's index = game over.
        this.step = stepGameOver;
      } else {
        //is character index that pressed equal to text's index = score up.
        score = value.length;
      }
    });
  }

  void restartGame() {
    setState(() {
      score = 0;
      step = stepGettingInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    var stepZeroWidget = <Widget>[
      Text('Welcome keyboard speed test game!'),
      Container(
        padding: EdgeInsets.only(top: 20),
        child: ElevatedButton(
          child: Text('START'),
          onPressed: onStartClick,
        ),
      ),
    ];

    var stepOneWidget = <Widget>[
      Container(
        child: Text(
          '$score',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue),
        ),
        margin: EdgeInsets.only(bottom: 100),
      ),
      Container(
        height: 40,
        child: Marquee(
          text: lorem,
          style: TextStyle(fontSize: 24, letterSpacing: 2),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: 20,
          velocity: 50,
          pauseAfterRound: Duration(seconds: 10),
          startPadding: 0,
          accelerationDuration: Duration(seconds: 5),
          accelerationCurve: Curves.ease,
          decelerationCurve: Curves.easeOut,
          decelerationDuration: Duration(milliseconds: 500),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: TextField(
          autofocus: true,
          onChanged: onType,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Lets Type!',
          ),
        ),
      )
    ];

    if (step == stepStartButton)
      shownWidget = stepZeroWidget;
    else if (step == stepGettingInput)
      shownWidget = stepOneWidget;
    else if (step == stepGameOver)
      shownWidget = <Widget>[
        Text("You're not fast enough"),
        Text("Your Score: " + '$score'),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            child: Text('RESTART'),
            onPressed: restartGame,
          ),
        ),
      ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Keyboard Speed Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: shownWidget,
        ),
      ),
    );
  }
}
