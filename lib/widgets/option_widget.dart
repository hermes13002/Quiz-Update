import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String optionText;
  const OptionWidget({super.key, this.onPressed, required this.optionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          minimumSize: const Size(300, 50),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins-Bold'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
            side: const BorderSide(width: 3, color: Colors.blue)
          )
        ),
        child: Text(optionText),
      ),
    );
  }
}


