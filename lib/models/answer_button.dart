import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AnswerButton extends StatelessWidget {
  const AnswerButton( {super.key,required this.ans,required this.ontap});
  final String ans;
  final void Function() ontap;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40)
      ),
      child: Text(ans,style: GoogleFonts.lato(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
    );
  }
}
