import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/functions/contact_me.dart';
import 'package:quiz/section.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String sectionTitle;
  const AppBarWidget({super.key, required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SectionScreen()));
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        )
      ),
      title: Text(sectionTitle, style: TextStyle(fontSize: 18.sp, fontFamily: 'Poppins-bold'),),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.lightBlueAccent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: () {contactButton(context);},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.contact_support_outlined, color: Colors.black,)
            )
          ),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50);
}