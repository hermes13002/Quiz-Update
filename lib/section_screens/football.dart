// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'package:flutter/material.dart';
import 'package:quiz/dialogs/showquizdialog.dart';
import 'package:quiz/data/football_question_data.dart';
import 'package:quiz/utils/ui_helpers.dart';
import 'package:quiz/widgets/app_bar.dart';
import 'package:quiz/widgets/option_widget.dart';
import 'package:quiz/widgets/progress_indicator_widget.dart';
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
  bool isButtonPressed = false;
  List<bool> _isCorrectAnswer = [];

  @override
  void initState() {
    super.initState();
    _isCorrectAnswer = List<bool>.filled(15, false);
  }

  void resetButton() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _isCorrectAnswer = List<bool>.filled(15, false);
    });
  }

  void _answerQuestion(String selectedAnswer) {
    setState(() {
      totalQuestions++;

      if (selectedAnswer == footballQuestions[_currentIndex]['correctAnswer']) {
        _score++;
        _isCorrectAnswer[_currentIndex] = true;
      } else {
        _isCorrectAnswer[_currentIndex] = false;
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (totalQuestions >= maxAnswered) {
          showQuizDialog();
        } else {
          if (_currentIndex < footballQuestions.length - 1) {
            _currentIndex++;
          } else {
            showQuizDialog();
          }
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(sectionTitle: 'Programming'),
      backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProgressIndicatorWidget(currentIndex: _currentIndex),

            AnimatedSwitcher(
              switchOutCurve: Curves.easeOut,
              switchInCurve: Curves.easeIn,
              duration: const Duration(milliseconds: 1000),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: QuestionWidget(
                key: ValueKey<int>(_currentIndex),
                questionText: footballQuestions[_currentIndex]['question']
              ),
            ),

            SizedBox(
              height: screenHeight(context) * 0.42,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: (footballQuestions[_currentIndex]['options'] as List<String>).map((option) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 1000),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: OptionWidget(
                      key: ValueKey<int>(_currentIndex),
                      onPressed: () {_answerQuestion(option);},
                      optionText: option,
                      borderside: _isCorrectAnswer[_currentIndex] && option == footballQuestions[_currentIndex]['correctAnswer']
                      ? const BorderSide(width: 5, color: Colors.green) : const BorderSide(),
                    ),
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