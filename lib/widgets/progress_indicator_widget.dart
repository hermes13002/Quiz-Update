import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int? currentIndex;
  const ProgressIndicatorWidget({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: currentIndex! / 15,
      backgroundColor: Colors.grey,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
      borderRadius: BorderRadius.circular(30),
      minHeight: 10,
    );
  }
}