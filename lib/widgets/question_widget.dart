import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String questionText;
  const QuestionWidget({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      // height: screenHeight(context) * 0.1,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all(color: Colors.white, width: 3.0),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Text(questionText, style: const TextStyle(fontSize: 20, fontFamily: 'Poppins-bold'),),
    );
  }
}