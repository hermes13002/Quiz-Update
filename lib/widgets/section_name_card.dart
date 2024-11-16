import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String sectionName;
  const SectionCard({super.key, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: Card(
        elevation: 3,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          children: [
            const SizedBox(height: 13,),

            Text(sectionName, textAlign: TextAlign.center,),
          ],
        )
      ),
    );
  }
}