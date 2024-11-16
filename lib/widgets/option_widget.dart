import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/utils/ui_helpers.dart';

class OptionWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String optionText;
  const OptionWidget({super.key, this.onPressed, required this.optionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.08,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 9),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          // minimumSize: const Size(300, 50),
          backgroundColor: Colors.black,
          foregroundColor: Colors.lightBlueAccent,
          textStyle: TextStyle(fontSize: 13.5.sp, fontWeight: FontWeight.w600, fontFamily: 'Poppins-Bold'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
            // side: const BorderSide(width: 3, color: Colors.blue)
          )
        ),
        child: Text(optionText),
      ),
    );
  }
}


