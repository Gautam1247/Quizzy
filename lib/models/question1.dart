import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/models/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:second_app/models/quiz_ques.dart';

class Questionscreen extends StatefulWidget {
  const Questionscreen({super.key, required this.onselectedanswer});
  final void Function(String answer) onselectedanswer;
  @override
  State<Questionscreen> createState() {
    return _Questionscreen();
  }
}

class _Questionscreen extends State<Questionscreen> {
  var currentquesindex = 0;

  void index(String danswer) {
    widget.onselectedanswer(danswer);
    setState(() {
      currentquesindex++;
    });
  }

  @override
  Widget build(context) {
    final currentq = questions[currentquesindex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentq.ques,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...currentq.shuffledlist().map((answer) {
              return AnswerButton(
                ans: answer,
                ontap: () {
                  index(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
