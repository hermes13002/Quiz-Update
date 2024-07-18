import 'package:flutter/material.dart';
import 'package:quiz/section.dart';

class ShowQuizDialog extends StatelessWidget {
  const ShowQuizDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(60),
          decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 3.0),
          borderRadius: BorderRadius.circular(30), color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/champ.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 10,
              ),
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
                            Text(
                              '$scorePercent%',
                              style: const TextStyle(
                                  color: Colors.purpleAccent,
                                  fontSize: 25,
                                  fontFamily: 'Poppins-bold'),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Score Percentage',
                              style: TextStyle(fontFamily: 'Rowdies'),
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            Text(
                              '15',
                              style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: 25,
                                  fontFamily: 'Poppins-bold'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Total Questions',
                              style: TextStyle(fontFamily: 'Rowdies'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '$_score',
                              style: const TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 25,
                                  fontFamily: 'Poppins-bold'),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Correct',
                              style: TextStyle(fontFamily: 'Rowdies'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '$failed',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                  fontFamily: 'Poppins-bold'),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Wrong',
                              style: TextStyle(fontFamily: 'Rowdies'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetButton();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SectionScreen()));
                },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}