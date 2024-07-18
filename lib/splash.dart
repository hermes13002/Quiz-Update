// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'seondscreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black12,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/exc.png',
              height: 350,
              width: 350,
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/excelsior.png',
              height: 250,
              width: 250,
            )
          ],
        ));
  }
}