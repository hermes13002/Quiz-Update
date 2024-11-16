import 'package:flutter/material.dart';
import 'package:quiz/dialogs/showquizdialog.dart';
import 'package:quiz/functions/contact_me.dart';
import 'package:quiz/widgets/option_widget.dart';
import 'package:quiz/widgets/question_widget.dart';
import 'package:quiz/widgets/section_name_card.dart';
import 'dart:async';
import '../section.dart';
import '../model/programming_question_model.dart';


class ProgrammingScreen extends StatefulWidget {
  const ProgrammingScreen({super.key});

  @override
  State<ProgrammingScreen> createState() => _ProgrammingScreenState();
}

class _ProgrammingScreenState extends State<ProgrammingScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int totalQuestions = 0;
  int maxAnswered = 15;

  void resetButton() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
    });
  }

  void _answerQuestion(String selectedAnswer) {
    setState(() {
      totalQuestions++;

      if (selectedAnswer == progQuestions[_currentIndex][2]) {
        _score++;
      }

      if (totalQuestions >= maxAnswered) {
        showQuizDialog();
      } else {
        if (_currentIndex < progQuestions.length - 1) {
          _currentIndex++;
        } else {
          // Quiz completed, show result or navigate to a new screen
          showQuizDialog();
          // }
        }
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SectionScreen()));
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(Icons.arrow_back_ios_new_rounded),
          )
        ),
        title: const Text('Excelsior Quiz App'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.lightBlueAccent,
        actions: [
          InkWell(
            onTap: () {contactButton(context);},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.contact_support_outlined)
            )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SectionCard(sectionName: 'Programming')
              ],
            ),

            // Gap(7),

            const SizedBox(
              height: 7,
            ),

            QuestionWidget(questionText: progQuestions[_currentIndex]['question']),

            Column(
              children: (progQuestions[_currentIndex]['options'] as List<String>).map((option) {
                return OptionWidget(
                  onPressed: () {_answerQuestion(option);}, 
                  optionText: option,  
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }


  Future<Object?> showQuizDialog() {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        int failed = 15 - _score;
        int scorePercent = ((_score / 15) * 100).round();

        return ShowQuizdialog(
          score: _score,
          scorePercent: scorePercent,
          failed: failed,
          onPressed: () {
            Navigator.of(context).pop();
            resetButton();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SectionScreen()));
          },
        );
      }
    );
  }

}


