import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:gap/gap.dart';
import 'package:quiz/utils/ui_helpers.dart';

class ShowQuizdialog extends StatefulWidget {
  final int score;
  final int scorePercent;
  final int failed;
  final void Function()? onPressed;
  const ShowQuizdialog({super.key, required this.score, required this.scorePercent, required this.failed, this.onPressed});

  @override
  State<ShowQuizdialog> createState() => _ShowQuizdialogState();
}

class _ShowQuizdialogState extends State<ShowQuizdialog> {
  late ConfettiController _confControllerLeft;
  late ConfettiController _confControllerRight;
  late ConfettiController _confControllerTop;
  late ConfettiController _confControllerBottom;

  @override
  void initState() {
    super.initState();
    _confControllerLeft = ConfettiController(duration: const Duration(seconds: 1));
    _confControllerRight = ConfettiController(duration: const Duration(seconds: 1));
    _confControllerTop = ConfettiController(duration: const Duration(seconds: 1));
    _confControllerBottom = ConfettiController(duration: const Duration(seconds: 1));
    
    if (widget.score >= 1) {
      _confControllerLeft.play();
      _confControllerRight.play();
      _confControllerTop.play();
      _confControllerBottom.play();
    }
  }

  @override
  void dispose() {
    _confControllerLeft.dispose();
    _confControllerRight.dispose();
    _confControllerTop.dispose();
    _confControllerBottom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(60),
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: const Color.fromARGB(255, 49, 49, 49),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset('assets/champ.png', height: screenHeight(context) * 0.3, width: screenWidth(context) * 0.6,),
                  
                  Container(
                    height: 200,
                    width: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3.0),
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('${widget.scorePercent}%', style: const TextStyle(color: Colors.purpleAccent, fontSize: 25, fontFamily: 'Poppins-bold'),),
                                
                                const SizedBox(
                                  height: 5,
                                ),
                                
                                const Text('Score Percentage',style: TextStyle(fontFamily: 'Rowdies'),),
                              ],
                            ),
            
                            const Column(
                              children: [
                                Text('15', style: TextStyle(color: Colors.lightGreen, fontSize: 25, )),
                                
                                SizedBox(
                                  height: 5,
                                ),
                                
                                Text('Total Questions', style: TextStyle(fontFamily: 'Rowdies'),),
                              ],
                            ),
                          ],
                        ),
            
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('${widget.score}', style: const TextStyle(color: Colors.lightBlueAccent, fontSize: 25, fontFamily: 'Poppins-bold'),),
                                
                                const SizedBox(
                                  height: 5,
                                ),
                                
                                const Text('Correct', style: TextStyle(fontFamily: 'Rowdies'),),
                              ],
                            ),
            
                            Column(
                              children: [
                                Text('${widget.failed}', style: const TextStyle(color: Colors.red, fontSize: 25, fontFamily: 'Poppins-bold'),),
                                
                                const SizedBox(
                                  height: 5,
                                ),
                                
                                const Text('Wrong',style: TextStyle(fontFamily: 'Rowdies'),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: widget.onPressed,
                      style: ElevatedButton.styleFrom(
                        elevation: 3.0,
                        minimumSize: const Size(170, 45),
                        backgroundColor: Colors.blue,
                        // foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontFamily: 'Poppins-Bold'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            // side: const BorderSide(width: 3, color: Colors.blue)
                          )
                      ),
                      child: const Text(
                        "Play Again",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // ConfettiWidget(
            //   confettiController: _confController,
            //   blastDirectionality: BlastDirectionality.explosive,
            //   shouldLoop: true,
            //   emissionFrequency: 0.07,
            //   numberOfParticles: 20,
            //   gravity: 0.5,
            //   colors: const [Colors.red, Colors.blue, Colors.green, Colors.orange],
            // ),

            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confControllerTop,
                blastDirection: pi / 2,
                maxBlastForce: 5, // set a lower max blast force
                minBlastForce: 2, // set a lower min blast force
                emissionFrequency: 0.05,
                numberOfParticles: 20, // a lot of particles at once
                gravity: 1,
                colors: const [Colors.red, Colors.blue, Colors.green, Colors.orange],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                confettiController: _confControllerBottom,
                blastDirection: -pi / 2,
                emissionFrequency: 0.01,
                numberOfParticles: 20,
                maxBlastForce: 100,
                minBlastForce: 80,
                gravity: 0.3,
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: ConfettiWidget(
                confettiController: _confControllerRight,
                blastDirection: pi, // radial value - LEFT
                particleDrag: 0.05, // apply drag to the confetti
                emissionFrequency: 0.05, // how often it should emit
                numberOfParticles: 20, // number of particles to emit
                gravity: 0.05, // gravity - or fall speed
                shouldLoop: false,
                colors: const [Colors.green,Colors.blue, Colors.pink], // manually specify the colors to be used
                strokeWidth: 1,
                strokeColor: Colors.white,
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: ConfettiWidget(
                confettiController: _confControllerLeft,
                blastDirection: 0, // radial value - RIGHT
                emissionFrequency: 0.6,
                // set the minimum potential size for the confetti (width, height)
                minimumSize: const Size(10, 10),
                // set the maximum potential size for the confetti (width, height)
                maximumSize: const Size(50, 50),
                numberOfParticles: 20,
                gravity: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}