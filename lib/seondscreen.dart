import 'package:flutter/material.dart';
import 'section.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80,
        ),
        Image.asset(
          'assets/quiz.png',
          height: 300,
          width: 300,
        ),
        const SizedBox(
          height: 35,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20), color: Colors.white),
          // child: Column(
          //   children: [
          //     const Text(
          //       'Are You Ready?',
          //       style: TextStyle(
          //           color: Colors.lightBlue,
          //           fontFamily: 'Poppins',
          //           fontSize: 35),
          //     ),
          //     const SizedBox(
          //       height: 15,
          //     ),
          //     ElevatedButton(
          //         onPressed: () => Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => const SectionScreen())),
          //         child: const Text("Let's Go"))
          //   ],
          // ),
          child: SizedBox(
            height: 70,
            width: 190,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                      elevation: 7.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(width: 5, color: Colors.white))),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SectionScreen()));
                },
                child: const Row(
                  children: [
                    Text('Continue',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.arrow_right_rounded, size: 40,)
                  ],
                ))),
        )
      ],
    ));
  }
}
