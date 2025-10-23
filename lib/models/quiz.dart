import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/models/resultscreen.dart';
import 'package:second_app/models/start_screen.dart';
import 'package:second_app/models/question1.dart';

class Quiz1 extends StatefulWidget {
  const Quiz1({super.key});
  @override
  State<Quiz1> createState() {
    return Quiz1state();
  }
}

class Quiz1state extends State<Quiz1> {
  var activescreen = 'startscreen';
  void switchscreen() {
    setState(() {
      activescreen = 'questions';
    });
  }

  List<String> selectedans = [];

  void chooseans(String answer) {
    selectedans.add(answer);
    if (selectedans.length == questions.length) {
      setState(() {
        activescreen = 'resultscreen';
        //selectedans = [];
      });
    }
  }

  // void abc() {
  //   setState(() {
  //     activescreen = 'questions';
  //   });
  // }

  void restartQuiz() {
    setState(() {
      selectedans = [];
      activescreen = 'startscreen';
    });
  }

  var color1 = const Color.fromARGB(199, 2, 10, 240);
  var color2 = const Color.fromARGB(100, 55, 40, 44);
  @override
  Widget build(context) {
    Widget screenwidget = StartScreen(switchscreen);
    if (activescreen == 'questions') {
      screenwidget = Questionscreen(onselectedanswer: chooseans);
    }
    if (activescreen == 'resultscreen') {
      screenwidget = Resultscreen(
        chosenanswers: selectedans,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(child: screenwidget),
        ),
      ),
    );
  }
}
