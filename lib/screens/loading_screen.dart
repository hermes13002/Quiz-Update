import 'package:flutter/material.dart';
import 'package:animated_countdown/animated_countdown.dart';

class LoadingScreen extends StatefulWidget {
  final Widget quizScreen;
  const LoadingScreen({super.key, required this.quizScreen});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _displayCountDown = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 49, 49, 49),
        body: Stack(
            children: [
                if (_displayCountDown)
                Positioned.fill(
                    child: Center(
                        child: CountDownWidget(
                            totalDuration: 3,
                            maxTextSize: 150,
                            onEnd: () {
                            setState(() {
                                _displayCountDown = false;

                                Navigator.pushReplacement(context, 
                                    MaterialPageRoute(builder: (context) => widget.quizScreen),);
                            });
                            },
                            textStyle: const TextStyle(
                                color: Colors.white, 
                                fontWeight: FontWeight.w900, fontFamily: 'Poppins-bold'),
                        ),
                    ),
                )
            ],
        ),
    );
  }
}