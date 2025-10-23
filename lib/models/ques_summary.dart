import 'package:flutter/material.dart';

class QuesSummary extends StatelessWidget {
  const QuesSummary({super.key, required this.summarydata});
  final List<Map<String, Object>> summarydata;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      ((data['question_index'] as int) + 1).toString() + '. ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        data['question'] as String,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'Correct: ${data['correct_answer'] as String}',
                  style: TextStyle(color: Colors.green),
                ),
                Text(
                  'Your answer: ' + (data['user_answer'] as String),
                  style: TextStyle(color: Colors.blue),
                ),
                SizedBox(height: 12),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
