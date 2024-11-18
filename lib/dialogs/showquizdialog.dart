import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
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
   var controller = ConfettiController();

   @override
  void initState() {
    super.initState();
    controller = ConfettiController();

    if (widget.score >= 11) {
      double randomInRange(double min, double max) {
        return min + Random().nextDouble() * (max - min);
      }

      int total = 60;
      int progress = 0;

      Timer.periodic(const Duration(milliseconds: 250), (timer) {
        progress++;

        if (progress >= total) {
          timer.cancel();
          return;
        }

        int count = ((1 - progress / total) * 50).toInt();

        Confetti.launch(
          context,
          options: ConfettiOptions(
              particleCount: count,
              startVelocity: 30,
              spread: 360,
              ticks: 60,
              x: randomInRange(0.1, 0.3),
              y: Random().nextDouble() - 0.2),
        );
        Confetti.launch(
          context,
          options: ConfettiOptions(
              particleCount: count,
              startVelocity: 30,
              spread: 360,
              ticks: 60,
              x: randomInRange(0.7, 0.9),
              y: Random().nextDouble() - 0.2),
        );
      });
    }
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
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 48),
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
                    height: screenHeight(context) * 0.25,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration( borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('${widget.scorePercent}%', style: TextStyle(color: Colors.purpleAccent, fontSize: 25.sp, fontFamily: 'Poppins-bold'),),
                                
                                const Gap(5),
                                
                                const Text('Score Percentage',style: TextStyle(color: Colors.white, fontFamily: 'Rowdies'),),
                              ],
                            ),
            
                            Column(
                              children: [
                                Text('15', style: TextStyle(color: Colors.lightGreen, fontSize: 25.sp, fontFamily: 'Poppins-bold')),
                                
                                const Gap(5),
                                
                                const Text('Total Questions', style: TextStyle(color: Colors.white, fontFamily: 'Rowdies'),),
                              ],
                            ),
                          ],
                        ),
            
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('${widget.score}', style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.sp, fontFamily: 'Poppins-bold'),),
                                
                                const Gap(5),
                                
                                const Text('Correct', style: TextStyle(color: Colors.white, fontFamily: 'Rowdies'),),
                              ],
                            ),
            
                            Column(
                              children: [
                                Text('${widget.failed}', style: TextStyle(color: Colors.red, fontSize: 25.sp, fontFamily: 'Poppins-bold'),),
                                
                                const Gap(5),
                                
                                const Text('Wrong',style: TextStyle(color: Colors.white, fontFamily: 'Rowdies'),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    height: screenHeight(context) * 0.065,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: widget.onPressed,
                      style: ElevatedButton.styleFrom(
                        elevation: 3.0,
                        // minimumSize: const Size(170, 45),
                        backgroundColor: Colors.blue,
                        // foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontFamily: 'Poppins-Bold'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                      ),
                      child: const Text("Play Again", style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}





