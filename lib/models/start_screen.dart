import 'package:flutter/material.dart';
//import 'package:second_app/quiz.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.xyz, {super.key});
  final void Function() xyz;
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 92, 18, 220),
                const Color.fromARGB(255, 62, 47, 101),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/quiz-1.png"),
                SizedBox(height: 20),
                Text("Let's Start a quiz"),
                SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: xyz,
                  icon: Icon(Icons.arrow_right_alt),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(26, 249, 246, 246),
                    textStyle: TextStyle(fontSize: 10),
                  ),
                  label: Text("Start Quiz"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
