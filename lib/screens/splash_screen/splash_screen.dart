import 'package:flutter/material.dart';
import 'package:quiz/screens/category_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //       const Duration(seconds: 5),
  //       () => Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => const Onboarding())));
  // }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 49, 49, 49),
      child: Center(
        child: const Text(
          'EXCELSIOR',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fade(duration: 500.ms).scale(delay: 500.ms) 
      
      ),
    );
  }
}