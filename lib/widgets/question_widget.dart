import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/utils/ui_helpers.dart';

class QuestionWidget extends StatefulWidget {
  final String questionText;
  const QuestionWidget({super.key, required this.questionText});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.35,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Text(widget.questionText, style: TextStyle(fontSize: 17.sp, fontFamily: 'Poppins-bold'),),
    );
  }
}
