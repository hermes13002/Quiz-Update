import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quiz/screens/intro_screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoarding())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 49, 49, 49),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'EXCELSIOR_01',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.sp,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins-bold',
                letterSpacing: 2
              ),
            ).animate(onPlay: (controller) => controller.repeat())
            .shimmer(duration: 1200.ms, color: Colors.lightBlueAccent)
            .animate()
            .fadeIn(duration: 1500.ms, curve: Curves.easeInOut)
            .then(delay: 50.ms)
            .slide(duration: 300.ms, begin: const Offset(0, -0.7), end: const Offset(0, 0))
            .then(delay: 50.ms)
            .slide(duration: 300.ms, begin: const Offset(0, 0), end: const Offset(0, -0.5))
            .then(delay: 50.ms)
            .slide(duration: 300.ms, begin: const Offset(0, -0.5), end: const Offset(0, 0)),

          ],
        )
      
      ),
    );
  }
}