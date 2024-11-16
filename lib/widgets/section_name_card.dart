import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/utils/ui_helpers.dart';

class SectionCard extends StatelessWidget {
  final String sectionName;
  const SectionCard({super.key, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * 0.05,
      width: screenWidth(context) * 0.3,
      child: Card(
        elevation: 3,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Center(child: Text(sectionName, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),))
      ),
    );
  }
}