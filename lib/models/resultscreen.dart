import 'package:flutter/material.dart';
//import 'package:second_app/models/quiz.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/models/ques_summary.dart';
//import 'package:second_app/models/quiz.dart';

class Resultscreen extends StatelessWidget {
  const Resultscreen({super.key, required this.chosenanswers, required this.onRestart});
  final List<String> chosenanswers;
  final void Function() onRestart;
  List<Map<String, Object>> getsummarydata() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenanswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].ques,
        'correct_answer': questions[i].ans[0],
        'user_answer': chosenanswers[i],
      });
    }
    return summary;
  }
  @override
  Widget build(context) {
    final summarydata = getsummarydata();
    final totalques = questions.length;
    final correctanschosen = summarydata.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctanschosen out of $totalques questions correctly',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            QuesSummary(summarydata: summarydata),
            TextButton(
              onPressed: onRestart,
              child: Text("Restart quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
