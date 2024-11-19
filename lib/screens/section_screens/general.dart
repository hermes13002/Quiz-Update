import 'package:flutter/material.dart';
import 'package:quiz/dialogs/showquizdialog.dart';
import 'package:quiz/utils/ui_helpers.dart';
import 'package:quiz/widgets/app_bar.dart';
import 'package:quiz/widgets/option_widget.dart';
import 'package:quiz/widgets/progress_indicator_widget.dart';
import 'package:quiz/widgets/question_widget.dart';
import 'dart:async';
import '../category_screen.dart';
import '../../data/general_question_data.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int totalQuestions = 0;
  int maxAnswered = 15;
  bool hasAnswered = false; // New variable to track answer selection
  String? _lastSelected;

  @override
  void initState() {
    super.initState();
    hasAnswered = false;
  }

  void resetButton() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      hasAnswered = false;
      _lastSelected = null;
    });
  }

  void _answerQuestion(String selectedAnswer) {
    setState(() {
      _lastSelected = selectedAnswer;
      hasAnswered = true; // Mark that an answer has been selected
      totalQuestions++;

      if (selectedAnswer == generalQuestions[_currentIndex]['correctAnswer']) {
        _score++;
      }
    });

    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      setState(() {
        if (totalQuestions >= maxAnswered) {
          showQuizDialog();
        } else {
          if (_currentIndex < generalQuestions.length - 1) {
            _currentIndex++;
            hasAnswered = false; // Reset for the next question
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
      appBar: const AppBarWidget(sectionTitle: 'General'),
      backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                  questionText: generalQuestions[_currentIndex]['question'],
                ),
              ),
          
              SizedBox(
                height: screenHeight(context) * 0.42,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: (generalQuestions[_currentIndex]['options'] as List<String>).map((option) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 1000),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: OptionWidget(
                        key: ValueKey<String>(option),
                        onPressed: hasAnswered
                            // ? null // Disable button after an answer is selected
                            ? (){}
                            : () {
                                _answerQuestion(option);
                              },
                        optionText: option,
                        borderside: hasAnswered
                            ? (option == generalQuestions[_currentIndex]['correctAnswer'])
                                ? const BorderSide(width: 5, color: Colors.green)
                                : (option == _lastSelected && option != generalQuestions[_currentIndex]['correctAnswer'])
                                    ? const BorderSide(width: 5, color: Colors.red)
                                    : const BorderSide()
                            : const BorderSide(),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
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
      },
    );
  }
}
