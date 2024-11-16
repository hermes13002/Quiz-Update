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



// class FadeQuestion extends StatefulWidget {
//   final String question;
//   final VoidCallback onComplete;

//   FadeQuestion({required this.question, required this.onComplete});

//   @override
//   _FadeQuestionState createState() => _FadeQuestionState();
// }

// class _FadeQuestionState extends State<FadeQuestion>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           widget.onComplete();
//         }
//       });
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _animation,
//       child: Center(child: Text(widget.question, style: TextStyle(fontSize: 24))),
//     );
//   }
// }
