// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'package:flutter/material.dart';
import 'package:quiz/dialogs/showquizdialog.dart';
import 'package:quiz/model/football_question_model.dart';
import 'package:quiz/utils/ui_helpers.dart';
import 'package:quiz/widgets/app_bar.dart';
import 'package:quiz/widgets/option_widget.dart';
import 'package:quiz/widgets/question_widget.dart';
import 'dart:async';
import '../section.dart';

class FootballScreen extends StatefulWidget {
  const FootballScreen({super.key});

  @override
  State<FootballScreen> createState() {return _FootballScreenState();}
}

class _FootballScreenState extends State<FootballScreen> {
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

      if (selectedAnswer == footballQuestions[_currentIndex]['correctAnswer']) {
        _score++;
      }

      if (totalQuestions >= maxAnswered) {
        showQuizDialog();
      } else {
        if (_currentIndex < footballQuestions.length - 1) {
          _currentIndex++;
        } else {
          // Quiz completed, show result or navigate to a new screen
          showQuizDialog();
        }
      }
    });
  }

  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(sectionTitle: 'Football'),
      backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QuestionWidget(questionText: footballQuestions[_currentIndex]['question'],),

            SizedBox(
              height: screenHeight(context) * 0.42,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: (footballQuestions[_currentIndex]['options'] as List<String>).map((option) {
                  return OptionWidget(
                    onPressed: () {_answerQuestion(option);}, 
                    optionText: option,  
                  );
                }).toList(),
              ),
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